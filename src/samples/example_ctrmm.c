
#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <sys/time.h>
/* Include CLBLAS header. It automatically includes needed OpenCL header,
 * so we can drop out explicit inclusion of cl.h header.
 */
#include <clBLAS.h>
#define M  500
#define N  500
/* This example uses predefined matrices and their characteristics for
 * simplicity purpose.
 */
static const clblasOrder order = clblasRowMajor;
static const clblasSide side = clblasLeft;


static const cl_float2  alpha = {10.0,0.0};

static const clblasTranspose transA = clblasNoTrans;
static const clblasUplo uploA = clblasUpper;
static const clblasDiag diagA = clblasNonUnit;
static  cl_float2 A[M*M] = {};
static const size_t lda = M;            /* i.e. lda = M */

static cl_float2 B[M*N] = {};
static const size_t ldb = N;            /* i.e. ldb = N */

static cl_float2 result[M * N];             /* ldb * M */

static const size_t off  = 0;
static const size_t offA = 0;       /* K + off */
static const size_t offB = 0;       /* N + off */

static void
printResult(const char* str)
{
    size_t i, j, nrows;

    printf("%s:\n", str);

    nrows = (sizeof(result) / sizeof(cl_float2)) / ldb;
    for (i = 0; i < nrows; i++) {
        for (j = 0; j < ldb; j++) {
            printf("{%f,%f} ", result[i * ldb + j].s[0],result[i * ldb + j].s[1]);
        }
        printf("\n");
    }
}

int
main(void)
{
    srand((unsigned int)time(NULL));
    for (size_t i = 0; i < M; i++){
        for (size_t  j= 0; j < M; j++)
            if (j>=i)
            {
                A[M*i+j].s[0] = 1.0 * ( rand() % RAND_MAX ) / RAND_MAX * 100;
                A[M*i+j].s[1] = 1.0 * ( rand() % RAND_MAX ) / RAND_MAX * 100;
            }
    }
    srand((unsigned int)time(NULL));
    for (size_t i = 0; i < M; i++){
        for (size_t  j= 0; j < N; j++)
        {
               B[N*i+j].s[0] = 1.0 * ( rand() % RAND_MAX ) / RAND_MAX * 100;
               B[N*i+j].s[1] = 1.0 * ( rand() % RAND_MAX ) / RAND_MAX * 100;
        }
    }
        
    struct  timeval start;
    struct  timeval end;
    //记录两个时间差
    unsigned  long diff;
    cl_int err;
    cl_platform_id platform = 0;
    cl_device_id device = 0;
    cl_context_properties props[3] = { CL_CONTEXT_PLATFORM, 0, 0 };
    cl_context ctx = 0;
    cl_command_queue queue = 0;
    cl_mem bufA, bufB;
    cl_event event = NULL;
    int ret = 0;

    /* Setup OpenCL environment. */
    err = clGetPlatformIDs(1, &platform, NULL);
    if (err != CL_SUCCESS) {
        printf( "clGetPlatformIDs() failed with %d\n", err );
        return 1;
    }

    err = clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1, &device, NULL);
    if (err != CL_SUCCESS) {
        printf( "clGetDeviceIDs() failed with %d\n", err );
        return 1;
    }

    props[1] = (cl_context_properties)platform;
    ctx = clCreateContext(props, 1, &device, NULL, NULL, &err);
    if (err != CL_SUCCESS) {
        printf( "clCreateContext() failed with %d\n", err );
        return 1;
    }

    queue = clCreateCommandQueue(ctx, device, 0, &err);
    if (err != CL_SUCCESS) {
        printf( "clCreateCommandQueue() failed with %d\n", err );
        clReleaseContext(ctx);
        return 1;
    }

    /* Setup clblas. */
    err = clblasSetup();
    if (err != CL_SUCCESS) {
        printf("clblasSetup() failed with %d\n", err);
        clReleaseCommandQueue(queue);
        clReleaseContext(ctx);
        return 1;
    }

    /* Prepare OpenCL memory objects and place matrices inside them. */
    bufA = clCreateBuffer(ctx, CL_MEM_READ_ONLY, M * M * sizeof(*A),
                          NULL, &err);
    bufB = clCreateBuffer(ctx, CL_MEM_READ_WRITE, M * N * sizeof(*B),
                          NULL, &err);

    err = clEnqueueWriteBuffer(queue, bufA, CL_TRUE, 0,
        M * M * sizeof(*A), A, 0, NULL, NULL);
    err = clEnqueueWriteBuffer(queue, bufB, CL_TRUE, 0,
        M * N * sizeof(*B), B, 0, NULL, NULL);

    //第一次获取时间，即表示开始记时
    gettimeofday(&start,NULL);
    /* Call clblas extended function. Perform TRMM for the lower right sub-matrices */
    err = clblasCtrmm(order, side, uploA, transA, diagA, M - off, N - off,
                         alpha, bufA, offA, lda, bufB, offB, ldb, 1, &queue,
                         0, NULL, &event);
    if (err != CL_SUCCESS) {
        printf("clblasStrmmEx() failed with %d\n", err);
        ret = 1;
    }
    else {
        /* Wait for calculations to be finished. */
        err = clWaitForEvents(1, &event);
        gettimeofday(&end,NULL);
        diff = 1000000 * (end.tv_sec-start.tv_sec)+ end.tv_usec-start.tv_usec;
        printf("clblasCtrmm Time: %lf ms\n",(double)diff/1000.0);

        /* Fetch results of calculations from GPU memory. */
        err = clEnqueueReadBuffer(queue, bufB, CL_TRUE, 0,
                                  M * N * sizeof(*result),
                                  result, 0, NULL, NULL);

        /* At this point you will get the result of STRMM placed in 'result' array. */
        puts("");
        // printResult("clblasCtrmmEx result");
          //第二次获取时间，即表示结束记时
    }

    /* Release OpenCL events. */
    clReleaseEvent(event);

    /* Release OpenCL memory objects. */
    clReleaseMemObject(bufB);
    clReleaseMemObject(bufA);

    /* Finalize work with clblas. */
    clblasTeardown();

    /* Release OpenCL working objects. */
    clReleaseCommandQueue(queue);
    clReleaseContext(ctx);

    return ret;
}

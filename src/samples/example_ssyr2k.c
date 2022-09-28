/* ************************************************************************
 * Copyright 2013 Advanced Micro Devices, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ************************************************************************/


#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include<sys/time.h>
/* Include CLBLAS header. It automatically includes needed OpenCL header,
 * so we can drop out explicit inclusion of cl.h header.
 */
#include <clBLAS.h>

/* This example uses predefined matrices and their characteristics for
 * simplicity purpose.
 */
static const clblasOrder order = clblasRowMajor;
static const clblasUplo uplo = clblasUpper;
static const clblasTranspose transAB = clblasNoTrans;
#define  N 500
#define  K 400
// static const size_t N = 5;
// static const size_t K = 4;

static const cl_float alpha = 10;

static  cl_float A[N*K] ;
static const size_t lda = K;
// static const cl_float A[] = {
//     11, 12, 13, 14,
//     21, 22, 23, 24,
//     31, 32, 33, 34,
//     41, 42, 43, 44,
//     51, 52, 53, 54
// };
// static const size_t lda = 4;        /* i.e. lda = K */

static cl_float B[N*K] ;
static const size_t ldb = K;
// static cl_float B[] = {
//     11, 12, 13, 14,
//     21, 22, 23, 24,
//     31, 32, 33, 34,
//     41, 42, 43, 44,
//     51, 52, 53, 54
// };
// static const size_t ldb = 4;        /* i.e. ldb = K */

static const cl_float beta = 20;

static cl_float C[N*N] ;
static const size_t ldc = N;
// static cl_float C[] = {
//     11, 12, 13, 14, 15,
//     12, 22, 23, 24, 25,
//     13, 23, 33, 34, 35,
//     14, 24, 34, 44, 45,
//     15, 25, 35, 45, 55
// };
// static const size_t ldc = 5;        /* i.e. ldc = N */

static cl_float result[N*N];        /* ldc * N */

const size_t off  = 0;
static const size_t offA = 0;   /* K + off */
static const size_t offB = 0;   /* K + off */
static const size_t offC = 0;   /* N + off */
// const size_t off  = 1;
// static const size_t offA = 4 + 1;   /* K + off */
// static const size_t offB = 4 + 1;   /* K + off */
// static const size_t offC = 5 + 1;   /* N + off */

static void
printResult(const char* str)
{
    size_t i, j, nrows;

    printf("%s:\n", str);

    nrows = (sizeof(result) / sizeof(cl_float)) / ldc;
    for (i = 0; i < nrows; i++) {
        for (j = 0; j < ldc; j++) {
            printf("%d ", (int)result[i * ldc + j]);
        }
        printf("\n");
    }
}

int
main(void)
{
    srand((unsigned int)time(NULL));
    for (size_t i = 0; i < N; i++)
        for (size_t j = 0; j < K; j++)
        {
            A[i*K+j]=rand()%100;
            B[i*K+j]=rand()%100;
        }

    srand((unsigned int)time(NULL));
    for (size_t i = 0; i < N; i++)
        for (size_t j = 0; j < N; j++)
            C[i*N+j]=rand()%100;
        
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
    cl_mem bufA, bufB, bufC;
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
    bufA = clCreateBuffer(ctx, CL_MEM_READ_ONLY, N * K * sizeof(*A),
                          NULL, &err);
    bufB = clCreateBuffer(ctx, CL_MEM_READ_ONLY, N * K * sizeof(*B),
                          NULL, &err);
    bufC = clCreateBuffer(ctx, CL_MEM_READ_WRITE, N * N * sizeof(*C),
                          NULL, &err);

    err = clEnqueueWriteBuffer(queue, bufA, CL_TRUE, 0,
        N * K * sizeof(*A), A, 0, NULL, NULL);
    err = clEnqueueWriteBuffer(queue, bufB, CL_TRUE, 0,
        N * K * sizeof(*B), B, 0, NULL, NULL);
    err = clEnqueueWriteBuffer(queue, bufC, CL_TRUE, 0,
        N * N * sizeof(*C), C, 0, NULL, NULL);

    gettimeofday(&start,NULL);
    /* Call clblas extended function. Perform SYR2K for the lower right sub-matrices */
    err = clblasSsyr2k(order, uplo, transAB, N - off, K - off,
                         alpha, bufA, offA, lda, bufB, offB, ldb,
                         beta, bufC, offC, ldc, 1, &queue,
                         0, NULL, &event);

    if (err != CL_SUCCESS) {
        printf("clblasSsyr2kEx() failed with %d\n", err);
        ret = 1;
    }
    else {
        /* Wait for calculations to be finished. */
        err = clWaitForEvents(1, &event);
        gettimeofday(&end,NULL);
        diff = 1000000 * (end.tv_sec-start.tv_sec)+ end.tv_usec-start.tv_usec;
        printf("clblasSsyr2k Time: %lf ms\n",(double)diff/1000.0);

        /* Fetch results of calculations from GPU memory. */
        err = clEnqueueReadBuffer(queue, bufC, CL_TRUE, 0,
                                  N * N * sizeof(*result),
                                  result, 0, NULL, NULL);

        /* At this point you will get the result of SSYR2K placed in 'result' array. */
        puts("");
        // printResult("clblasSsyr2kEx result");
    }

    /* Release OpenCL events. */
    clReleaseEvent(event);

    /* Release OpenCL memory objects. */
    clReleaseMemObject(bufC);
    clReleaseMemObject(bufB);
    clReleaseMemObject(bufA);

    /* Finalize work with clblas. */
    clblasTeardown();

    /* Release OpenCL working objects. */
    clReleaseCommandQueue(queue);
    clReleaseContext(ctx);

    return ret;
}

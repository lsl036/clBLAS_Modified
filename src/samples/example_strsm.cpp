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

/* Include CLBLAS header. It automatically includes needed OpenCL header,
 * so we can drop out explicit inclusion of cl.h header.
 */
#include <clBLAS.h>

/* This example uses predefined matrices and their characteristics for
 * simplicity purpose.
 */
// clblasColumnMajor clblasRowMajor
// static const clblasOrder order = clblasColumnMajor;
static const clblasOrder order = clblasRowMajor;
static const clblasSide side = clblasLeft;
static const clblasTranspose transA = clblasNoTrans;
static const clblasUplo uploA = clblasUpper;
static const clblasDiag diagA = clblasNonUnit;

static const cl_float alpha = 10;
static const size_t M = 64;
static const size_t N = 64;

//Specifies the leading dimension of A as declared in the calling (sub)program. When side = CblasLeft, then lda must be at least max(1, m), when side = CblasRight, then lda must be at least max(1, n).
static const size_t lda = M;

// Specifies the leading dimension of B as declared in the calling (sub)program. When Layout = CblasColMajor, ldb must be at least max(1, m); otherwise, ldb must be at least max(1, n).
static const size_t ldb = N;

// // Array, size lda* k , where k is m when side = CblasLeft and is n when side = CblasRight. Before entry with uplo = CblasUpper, the leading k by k upper triangular part of the array a must contain the upper triangular matrix and the strictly lower triangular part of a is not referenced.
// Before entry with uplo = CblasLower lower triangular part of the array a must contain the lower triangular matrix and the strictly upper triangular part of a is not referenced.
// When diag = CblasUnit, the diagonal elements of a are not referenced either, but are assumed to be unity.
static cl_float A[lda * M]; // 4 x 4

// For Layout = ClblasColMajor: array, size ldb*n. Before entry, the leading m-by-n part of the array b must contain the matrix B.
// For Layout = ClblasRowMajor: array, size ldb*m. Before entry, the leading n-by-m part of the array b must contain the matrix B.
static cl_float B[ldb * M];         // 5 * 4
static cl_float result[ldb * M];    // 5 * 4     

static const size_t off  = 0;
static const size_t offA = 0;   /* M + off */
static const size_t offB = 0;   /* N + off */

static void
makeScaledIdentity(cl_float* matx, size_t M, size_t N, float scale )
{
    for( size_t i = 0; i < M; ++i )
        for (size_t j = 0; j < N; ++j)
        {
            matx[i * M + j] = 0.0f;
            if( i == j )
                matx[i * M + j] = 1.0f * scale;
        }

}

static void
printResult(const char* str)
{
    size_t i, j, nrows;

    printf("%s:\n", str);

    nrows = (sizeof(result) / sizeof(cl_float)) / ldb;
    for (i = 0; i < nrows; i++) {
        for (j = 0; j < ldb; j++) {
            printf("%.5e ", result[i * ldb + j]);
        }
        printf("\n");
    }
}

static void
printMatrix(const cl_float *mat, clblasOrder order, size_t M , size_t N )
{
    printf("\n");
    if (order == clblasColumnMajor)
    {
        for (size_t i = 0; i < M; i++) {
            for (size_t j = 0; j < N; j++) {
                printf("%.5e ", mat[j * M + i]);
            }
            printf("\n");
        }
    }
    else if (order == clblasRowMajor)
    {
        for (size_t i = 0; i < M; i++) {
            for (size_t j = 0; j < N; j++) {
                printf("%.5e ", mat[i * N + j]);
            }
            printf("\n");
        }
    }
}

int
main(void)
{
    cl_int err;
    cl_platform_id platform = 0;
    cl_device_id device = 0;
    cl_context_properties props[3] = { CL_CONTEXT_PLATFORM, 0, 0 };
    cl_context ctx = 0;
    cl_command_queue queue = 0;
    cl_mem bufA, bufB;
    cl_event event = NULL;
    int ret = 0;

    // makeScaledIdentity( A, lda, M, 1.0f );
    // makeScaledIdentity( B, ldb, N, 1.0f);
    // makeScaledIdentity( result, ldb, N, 0.0f);
    for (size_t i = 0; i < lda; i++)
    {
        for (size_t j = 0; j < M; j++)
        {
            if (j >= i)
                // A[j * lda + i] = (i+1)*10+(j+1);
                A[i * M + j] = (i+1)*10+(j+1);
            else
                // A[j * lda + i] = 0.0f;
                A[i * M + j] = 0.0f;
        }
    }
    for (size_t i = 0; i < M; i++)
    {
        for (size_t j = 0; j < ldb; j++)
        {
            B[ i * ldb + j] = (i+1)*10 + (j+1);
            result[ i * ldb + j] = 0.0f;
        }
    }

    printf ("A = \n");
    printMatrix(A, order, M, M);
    // for (size_t i = 0; i < M*M; i++) {
    //     printf("%.5e ", A[i]);
    // }
    printf ("B = \n");
    // for (size_t i = 0; i < M*N; i++) {
    //     printf("%.5e ", B[i]);
    // }
    printMatrix(B, order, M, N);
    /* Setup OpenCL environment. */
    err = clGetPlatformIDs( 1 , &platform, NULL);
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

    // queue = clCreateCommandQueue(ctx, device, 0, &err);
    queue = clCreateCommandQueueWithProperties(ctx, device, 0, &err);
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

    /* Call clblas function. Perform TRSM for the lower right sub-matrices */
    // A is identity matrix
    // B is identity matrix
    // Solving for identity matrices should yield an identity matrix scaled by alpha
    err = clblasStrsm(order, side, uploA, transA, diagA, M - off, N - off,
                         alpha, bufA, offA, lda, bufB, offB, ldb, 1, &queue, 0,
                         NULL, &event);
    if (err != CL_SUCCESS) {
        printf("clblasStrsmEx() failed with %d\n", err);
        ret = 1;
    }
    else {
        /* Wait for calculations to be finished. */
        err = clWaitForEvents(1, &event);

        /* Fetch results of calculations from opencl memory. */
        err = clEnqueueReadBuffer(queue, bufB, CL_TRUE, 0,
                                  M * N * sizeof(*result),
                                  result, 0, NULL, NULL);

        // At this point, 'result' should contain a scaled identity matrix
        puts("");
        printResult("clblasStrsm result");
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

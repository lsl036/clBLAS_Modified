/*******************************************************************************
 * This file was auto-generated using the AutoGemm.py python script.
 * DO NOT modify this file! Instead, make changes to scripts in
 *   clBLAS/src/library/blas/AutoGemm/ then re-generate files
 *   (otherwise local changes will be lost after re-generation).
 ******************************************************************************/

#include <clBLAS.h>
#include "AutoGemmIncludes/AutoGemmKernelSources.h"
#include "AutoGemmIncludes/AutoGemmKernelBinaries.h"
#include "AutoGemmIncludes/AutoGemmKernelBuildOptionsSource.h"
#include "AutoGemmIncludes/AutoGemmKernelBuildOptionsBinary.h"
#include "AutoGemmIncludes/AutoGemmClKernels.h"

#define EXACT_MULTIPLES(MULTIPLE_STR) MULTIPLE_STR

// kernel selection logic template
template<typename Precision>
void gemmSelectKernel(
  clblasOrder order,
  clblasTranspose transA,
  clblasTranspose transB,
  size_t M,
  size_t N,
  size_t K,
  bool betaNonZero,
  float optimalNumElementsPerWorkItem,
  const char **tileKernelSource,
  const char **rowKernelSource,
  const char **colKernelSource,
  const char **cornerKernelSource,
  const char **sourceBuildOptions,
  const unsigned char **tileKernelBinary,
  const unsigned char **rowKernelBinary,
  const unsigned char **colKernelBinary,
  const unsigned char **cornerKernelBinary,
  size_t **tileKernelBinarySize,
  size_t **rowKernelBinarySize,
  size_t **colKernelBinarySize,
  size_t **cornerKernelBinarySize,
  const char **binaryBuildOptions,
  cl_kernel  **tileClKernel,
  cl_kernel  **rowClKernel,
  cl_kernel  **colClKernel,
  cl_kernel  **cornerClKernel,
  unsigned int *workGroupNumRows,
  unsigned int *workGroupNumCols,
  unsigned int *microTileNumRows,
  unsigned int *microTileNumCols,
  unsigned int *unroll
);


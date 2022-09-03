#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "clBLAS" for configuration "Debug"
set_property(TARGET clBLAS APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(clBLAS PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "/usr/lib/x86_64-linux-gnu/mwv207/libOpenCL.so;m;pthread"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib64/libclBLAS.so.2.12.0"
  IMPORTED_SONAME_DEBUG "libclBLAS.so.2"
  )

list(APPEND _IMPORT_CHECK_TARGETS clBLAS )
list(APPEND _IMPORT_CHECK_FILES_FOR_clBLAS "${_IMPORT_PREFIX}/lib64/libclBLAS.so.2.12.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)

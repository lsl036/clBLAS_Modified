# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lsl/clBLAS-2.12/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lsl/clBLAS-2.12/src/build

# Include any dependencies generated for this target.
include samples/CMakeFiles/example_chpmv.dir/depend.make

# Include the progress variables for this target.
include samples/CMakeFiles/example_chpmv.dir/progress.make

# Include the compile flags for this target's objects.
include samples/CMakeFiles/example_chpmv.dir/flags.make

samples/CMakeFiles/example_chpmv.dir/example_chpmv.c.o: samples/CMakeFiles/example_chpmv.dir/flags.make
samples/CMakeFiles/example_chpmv.dir/example_chpmv.c.o: ../samples/example_chpmv.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lsl/clBLAS-2.12/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object samples/CMakeFiles/example_chpmv.dir/example_chpmv.c.o"
	cd /home/lsl/clBLAS-2.12/src/build/samples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/example_chpmv.dir/example_chpmv.c.o   -c /home/lsl/clBLAS-2.12/src/samples/example_chpmv.c

samples/CMakeFiles/example_chpmv.dir/example_chpmv.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/example_chpmv.dir/example_chpmv.c.i"
	cd /home/lsl/clBLAS-2.12/src/build/samples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/lsl/clBLAS-2.12/src/samples/example_chpmv.c > CMakeFiles/example_chpmv.dir/example_chpmv.c.i

samples/CMakeFiles/example_chpmv.dir/example_chpmv.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/example_chpmv.dir/example_chpmv.c.s"
	cd /home/lsl/clBLAS-2.12/src/build/samples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/lsl/clBLAS-2.12/src/samples/example_chpmv.c -o CMakeFiles/example_chpmv.dir/example_chpmv.c.s

# Object files for target example_chpmv
example_chpmv_OBJECTS = \
"CMakeFiles/example_chpmv.dir/example_chpmv.c.o"

# External object files for target example_chpmv
example_chpmv_EXTERNAL_OBJECTS =

samples/example_chpmv: samples/CMakeFiles/example_chpmv.dir/example_chpmv.c.o
samples/example_chpmv: samples/CMakeFiles/example_chpmv.dir/build.make
samples/example_chpmv: /usr/lib/x86_64-linux-gnu/mwv207/libOpenCL.so
samples/example_chpmv: library/libclBLAS.so.2.12.0
samples/example_chpmv: /usr/lib/x86_64-linux-gnu/mwv207/libOpenCL.so
samples/example_chpmv: samples/CMakeFiles/example_chpmv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lsl/clBLAS-2.12/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable example_chpmv"
	cd /home/lsl/clBLAS-2.12/src/build/samples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_chpmv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
samples/CMakeFiles/example_chpmv.dir/build: samples/example_chpmv

.PHONY : samples/CMakeFiles/example_chpmv.dir/build

samples/CMakeFiles/example_chpmv.dir/clean:
	cd /home/lsl/clBLAS-2.12/src/build/samples && $(CMAKE_COMMAND) -P CMakeFiles/example_chpmv.dir/cmake_clean.cmake
.PHONY : samples/CMakeFiles/example_chpmv.dir/clean

samples/CMakeFiles/example_chpmv.dir/depend:
	cd /home/lsl/clBLAS-2.12/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lsl/clBLAS-2.12/src /home/lsl/clBLAS-2.12/src/samples /home/lsl/clBLAS-2.12/src/build /home/lsl/clBLAS-2.12/src/build/samples /home/lsl/clBLAS-2.12/src/build/samples/CMakeFiles/example_chpmv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : samples/CMakeFiles/example_chpmv.dir/depend

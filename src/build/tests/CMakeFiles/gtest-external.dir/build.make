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

# Utility rule file for gtest-external.

# Include the progress variables for this target.
include tests/CMakeFiles/gtest-external.dir/progress.make

tests/CMakeFiles/gtest-external: tests/CMakeFiles/gtest-external-complete


tests/CMakeFiles/gtest-external-complete: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-install
tests/CMakeFiles/gtest-external-complete: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-mkdir
tests/CMakeFiles/gtest-external-complete: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-download
tests/CMakeFiles/gtest-external-complete: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-update
tests/CMakeFiles/gtest-external-complete: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-patch
tests/CMakeFiles/gtest-external-complete: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-configure
tests/CMakeFiles/gtest-external-complete: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-build
tests/CMakeFiles/gtest-external-complete: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/lsl/clBLAS-2.12/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'gtest-external'"
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E make_directory /home/lsl/clBLAS-2.12/src/build/tests/CMakeFiles
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E touch /home/lsl/clBLAS-2.12/src/build/tests/CMakeFiles/gtest-external-complete
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E touch /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-done

tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-install: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/lsl/clBLAS-2.12/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No install step for 'gtest-external'"
	cd /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-build && /usr/bin/cmake -E echo_append
	cd /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-build && /usr/bin/cmake -E touch /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-install

tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/lsl/clBLAS-2.12/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'gtest-external'"
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E make_directory /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E make_directory /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-build
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E make_directory /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E make_directory /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/tmp
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E make_directory /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E make_directory /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E make_directory /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E touch /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-mkdir

tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-download: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-urlinfo.txt
tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-download: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/lsl/clBLAS-2.12/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (download, verify and extract) for 'gtest-external'"
	cd /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src && /usr/bin/cmake -P /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp/download-gtest-external.cmake
	cd /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src && /usr/bin/cmake -P /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp/verify-gtest-external.cmake
	cd /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src && /usr/bin/cmake -P /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp/extract-gtest-external.cmake
	cd /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src && /usr/bin/cmake -E touch /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-download

tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-update: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/lsl/clBLAS-2.12/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'gtest-external'"
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E echo_append
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E touch /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-update

tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-patch: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/lsl/clBLAS-2.12/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'gtest-external'"
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E echo_append
	cd /home/lsl/clBLAS-2.12/src/build/tests && /usr/bin/cmake -E touch /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-patch

tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-configure: tests/gtest-external-prefix/tmp/gtest-external-cfgcmd.txt
tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-configure: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-update
tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-configure: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/lsl/clBLAS-2.12/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'gtest-external'"
	cd /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-build && /usr/bin/cmake "-GUnix Makefiles" -C/home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/tmp/gtest-external-cache-Debug.cmake /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external
	cd /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-build && /usr/bin/cmake -E touch /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-configure

tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-build: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/lsl/clBLAS-2.12/src/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'gtest-external'"
	cd /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-build && $(MAKE)
	cd /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-build && /usr/bin/cmake -E touch /home/lsl/clBLAS-2.12/src/build/tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-build

gtest-external: tests/CMakeFiles/gtest-external
gtest-external: tests/CMakeFiles/gtest-external-complete
gtest-external: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-install
gtest-external: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-mkdir
gtest-external: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-download
gtest-external: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-update
gtest-external: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-patch
gtest-external: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-configure
gtest-external: tests/gtest-external-prefix/src/gtest-external-stamp/gtest-external-build
gtest-external: tests/CMakeFiles/gtest-external.dir/build.make

.PHONY : gtest-external

# Rule to build all files generated by this target.
tests/CMakeFiles/gtest-external.dir/build: gtest-external

.PHONY : tests/CMakeFiles/gtest-external.dir/build

tests/CMakeFiles/gtest-external.dir/clean:
	cd /home/lsl/clBLAS-2.12/src/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/gtest-external.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/gtest-external.dir/clean

tests/CMakeFiles/gtest-external.dir/depend:
	cd /home/lsl/clBLAS-2.12/src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lsl/clBLAS-2.12/src /home/lsl/clBLAS-2.12/src/tests /home/lsl/clBLAS-2.12/src/build /home/lsl/clBLAS-2.12/src/build/tests /home/lsl/clBLAS-2.12/src/build/tests/CMakeFiles/gtest-external.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/gtest-external.dir/depend


# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hayden/prj/mlir_demo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hayden/prj/mlir_demo/build

# Include any dependencies generated for this target.
include CMakeFiles/mlir_demo.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/mlir_demo.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/mlir_demo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mlir_demo.dir/flags.make

LasmCDialectOps.cpp.inc: ../include/LasmC/LasmCDialect.td
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hayden/prj/mlir_demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating LasmCDialectOps.cpp.inc"
	/usr/local/bin/mlir-tblgen -I/usr/local/include/mlir -I/usr/local/include/mlir/IR -gen-op-defs -o /home/hayden/prj/mlir_demo/build/LasmCDialectOps.cpp.inc /home/hayden/prj/mlir_demo/include/LasmC/LasmCDialect.td

CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.o: CMakeFiles/mlir_demo.dir/flags.make
CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.o: ../lib/LasmC/LasmCDialect.cpp
CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.o: CMakeFiles/mlir_demo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hayden/prj/mlir_demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.o -MF CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.o.d -o CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.o -c /home/hayden/prj/mlir_demo/lib/LasmC/LasmCDialect.cpp

CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hayden/prj/mlir_demo/lib/LasmC/LasmCDialect.cpp > CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.i

CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hayden/prj/mlir_demo/lib/LasmC/LasmCDialect.cpp -o CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.s

# Object files for target mlir_demo
mlir_demo_OBJECTS = \
"CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.o"

# External object files for target mlir_demo
mlir_demo_EXTERNAL_OBJECTS =

libmlir_demo.a: CMakeFiles/mlir_demo.dir/lib/LasmC/LasmCDialect.cpp.o
libmlir_demo.a: CMakeFiles/mlir_demo.dir/build.make
libmlir_demo.a: CMakeFiles/mlir_demo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hayden/prj/mlir_demo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library libmlir_demo.a"
	$(CMAKE_COMMAND) -P CMakeFiles/mlir_demo.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mlir_demo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mlir_demo.dir/build: libmlir_demo.a
.PHONY : CMakeFiles/mlir_demo.dir/build

CMakeFiles/mlir_demo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mlir_demo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mlir_demo.dir/clean

CMakeFiles/mlir_demo.dir/depend: LasmCDialectOps.cpp.inc
	cd /home/hayden/prj/mlir_demo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hayden/prj/mlir_demo /home/hayden/prj/mlir_demo /home/hayden/prj/mlir_demo/build /home/hayden/prj/mlir_demo/build /home/hayden/prj/mlir_demo/build/CMakeFiles/mlir_demo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mlir_demo.dir/depend

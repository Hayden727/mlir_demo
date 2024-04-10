cmake_minimum_required(VERSION 3.20.0)
project(MLIR_DEMO LANGUAGES CXX C)

# 指定C++标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# LLVM和MLIR的安装目录
list(APPEND CMAKE_PREFIX_PATH "/usr/local/lib/cmake/mlir")
list(APPEND CMAKE_PREFIX_PATH "/usr/local/lib/cmake/llvm")

# 查找MLIR包
find_package(MLIR REQUIRED CONFIG)
message(STATUS "Using MLIRConfig.cmake in: ${MLIR_DIR}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# 配置LLVM和MLIR的目录和选项
set(LLVM_RUNTIME_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/bin)
set(LLVM_LIBRARY_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/lib)
set(MLIR_BINARY_DIR ${CMAKE_BINARY_DIR})
list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

include(TableGen)
include(AddLLVM)
include(AddMLIR)
include(HandleLLVMOptions)

# 添加MLIR的定义和包含目录
add_definitions(${MLIR_DEFINITIONS})
include_directories(${MLIR_INCLUDE_DIRS})
include_directories(${CMAKE_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(include/)

link_directories(${LLVM_BUILD_LIBRARY_DIR})

# 设置TableGen文件的路径
set(LLVM_TARGET_DEFINITIONS ${CMAKE_SOURCE_DIR}/include/LasmC/LasmCDialect.td)

# 使用mlir-tblgen命令生成代码
add_custom_command(OUTPUT LasmCDialectOps.h.inc
        COMMAND mlir-tblgen -I/usr/local/include/mlir -I/usr/local/include/mlir/IR -gen-op-decls -o ${CMAKE_CURRENT_BINARY_DIR}/LasmCDialectOps.h.inc ${LLVM_TARGET_DEFINITIONS}
        DEPENDS ${LLVM_TARGET_DEFINITIONS}
)
add_custom_command(OUTPUT LasmCDialectOps.cpp.inc
        COMMAND mlir-tblgen -I/usr/local/include/mlir -I/usr/local/include/mlir/IR -gen-op-defs -o ${CMAKE_CURRENT_BINARY_DIR}/LasmCDialectOps.cpp.inc ${LLVM_TARGET_DEFINITIONS}
        DEPENDS ${LLVM_TARGET_DEFINITIONS}
)

# 添加您的dialect库
add_library(mlir_demo
        lib/LasmC/LasmCDialect.cpp
        ${CMAKE_CURRENT_BINARY_DIR}/LasmCDialectOps.cpp.inc
)

# 链接MLIR库
get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)
target_link_libraries(mlir_demo
        ${dialect_libs}
        ${conversion_libs}
        MLIRIR
        MLIRParser
        MLIRSupport
        MLIRTransforms
)

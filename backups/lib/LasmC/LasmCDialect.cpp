//
// Created by Hayden on 2024/4/9.
//
#include "LasmCDialect.h"
#include "LasmC/LasmCDialectOps.h"
#include "mlir/IR/DialectImplementation.h"

using namespace mlir;
using namespace LasmC;

// 注册Dialect
void LasmCDialect::initialize() {
    addOperations<
#define GET_OP_CLASSES
#include "LasmCDialectOps.cpp.inc"
    >();
}

// 定义Dialect的外部接口，如果有的话
extern "C" void registerLasmCDialect(DialectRegistry &registry) {
    registry.insert<LasmCDialect>();
}

// Dialect构造函数，在这里可以初始化Dialect
LasmCDialect::LasmCDialect(mlir::MLIRContext *context) : Dialect(getDialectNamespace(), context) {
    initialize();
}


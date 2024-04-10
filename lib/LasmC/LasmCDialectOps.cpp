#include "LasmC/LasmCDialect.h"
#include "LasmC/LasmCDialectOps.h"
#include "mlir/IR/OpImplementation.h"
#include "mlir/IR/Builders.h"

using namespace mlir;
using namespace LasmC;

//===----------------------------------------------------------------------===//
// ScalarVectorMulOp
//===----------------------------------------------------------------------===//

LogicalResult ScalarVectorMulOp::verify() {
    // 验证标量类型是f64
    if (!getOperand(0).getType().isF64()) {
        return emitOpError("expected scalar to be of type f64");
    }

    // 验证向量类型是vector<16xf64>
    auto vectorType = getOperand(1).getType().dyn_cast<VectorType>();
    if (!vectorType || !vectorType.getElementType().isF64() || vectorType.getNumElements() != 16) {
        return emitOpError("expected vector to be of type vector<16xf64>");
    }

    return success();
}

//===----------------------------------------------------------------------===//
// DotProductOp
//===----------------------------------------------------------------------===//

LogicalResult DotProductOp::verify() {
    // 示例：验证两个输入向量都是vector<16xf64>
    auto vectorType1 = getOperand(0).getType().dyn_cast<VectorType>();
    auto vectorType2 = getOperand(1).getType().dyn_cast<VectorType>();
    if (!vectorType1 || !vectorType1.getElementType().isF64() || vectorType1.getNumElements() != 16 ||
        !vectorType2 || !vectorType2.getElementType().isF64() || vectorType2.getNumElements() != 16) {
        return emitOpError("both operands must be of type vector<16xf64>");
    }

    return success();
}

//===----------------------------------------------------------------------===//
// Registering
//===----------------------------------------------------------------------===//

// 注册Ops到系统
#define GET_OP_CLASSES
#include "LasmCDialectOps.cpp.inc"

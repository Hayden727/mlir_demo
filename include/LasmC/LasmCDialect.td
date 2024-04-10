//===- LasmCDialect.td - Define LasmC dialect and its operations ---------===//

#ifndef LASMC_DIALECT
#define LASMC_DIALECT

include "mlir/IR/OpBase.td"

// 定义 LasmC Dialect
def LasmCDialect : Dialect {
  let name = "lasm_c";
  let cppNamespace = "LasmC";
  // 这里可以添加更多的dialect属性和设置
}

// 定义一个操作，用于f64标量与f64*16向量相乘
def ScalarVectorMulOp : Op<LasmCDialect, "scalar_vector_mul"> {
  let summary = "Multiply f64 scalar with f64*16 vector";
  let description = [{
    This operation multiplies a f64 scalar with a f64*16 vector, by
    broadcasting the scalar to a vector and then performing element-wise
    multiplication.
  }];

  // 定义操作的参数和结果类型
  let arguments = (ins F64Attr:$scalar, VectorOf<F64Type, 16>:$vector);
  let results = (outs VectorOf<F64Type, 16>:$result);

  // 定义操作的语法，以方便MLIR工具可以解析和打印该操作
  let assemblyFormat = "$scalar `,` $vector attr-dict `:` type($vector) `->` type($result)";
}

// 定义一个操作，用于f64*16向量与f64*16向量相乘
def DotProductOp : Op<LasmCDialect, "dot_product"> {
  let summary = "Compute dot product of two f64*16 vectors";
  let description = [{
    This operation computes the dot product of two f64*16 vectors,
    resulting in a single f64 scalar value.
  }];

  // 定义操作的参数和结果类型
  let arguments = (ins VectorOf<F64Type, 16>:$vector1, VectorOf<F64Type, 16>:$vector2);
  let results = (outs F64Type:$result);

  // 定义操作的语法，以方便MLIR工具可以解析和打印该操作
  let assemblyFormat = "$vector1 `,` $vector2 attr-dict `:` type($vector1) `->` type($result)";
}
#endif // LASMC_DIALECT

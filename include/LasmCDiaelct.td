include "mlir/IR/DialectBase.td"

def LasmCDialect : Dialect {

  let name = "lasm_c";

  let summary = "Dialect def test.";

  let description = [{
    just define two ops as demo.
  }];

  let cppNamespace = "::LasmC";

  let dependentDialects = [

  ];
}

//创建基类
class LasmCDialect<string mnemonic, list<OpTrait> traits = []> :
    Op<LasmCDialect, mnemonic, traits>;


def ScalarVectorMulOp : LasmCDialect<"scalar_vector_mul"> {
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
// let assemblyFormat = "$scalar `,` $vector attr-dict `:` type($vector) `->` type($result)";
}


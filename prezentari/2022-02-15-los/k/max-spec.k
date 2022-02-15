module MAX-SPEC
  imports IMP-SYMBOLIC

claim
    <k>
      max = x;
      if (max <= y) {max = y;} else {}
      if (max <= z) {max = z;} else {}
    =>
      .K
    ...</k>
  <mem>...
    max |-> (_ => ?M:Int)
    x |-> X:Int
    y |-> Y:Int
    z |-> Z:Int
  ...</mem>
  ensures (?M <=Int X orBool ?M<=Int Y orBool ?M <=Int Z) andBool
          (?M >=Int X andBool ?M >=Int Y andBool ?M >=Int Z)
endmodule



module SUM-ODDS-INVARIANT
  imports IMP-SYMBOLIC

claim
    <k>
      while (i <= n) {
        sum = sum + (2 * i - 1);
        i = i + 1;
      }
    =>
      .K
    ...</k>
  <mem>...
    i   |-> (I:Int => ?_)
    n   |-> N:Int
    sum |-> (S:Int => S +Int N *Int N -Int (I -Int 1) *Int (I -Int 1))
  ...</mem>
  requires N >=Int I

endmodule

module SUM-ODDS-SPEC
  imports SUM-ODDS-INVARIANT

claim
    <k>
      sum = 0;
      i = 1;
      while (i <= n) {
        sum = sum + (2 * i - 1);
        i = i + 1;
      }
    =>
      .K
    ...</k>
  <mem>...
    n   |-> N:Int
    i   |-> (_ => ?_)
    sum |-> (_ => N *Int N )
  ...</mem>
  requires N >=Int 0
endmodule



module SUM-INVARIANT
  imports IMP-SYMBOLIC

claim
    <k>
      while (!(n <= 0)) {
        sum = sum + n;
        n = n - 1;
      }
    =>
      .K
    ...</k>
  <mem>...
    n   |-> (N:Int => 0)
    sum |-> (S:Int => S +Int ((N +Int 1) *Int N /Int 2))
  ...</mem>
  requires N >=Int 0

endmodule

module SUM-SPEC
  imports SUM-INVARIANT

claim
    <k>
      n = N:Int;
      sum = 0;
      while (!(n <= 0)) {
        sum = sum + n;
        n = n - 1;
      }
    =>
      .K
    ...</k>
  <mem>
    .Map
  =>
    n   |-> 0
    sum |-> ((N +Int 1) *Int N /Int 2)
  </mem>
  requires N >=Int 0
endmodule



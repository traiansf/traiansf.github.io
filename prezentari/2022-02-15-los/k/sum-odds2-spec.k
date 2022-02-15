module SUM-ODDS2-INVARIANT
  imports IMP-SYMBOLIC

claim
    <k>
      while (i <= n) {
        sum = sum + i;
        i = i + 2;
      }
    =>
      .K
    ...</k>
  <mem>...
    i   |-> (I:Int => ?_)
    n   |-> N:Int
    sum |-> (S:Int => S +Int ((N +Int 1)/Int 2) *Int ((N +Int 1)/Int 2) -Int ((I -Int 1)/Int 2) *Int ((I -Int 1)/Int 2))
  ...</mem>
  requires N >=Int I andBool I >=Int 0 andBool I %Int 2 ==Int 1

endmodule

module SUM-ODDS2-SPEC
  imports SUM-ODDS2-INVARIANT

/*
claim
    <k>
      sum = 0;
      i = 1;
      while (i <= n) {
        sum = sum + i;
        i = i + 2;
      }
    =>
      .K
    ...</k>
  <mem>...
    n   |-> N:Int
    i   |-> (_ => ?_)
    sum |-> (_ => ((N +Int 1)/Int 2) *Int ((N +Int 1)/Int 2))
  ...</mem>
  requires N >=Int 0
*/
endmodule



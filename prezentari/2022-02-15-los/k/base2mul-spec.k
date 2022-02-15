module BASE2MUL-SPEC
  imports IMP-SYMBOLIC

claim
    <k>
      while (!(x <= 0)) {
        q = x/2;
        r = q+q + 1;
        if (r <= x) { z = z+y; } else {}
        x = q;
        y = y+y;
      }
    =>
      .K
    ...</k>
  <mem>...
    x   |-> (X:Int => 0)
    y   |-> (Y:Int => ?_)
    z   |-> (Z:Int => Z +Int (X *Int Y))
    q   |-> (_ => ?_)
    r   |-> (_ => ?_)
  ...</mem>
  requires X >=Int 0

endmodule


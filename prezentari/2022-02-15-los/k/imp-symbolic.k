require "imp.md"

module IMP-SYMBOLIC-SYNTAX
  imports IMP-SYNTAX

  syntax Exp ::= "?Int"

  syntax Id ::= "sum" [token] | "n" [token] | "i" [token]
              | "max" [token] | "x" [token] | "y" [token] | "z" [token]
              | "r" [token] | "q" [token]
endmodule

module IMP-SYMBOLIC
  imports IMP-SYMBOLIC-SYNTAX
  imports IMP
  imports MAP-SYMBOLIC

  rule ?Int => ?_:Int

endmodule

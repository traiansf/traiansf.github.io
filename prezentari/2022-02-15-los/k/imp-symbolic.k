require "imp.md"

module IMP-SYMBOLIC-SYNTAX
  imports IMP-SYNTAX

  syntax Id ::= "sum" [token] | "n" [token]
endmodule

module IMP-SYMBOLIC
  imports IMP-SYMBOLIC-SYNTAX
  imports IMP
  imports MAP-SYMBOLIC
endmodule

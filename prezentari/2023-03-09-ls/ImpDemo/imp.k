module IMP-SYNTAX
    imports DOMAINS-SYNTAX

    syntax AExp  ::= Int | Id
                   | "-" Int                    
                   | AExp "/" AExp              [left, seqstrict]
                   | "(" AExp ")"               [bracket]
                   > AExp "+" AExp              [left, seqstrict]
    syntax BExp  ::= Bool
                   | AExp "<=" AExp             [seqstrict]
                   | "!" BExp                   [strict]
                   | "(" BExp ")"               [bracket]
                   > BExp "&&" BExp             [left, strict(1)]
    syntax Block ::= "{" "}"
                   | "{" Stmt "}"               
    syntax Stmt  ::= Block
                   | Id "=" AExp ";"            [strict(2)]
                   | "if" "(" BExp ")"
                     Block "else" Block         [strict(1)]
                   | "while" "(" BExp ")" Block 
                   > Stmt Stmt                  [left]
  
    syntax Pgm ::= "int" Ids ";" Stmt           
    syntax Ids ::= List{Id,","}

endmodule

module IMP
    imports IMP-SYNTAX
    imports BOOL
    imports INT
    imports MAP
    imports SET

    syntax KResult ::= Int | Bool

    configuration <T color="yellow">
                    <k color="green"> $PGM:Pgm </k>
                    <state color="red"> .Map </state>
                  </T>

    rule
        <k> X:Id => I ...</k>
        <state>... X |-> I ...</state>
    [label(variable_lookup)]

    /*
                   | Id "=" AExp ";"            [strict(2)]
    rule <k> X:Id = E:AExp ; => E:AExp ~> X:Id = [HOLE] ; ...</k>
      requires notBool (isKResult(E))
    rule <k> V:KResult ~> X:Id = [HOLE] ; => X = V ;  ...</k>
   */

/*
    rule
        <k> X:Id => 0 ...</k>
        <state> State </state>
      requires notBool (X in keys State)
    [label(variable_lookup)]
*/

    rule I1 / I2 => I1 /Int I2  requires I2 =/=Int 0
    rule I1 + I2 => I1 +Int I2
    rule - I1 => 0 -Int I1

    rule I1 <= I2 => I1 <=Int I2
    rule ! T => notBool T
    rule true && B => B
    rule false && _ => false

    rule {} => .
    rule {S} => S 

    rule
        <k> X = I:Int; => . ...</k>
        <state>... X |-> (_ => I) ...</state>
    [label(variable_assignment)]

/*  
    syntax KItem ::= f(Stmt) [function]

    rule f(S1:Stmt S2:Stmt) => S1
*/ 
    rule S1:Stmt S2:Stmt => S1 ~> S2

    rule if (true)  S else _ => S [label(ifTrue)]
    rule if (false) _ else S => S [label(ifElse)]

    rule while (B) S => if (B) {S while (B) S} else {}

    rule int .Ids; S => S
    rule
        <k> int (X,Xs => Xs); _ </k>
        <state> Rho:Map (.Map => X |-> 0) </state>
        requires notBool (X in_keys(Rho))
        [owise]

    syntax Id ::= "a" [token]
    syntax Id ::= "b" [token]
    syntax Id ::= "max" [token]
    syntax Id ::= "n" [token]
    syntax Id ::= "sum" [token]

endmodule

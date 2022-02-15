---
title: IMP
subtitle: an imperative concurrent language
author: Traian Florin Șerbănuță
institute: Runtime Verification
---


# Arithmetic and Boolean Expressions Syntax

Regular arithmetic.  Things to notice

- Syntax definition formalism
  - brackets, priorities, grouping

- Evaluation strategies and `Val`ues
  - strictness, partial strictness (e.g., for short-circuited ops)


```k
module EXP-SYNTAX
  imports DOMAINS-SYNTAX


  syntax Val ::= Int | Bool

  syntax Exp ::= Val
               | "(" Exp ")" [bracket]
               > left:
                 Exp "*" Exp [left, seqstrict]
               | Exp "/" Exp [left, seqstrict]
               > left:
                 Exp "+" Exp [left, seqstrict]
               | Exp "-" Exp [left, seqstrict]
               > non-assoc:
                 Exp "==" Exp [seqstrict]
               | Exp "!=" Exp [seqstrict]
               | Exp ">=" Exp [seqstrict]
               | Exp "<=" Exp [seqstrict]
               > right:
                 Exp "&&" Exp [seqstrict(1)]
               | Exp "||" Exp [seqstrict(1)]
               | "!" Exp      [seqstrict]
endmodule
```

# Arithmetic and Boolean Expressions semantics

Things to notice:

- Evaluations strategies require defining `KResult`s

- Rules assume arguments have been evaluated

- Type inference for variables (to the most general possible sort)


```k
module EXP
  imports EXP-SYNTAX
  imports DOMAINS 

  syntax KResult ::= Int | Bool
  
  rule I1 + I2 => I1 +Int I2
  rule I1 - I2 => I1 -Int I2
  rule I1 * I2 => I1 *Int I2
  rule I1 / I2 => I1 /Int I2

  rule I1 == I2 => I1 ==Int I2
  rule I1 != I2 => I1 =/=Int I2
  rule I1 >= I2 => I1 >=Int I2
  rule I1 <= I2 => I1 <=Int I2

  rule false && _ => false
  rule true && B2 => B2

  rule true || _ => true
  rule false || B2 => B2

  rule ! true => false
  rule ! false => true
endmodule
```

# Statements

Basic imperative statements. Things to notice:

- statement sequencing desugars to computation sequencing

  - `.K` for the empty computation
  - `~>` for sequencing computation tasks

- While semantics through unrolling

```k
module STMT-SYNTAX
  imports EXP-SYNTAX

  syntax Stmt ::= "{" "}"
                | "{" Stmt "}"                      [bracket]
                > left:
                  "if" "(" Exp ")" Stmt "else" Stmt [seqstrict(1)]
                | "while" "(" Exp ")" Stmt
                > Stmt Stmt                         [right]
endmodule

module STMT
  imports EXP
  imports STMT-SYNTAX

  rule {} => .K

  rule if (true) Then else _ => Then
  rule if (false) _ else Else => Else

  rule while (Cond) Body =>
       if (Cond) {
         Body
         while (Cond) Body
       } else {}

  rule S1:Stmt S2:Stmt => S1 ~> S2
endmodule

```

# Introducing configurations

So far we could specify everything without requiring execution context. But no longer.

Things to notice:

- XML-like cell syntax
- A special cell `k` for computations
- contents of the cell specify the default values e.g., when starting execution
- A special variable `$PGM` used to initialize `k` cell with the input program


```k
module IMP-CONFIGURATION
  imports STMT-SYNTAX
  imports DOMAINS

  configuration
    <k> $PGM:Stmt </k>
    <mem> .Map </mem>

endmodule
```


# Simple memory model


Things to notice:

- using typing annotations to prevent rule from applying too early


```k
module MEMORY-SYNTAX
  imports EXP-SYNTAX

  syntax Exp ::= Id

  syntax Stmt ::= Id "=" Exp ";" [seqstrict(2)]
endmodule

module MEMORY
  imports MEMORY-SYNTAX
  imports IMP-CONFIGURATION
  imports EXP

  rule <k> X:Id => V ...</k> <mem>... X |-> V ...</mem>
  rule <k> X = V:Val ; => .K ...</k> <mem> Mem => Mem [X <- V] </mem>
endmodule
```

# Putting everything together

```k
module IMP-SYNTAX
  imports EXP-SYNTAX
  imports STMT-SYNTAX
  imports MEMORY-SYNTAX
endmodule

module IMP
  imports EXP
  imports STMT
  imports MEMORY
endmodule
```

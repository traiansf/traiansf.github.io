```k
require "imp-threaded.md"
```

# A (more) relaxed memory model

```k
module THREADED-RELAXED-MEMORY
  imports MEMORY-SYNTAX
  imports IMP-THREADED-CONFIGURATION
  imports EXP

  syntax KItem ::= write(Id, Val)

  rule <k> X:Id => latestWrite(X, Buf ListItem(write(X,V))) ...</k>
       <wbuf> Buf </wbuf>
       <mem>... X |-> V ...</mem>

  rule <k> X = V:Val ; => .K ...</k>
       <wbuf>... .List => ListItem(write(X, V)) </wbuf>

  rule <wbuf> ListItem(write(X, V)) => .List ...</wbuf>
       <mem> Mem => Mem [X <- V] </mem>


  syntax KItem ::= latestWrite(Id, List) [function]

  rule latestWrite(X, ListItem(write(X, V)) _) => V
  rule latestWrite(_, (ListItem(_) => .List) _) [owise]

  rule latestWrite(_, .List) => 0
endmodule
```

# Memory Fences

```k
module MEMORY-FENCE-SYNTAX
  syntax Stmt ::= "fence" ";"
endmodule
```

```k
module MEMORY-FENCE
  rule <k> fence ; => .K ...</k> <wbuf> .List </wbuf>
endmodule
```

# Putting everything together

```k
module IMP-RELAXED-SYNTAX
  imports IMP-THREADED-SYNTAX
  imports MEMORY-FENCE-SYNTAX
endmodule

module IMP-RELAXED
  imports EXP
  imports STMT
  imports THREADED-RELAXED-MEMORY
  imports THREADS
endmodule
```


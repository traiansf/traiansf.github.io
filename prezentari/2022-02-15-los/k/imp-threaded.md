```k
require "imp.md"
```

# Multithreaded configuration

```k
module IMP-THREADED-CONFIGURATION
  imports STMT-SYNTAX
  imports DOMAINS

  configuration
    <threads>
      <thread multiplicity="*" type="Set">
        <k> $PGM:Stmt </k>
        <id> -1 </id>
      </thread>
    </threads>
    <terminated> .Set </terminated>
    <mem> .Map </mem>
    <wbuf> .List </wbuf>
endmodule
```

```k
module THREADED-SEQ-MEMORY
  imports MEMORY-SYNTAX
  imports IMP-THREADED-CONFIGURATION
  imports EXP

  rule <k> X:Id => V ...</k> <mem>... X |-> V ...</mem>
  rule <k> X = V:Val ; => .K ...</k> <mem> Mem => Mem [X <- V] </mem>
endmodule
```

# Threads

```k
module THREADS-SYNTAX
  imports STMT-SYNTAX
  syntax Exp ::= spawn(Stmt)

  syntax Stmt ::= "join" "(" Exp ")" ";" [seqstrict]
endmodule

module THREADS
  imports THREADS-SYNTAX
  imports IMP-THREADED-CONFIGURATION

  rule <k> spawn(S) => !Id:Int ...</k>
       (.Bag => <thread>... <id> !Id </id> <k> S </k> ...</thread>)

  rule (<thread>... <k> .K </k> <id> Id </id> ...</thread> => .Bag)
       <terminated>... .Set => SetItem(Id) ...</terminated>

  rule <k> join(I:Int); => .K ...</k> <terminated>... SetItem(I) ...</terminated>
endmodule
```

# Putting everything together

```k
module IMP-THREADED-SYNTAX
  imports IMP-SYNTAX
  imports THREADS-SYNTAX
endmodule

module IMP-THREADED
  imports EXP
  imports STMT
  imports THREADED-SEQ-MEMORY
  imports THREADS
endmodule
```

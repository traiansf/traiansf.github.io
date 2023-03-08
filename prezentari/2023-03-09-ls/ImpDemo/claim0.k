You are currently proving claim 0
    <T>
      <k>
        while ( ! n <= 0 ) { sum = sum + n ; n = n + -1 ; } ~> _DotVar2 ~> .
      </k>
      <state>
        n |-> N:Int
        sum |-> S:Int
      </state>
    </T>
  #And
    {
      true
    #Equals
      N >=Int 0
    }
#Implies
  #wAF ( <T>
    <k>
      _DotVar2
    </k>
    <state>
      n |-> 0
      sum |-> S +Int ( N +Int 1 ) *Int N /Int 2
    </state>
  </T> )

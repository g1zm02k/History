var:="2"
;~ Ternary operator  
;~    (condition)?(True)    : (False)
data:= (var="3")?("is one"):("Not One")
MsgBox % data
 
data:= (Var="1")?("one")
      :(Var="2")?("two")
      :(Var="3")?("three")
      :("Else") 
MsgBox % data
 
 
data := (Var="1")?("one"):(Var="2")?("two"):(Var="3")?("three"):("Else") 
MsgBox % data
Fake Operators are actually just instance methods.<br>
When implementing fake operators, it is generally best to choose some functionality that makes sense when used with special operator-like syntax.

```
FAKE
~  !  &  ^  |  
+  -  /  *  **  <<  >>  []  []=
<=  >=  <  >  <=>  ==  ===  !=  =~  !~

NOT FAKE
&&  ||  ..  ...  ?  :  !=  &=  >>=  <<=  &&=  ||=  {  .  ::
=  %=  /=  -=  +=  *=  **=
```
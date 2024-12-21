p(a).
p(b).


b(Y):-p(Y),p(Y).


sum(X,Y,R):-R is X+Y.

sous(X,Y,R):-R is X-Y.

mul(X,Y,R):-R is X*Y.

div(_,Y,_):-Y==0,write("division impossible !").

div(X,Y,R):-R is X/Y.

segma(1,1).
segma(N,R):-N>1,N1 is N-1,segma(N1,R1),R is R1+N.


factoriel(0,1).
factoriel(N,R):-N>0,N1 is N-1,factoriel(N1,R1),R is R1*N.


fibo(0,0).
fibo(1,1).
fibo(N,R):-N>1,N1 is N-1,N2 is N-2,fibo(N1,R1),fibo(N2,R2),R is R1+R2.




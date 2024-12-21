factoriel(0,1).
factoriel(1,1).
%factoriel(X,Y):-X>=0,X1 is X-1,factoriel(X1,N1),Y is N1*X.
mul(X,N1,Y):-Y is X*N1.
factoriel(X,Y):-X>=0,X1 is X-1,factoriel(X1,N1),mul(X,N1,Y).




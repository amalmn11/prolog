:-dynamic sur/2.

%sur(a,terre).
sur(c,terre).
sur(b,a).
sur(a,c).
%libre(a).



deplacer(_,_,_):-sur(X,terre),X\=Y,sur(Y,terre),Z\=Y,Z\=X,sur(Z,terre).
deplacer(_,_,_):-sur(X,terre),sur(Y,X),sur(Z,terre),X\=Z,retract(sur(Y,X)),assert(sur(Y,terre)).
deplacer(_,_,_):-sur(X,terre),sur(Y,X),sur(Z,Y),retract(sur(Z,Y)),assert(sur(Z,terre)),retract(sur(Y,X)),assert(sur(Y,terre)).
organ(X,Y,Z):-deplacer(X,Y,Z),retract(sur(Y,terre)),assert(sur(Y,X)),retract(sur(Z,terre)),assert(sur(Z,Y)).
vider:-abolish(sur/2).

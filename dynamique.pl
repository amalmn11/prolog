:-dynamic(pris/1).
:-dynamic(sur/2).






sur(a, terre).
sur(c, a).
sur(b, terre).


plusGrand(b, a).
plusGrand(a, c).

plusGrand(X, Z):- plusGrand(X, Y), plusGrand(Y, Z).



not_terre(X, Y, Z):-X \== terre,Y \== terre,Z \== terre .


prendre(X):-pris(Y), X\==Y, poser(Y), prendre(X).
prendre(X):- pris(X), writeln("robot a deja pris (":X:")").
prendre(X):- sur(Y, X), poser(Y), prendre(X).
prendre(X):- not(pris()),not(sur(, X)), retract(sur(X, _)), assert(pris(X)), writeln("robot a pris (":X:")").

%deposer X sur terre
poser(X):-not(pris(X)), not(sur(_, X)), prendre(X), poser(X).
poser(X):-not(pris(_)),sur(Z, X), poser(Z), poser(X).
poser(X):-pris(X), writeln("robot a (":X:")"), retract(pris(X)), assert(sur(X, terre)), writeln("robot a depose (":X:") sur terre").



%deposer X sur Y
poser2(X, Y):-Y\==terre, X\==terre, sur(Z, X), poser(Z), poser2(X, Y).

poser2(X, Y):-Y\==terre, X\==terre, sur(Z, Y), poser(Z), poser2(X, Y).

poser2(X, Y):-Y\==terre, X\==terre, plusGrand(Y, X), not(sur(, X)), not(sur(, Y)), prendre(X), retract(pris(X)), assert(sur(X, Y)), writeln("robot a depose (":X:") sur (":Y:")").



%construire X sur Y sur Z
build(X, Y, Z):- sur(X,Y), sur(Y, Z), not_terre(X,Y,Z), !, true.

build(X, Y, Z):- not(sur(Y,Z)), poser2(Y,Z), not_terre(X,Y,Z), build(X,Y,Z), !, true.

build(X, Y, Z):- not(sur(X,Y)), sur(Y, Z), poser2(X,Y), not_terre(X,Y,Z), build(X,Y,Z), !, true.



vider:-abolish(pris/2).

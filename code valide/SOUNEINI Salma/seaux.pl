:-dynamic(rempli/2).
:-dynamic(vide/1).

rempli(s1,5).
rempli(s2,3).

vide(_).


remplir(X):rempli(X),write("le seau"),write(X),write("est deja rempli"),nl.
vider(X):-vide(X),write("le seau"),write(X),write("est deja vider"),nl.

vider(X):-not(vide(X)),retract(rempli(X)),assert(vide(X)).


remplir(X):-vide(X),.

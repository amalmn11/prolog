inserer_fin(X,[],[X]).
inserer_fin(X,[H|L],[H|R]):-inserer_fin(X,L,R).

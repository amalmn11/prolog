inserer_debut(e,[],[e]).
inserer_debut(X,L,[X|L]).



ins_fin(X,[],[X]).
ins_fin(X,[Y|L],[Y|R]):-ins_fin(X,L,R).

existe(X,[X|_]).
existe(X,[_|L]):-existe(X,L).

supp_debut(_,[],[]).
supp_debut(X,[X|L],L).


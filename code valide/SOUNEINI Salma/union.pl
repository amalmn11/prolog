concatener(L,[],L).
concatener([],L,L).
concatener([H|L1],L2,[H|R]):-concatener(L1,L2,R).


supprimer_T_occ(_,[],[]).

supprimer_T_occ(X,[X|L],R):-supprimer_T_occ(X,L,R).
supprimer_T_occ(X,[H|L],[H|R]):-H\==X,supprimer_T_occ(X,L,R).


supprimer_rdb([],[]).
supprimer_rdb([H|L],[H|R]):-supprimer_T_occ(H,L,R1),supprimer_rdb(R1,R).


union(L1,L2,T):-concatener(L1,L2,R),supprimer_rdb(R,T).

%union([1,5,2],[3,3,5,5,4],T).

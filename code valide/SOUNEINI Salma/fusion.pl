
concatener(L,[],L).
concatener([],L,L).
concatener([H|L1],L2,[H|R]):-concatener(L1,L2,R).

max([X], X).
max([X|L], R) :- max(L, R1), (R1 > X, R is R1 ; R is X),!.



supprimer_1_occ(X,[X|L],L).
supprimer_1_occ(X,[H|L],[H|R]):-H\==X,supprimer_1_occ(X,L,R).


trier([],[]).
trier(L,R):-max(L,M),supprimer_1_occ(M,L,L1),trier(L1,L2),concatener(L2,[M],R).


fusion(L1,L2,R):-concatener(L1,L2,T),trier(T,R).


%fusion([1,3,4],[2,5],T).

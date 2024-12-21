supprimer([_,_],[]).
supprimer([H|L],[H|R]):-supprimer(L,R).

concatener([],L,L).
concatener([H|L1],L2,[H|R]):-concatener(L1,L2,R).

conjuger(L,1,singulier,X):-supprimer(L,L1),concatener(L1,[e],X).
conjuger(L,2,singulier,X):-supprimer(L,L1),concatener(L1,[e,s],X).
conjuger(L,3,singulier,X):-supprimer(L,L1),concatener(L1,[e],X).
conjuger(L,1,plur,X):-supprimer(L,L1),concatener(L1,[o,n,s],X).
conjuger(L,2,plur,X):-supprimer(L,L1),concatener(L1,[e,z],X).
conjuger(L,3,plur,X):-supprimer(L,L1),concatener(L1,[e,n,t],X).

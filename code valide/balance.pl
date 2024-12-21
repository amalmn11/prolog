balance(_,[],[],[]).
balance(Y,[X|L],[X1|L1],L2):-balance(Y,L,L1,L2),X<Y,X1 is X.

balance(Y,[X|L],L1,[X2|L2]):-balance(Y,L,L1,L2),X>Y,X2 is X.

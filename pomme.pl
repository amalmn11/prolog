prix(pomme,7).
prix(melon,13).
prix(banane,8).


totale([[X,P1],[Y,P2]],T):-prix(X,R1),prix(Y,R2),A is R1*P1,B is R2*P2,T is A+B.

diff([],[],[]).
diff([X|L1],[Y|L2],[Z|L3]):-diff(L1,L2,L3),Z is X-Y.

partition([],_,[],[]).
partition([X|L],Y,[X1|L1],L2):-partition(L,Y,L1,L2),X<Y,X1 is X.

partition([X|L],Y,L1,[X2|L2]):-partition(L,Y,L1,L2),X>Y,X2 is X.

%max([X],X).
%max([X|L],R):-max(L,R1),R1>X,R is X.


max([X], X).
max([X|L], R) :- max(L, R1), (R1 > X, R is R1 ; R is X),!.



min([X], X).
min([X|L], R) :- min(L, R1), (R1 < X, R is R1 ;R is X),!.


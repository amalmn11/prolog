parent(brahim,homer).
parent(homer,bart).
parent(bart,sofi).
parent(homer,lisa).
parent(homer,gemmie).


grandparent(X,Y):-parent(X,A),parent(A,Y).

frere(X,Y):-parent(A,X),parent(A,Y).




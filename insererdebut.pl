ins(X,[],[X]).
ins(X,[H|L],[H|B]):-ins(X,L,B).

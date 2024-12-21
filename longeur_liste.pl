longeur([],0).
longeur([_|L],N):-longeur(L,N1),N is N1+1.

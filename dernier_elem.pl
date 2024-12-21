dernier([X],X).
dernier([_|L],N):-dernier(L,N).

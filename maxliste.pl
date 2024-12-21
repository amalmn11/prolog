dernier(E,[E]).
dernier(K,[M,N|L]):-dernier(K,[N|L]).

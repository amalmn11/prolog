Inserer(X, L, [X | L], 0).
inserer(X, [H | L], [H | R], N) :-length(L,N), N > 0, N1 is N - 1, inserer(X, L, R, N1).

% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own
serie(r1,r4).
resistance(r1,2).
resistance(r4,0.5).
courant(r1,2).
courant(X,Y):-courant(R,Y),serie(R,X).
tension(R,L):-resistance(R,X),courant(R,Y),L is Y*X.
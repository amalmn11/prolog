ins_fin(X,[X],[X|X]).
% ins_fin(X,[H|L],[H,B]):-l is length([1, 2, 3, 4],Length),l>0,ins(X,L,B).
ins_debut(X, L, [X | L], 0).


%apprtenance(X,[X]).
apprtenance(X,[X|_]).

apprtenance(X,[_|L]):-apprtenance(X,L).

supprimer_tete([_|L],L).


supperimer(X,[X|L],L).
supperimer(X,[Y|L],[Y|L1]):-supperimer(X,L,L1).

supprimer_tout(X,[],[]).
supprimer_tout(X,[X|L],L1):-supprimer_tout(X,L,L1).
supprimer_tout(X,[Y|L],[Y|L1]):-supprimer_tout(X,L,L1).

remplace(X,Y,[],[]).
remplace(X,Y,[X|L],[Y|L1]):-remplace(X,Y,L,L1).
remplace(X,Y,[H|L],[H|L1]):-remplace(X,Y,L,L1).

%inverse([],[]).
%ins(H,[],[H]).
%ins(H,L,[H|L]):-.
%inverse([H|L],L1):-ins(H,L1,L2).
%supp_doublon().

%supprimer_pos_impaire().

%:-dynamic dans/1.
%dans(a).
%ouvert(a,b).
%ouvert(b,c).
%ouvert(c,d).

%deplacer(X,Y):-dans(X),ouvert(X,Y),retract(dans(X)),assert(dans(Y)).
%deplacer(X,Z):-deplacer(X,Y),deplacer(Y,Z),write(Z).


:-dynamic dans/1.
:-dynamic ouvert/2.
:-dynamic deplacer/2.


dans(a).
ouvert(a,b).
ouvert(b,c).
ouvert(c,d).

deplacer(X,Y):-dans(X),ouvert(X,Y),retract(dans(X)),assert(dans(Y)).
deplacer(X,Z):-deplacer(X,Y),deplacer(Y,Z).





























%Inverse(X,L,[X|L]).






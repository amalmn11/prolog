%inserer_debut(X,[],[X]).
inserer_debut(X,L1,[X|L1]).


%inserer à la fin
inserer_fin(X,[],[X]).
inserer_fin(X,[H|L],[H|R]):-inserer_fin(X,L,R).

%inserer a une position donnée
inserer_pos(X,L,1,[X|L]).

inserer_pos(X,[H|L],Y,[H|R]):-Y1 is Y-1,inserer_pos(X,L,Y1,R).


%suppression au debut
supprimer_debut([_|L],L).


%suppression au debut
supprimer_Fin([_],[]).
supprimer_Fin([H|L],[H|R]):-supprimer_Fin(L,R).


%inserer a une position donnée
supprimer_pos([_|L],1,L).
supprimer_pos([H|L],X,[H|R]):-X1 is X-1,supprimer_pos(L,X1,R).


supprimer_1_occ(X,[X|L],L).
supprimer_1_occ(X,[H|L],[H|R]):-H\==X,supprimer_1_occ(X,L,R).

%supprimer_T_occ(X,[X],[]).
%supprimer_T_occ(X,[Y],[]).

supprimer_T_occ(_,[],[]).

supprimer_T_occ(X,[X|L],R):-supprimer_T_occ(X,L,R).
supprimer_T_occ(X,[H|L],[H|R]):-supprimer_T_occ(X,L,R).

existe(X,[X|_]).
existe(X,[_|L]):-existe(X,L).


%concatener(L,[],L).
%concatener([],L,L).
%concatener(L1,[Y|L2],R):-inserer_fin(Y,L1,L),concatener(L,L2,R).

%concatener(L,[],L).
concatener([],L,L).
concatener([H|L1],L2,[H|R]):-concatener(L1,L2,R).

%inserer_debut(H,[],[H]).
renverser([],[]).
renverser([H|L],R1):-renverser(L,R),concatener(R,[H],R1),!.

max([X], X).
max([X|L], R) :- max(L, R1), (R1 > X, R is R1 ; R is X),!.

%tri avec insertion fin
%trier([],[]).
% trier(L,R):-max(L,M),supprimer_1_occ(M,L,L1),trier(L1,R1),inserer_fin(M,R1,R).


%tri avec la concatenation
trier([],[]).
trier(L,R):-max(L,M),supprimer_1_occ(M,L,L1),trier(L1,L2),concatener(L2,[M],R).





partition([],_,[],[]).
partition([X|L],Y,[X1|L1],L2):-partition(L,Y,L1,L2),X<Y,X1 is X.
partition([X|L],Y,L1,[X2|L2]):-partition(L,Y,L1,L2),X>Y,X2 is X.



remplacer(_,_,[],[]).
remplacer(X,Y,[X|L],[Y|R]):-remplacer(X,Y,L,R).
remplacer(X,Y,[H|L],[H|R]):-X\==H,remplacer(X,Y,L,R).




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

% retirer_dbl(+List, -NewList):
%   NewList Nouvelle liste sans les élements en double de List.

% regle le vide par le vide
retirer_dbl([], []).

% regle si le premier element de la liste (Premier) appartient
% à Reste alors	 enleve le et appel,
% retirer_dbl avec le reste de la liste (Premier à disparu)
retirer_dbl([Premier | Reste], NReste) :-
    existe(Premier, Reste),
    retirer_dbl(Reste, NReste).

% regle si le Premier element de la liste n'est pas
% membre  du Reste, garde le car [Premier|Nreste] et appel
% retirer_dbl
retirer_dbl([Premier | Reste], [Premier | NReste]) :-
    not(existe(Premier, Reste)),
    retirer_dbl(Reste, NReste).



% Predicat pour insérer un élément à une position impaire dans une liste
%inserer_position_impair(Element, ListeIn, ListeOut) :-
    %inserer_position_impair_acc(Element, ListeIn, ListeOut, 1).

% Cas de base : atteindre la fin de la liste
%inserer_position_impair_acc(Element, [], [Element], _).

% Cas général : insérer l'élément à la position impaire actuelle
% inserer_position_impair_acc(Element, [H|T], [H, Element|Reste], Position) :-
   % PositionModDeux is Position mod 2,
   % PositionModDeux \== 0,
   % NouvellePosition is Position + 1,
   % inserer_position_impair_acc(Element, T, Reste, NouvellePosition).

% Cas général : maintenir l'élément à la position actuelle
%inserer_position_impair_acc(Element, [H|T], [H|Reste], Position) :-
   % PositionModDeux is Position mod 2,
   % PositionModDeux == 0,
   % NouvellePosition is Position+1,
   % inserer_position_impair_acc(Element, T, Reste, NouvellePosition).

% Exemple d'utilisation :
% inserer_position_impair(x, [a, b, c, d, e], Resultat).


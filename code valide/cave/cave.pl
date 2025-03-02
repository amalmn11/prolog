:-dynamic(estdans/2).
:-dynamic(cle/2).
:-dynamic(ouvrir/2).
:-dynamic(ferme/1).

ferme(chambre).
ferme(salon).
ferme(cave).

%cle(X,Y).

cle(clechambre,chambre).
cle(clesalon,salon).
cle(clecave,cave).

estdans(clechambre,cave).
estdans(clesalon,cuisine).
estdans(clecave,grenier).

personne(person).
livre(liv).

estdans(person,cuisine).
estdans(liv,chambre).


possede_cle(P, X, K) :- personne(P), estdans(K, X).



deplacer(P, Y) :- personne(P), estdans(P, X),
                   not(ferme(Y)),
                   format("~w est dans ~w", [P, X]), nl,
                   format("~w n'est pas ferme", [Y]), nl,
                   retract(estdans(P,X)),
                   %format("~w n'est plus dans ~w", [P, X]), nl,
                   assert(estdans(P, Y)),
                   format("~w se deplace vers ~w", [P, Y]), nl.

deplacer(P, Y) :- personne(P), estdans(P, X),
                   ferme(Y),
                   format("~w est dans ~w", [P, X]), nl,
                   format("~w est ferme", [Y]), nl,
                   format("la personne va ouvrir ~w", [Y]), nl,
                   ouvrir(P, Y),
                   format("~w est ouvert maintenant", [Y]), nl,
                   assert(estdans(P, Y)),
                   format("~w se deplace vers ~w", [P, Y]), nl.

ouvrir(P, X) :- personne(P), ferme(X),
                cle(K, X),
                chercher(P, K, Y),
                retract(estdans(K,Y)),
                assert(estdans(K,X)),
                retract(estdans(P,Y)),
                format("~w n'est plus dans ~w", [P, Y]), nl,
                assert(estdans(P,X)),
                format("~w se deplace vers ~w", [P, X]),nl,
                format(" la ~w ouvre ~w", [P, X]),nl,
                retract(ferme(X)).

chercher(P,K,X) :- personne(P),estdans(K,X),
                   format("~w est dans ~w", [K, X]),nl,
                   format("chercher ~w dans ~w ", [K, X]), nl,
                   deplacer(P,X),
                   format("on trouve ~w dans ~w", [K, X]),nl.


apporter(P,X,Y):-chercher(P,X,Z),retract(estdans(X,_)),
                 assert(estdans(X,Y)),deplacer(P,Y),
                 format("~w a apport� ~w dans ~w",[P,X,Y]).


p:-abolish(estdans/2),abolish(cle/2),abolish(ouvrir/2),abolish(ferme/1).


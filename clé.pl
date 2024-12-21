:-dynamic(cleestdans/2).
:-dynamic(livreestdans/1).
:-dynamic(personneestdans/1).
:-dynamic(ferme/1).
:-dynamic(ouvert/2).





ferme(chambre).

cleestdans(chambre,cave).
livreestdans(chambre).
ferme(salon).
cleestdans(salon,cuisine).
cleestdans(cave,grenier).
personneestdans(cuisine).
ferme(cave).


aller(Y):-personneestdans(X),not(ferme(Y)),retract(personneestdans(X)),assert(personneestdans(Y)).

prendre().

ouvrir(Y):-ferme(Y),cleestdans(Y,Z),aller(Z),prendre(),retract(ferme(Y)).

aller(Y):-personneestdans(X),ferme(Y),ouvrir(Y),retract(personneestdans(X)),assert(personneestdans(Y)).









p:-abolish(pesonneestdans/1).





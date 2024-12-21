:-dynamic dans/2.
:-dynamic personnedans/1.
:-dynamic ferme/1.
:-dynamic main/1.
:-dynamic ouverte/1.



personnedans(cuisine).

dans(clechambre,cave).
dans(livre,chambre).
dans(clesalon,cuisine).
dans(clecave,grenier).

ouvre_par(clechambre,chambre).
ouvre_par(clecave,cave).
ouvre_par(clesalon,salon).


ferme(salon).
ferme(chambre).
ferme(cave).
ouverte(grenier).
ouverte(cuisine).
%main(clesalon).
%sep:- write('\n').


prendre(Objet):-main(Objet),write('\n vous avez a la main deja : '),write(Objet),!.

prendre(Objet):- not( main(Objet)),
               assert(main(Objet)),
               write(' \n on predre maintenet : '),write(Objet),!.




poser(Objet):- not( main(Objet)),write('\n pas de '),write(Objet),write(' dans la main pour le poser ').

poser(Objet):- main(Objet),retract(main(Objet)),write('\n personne pose :  '),write(Objet),!.








aller(X,Y):- personnedans(X),write('\n personne dans : '),write(X),
             ouverte(Y), write('\n la porte de: '),write(Y),write(' ,est ouverte'),
             retract(personnedans(X)),assert(personnedans(Y)),
             write('\n personne maintenant dans: '),write(Y),!.

aller(X,Y):-personnedans(X),
            ferme(Y), write('\n la porte de: '),write(Y),write(' est fermee'),
            ouvre_par(Z,Y),dans(Z,W), write(' \n on doit chercher '),write(Z),write(' dans '),write(W),aller(X,W),prendre(Z),

            retract(dans(Z,W)),
            retract(personnedans(W)),
                        retract(ferme(Y)),assert(ouverte(Y)),write('la porte '),write(Y),write(' est ouverte maintenant'),
            assert(personnedans(Y)),write('vous etes dans: '),write(Y),poser(Z),assert(dans(Z,Y)),!.





apporter(Objet,Lieu):-main(Objet),personnedans(Lieu),write(Objet),write( 'dans '),write(Lieu),!.



apporter(Objet,Lieu):- not( main(Objet)),dans(Objet,Old),personnedans(Ex),aller(Ex,Old),prendre(Objet),retract(dans(Objet,Old)),aller(Old,Lieu),poser(Objet),assert(dans(Objet,Lieu)),write(Objet),write( 'est dans '),write(Lieu),!.

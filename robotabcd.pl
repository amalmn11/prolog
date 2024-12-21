:-dynamic(dans/1).
:-dynamic(ouvert/2).
:-dynamic(ferme/2).


dans(a).

ouvert(a,b).
ouvert(b,c).
ferme(c,e).
ferme(e,f).

ferme(f,d).

%ferme(c,d).

%ferme(d,a).


%deplacer le robot vers de X vers Y en prenant en consideration que la
%la porte entre X et Y est fermé
deplacer(X,Y):-dans(X),ferme(X,Y),
               format("la porte est ferme entre ~w et ~w ",[X,Y]),nl,
               ouvrir(X,Y),
               format("la porte est ouvert entre ~w et ~w ",[X,Y]),nl,
               retract(dans(X)),
               assert(dans(Y)),format("le Robot est dans ~w",[Y]),nl.



%deplacer le robot vers de X vers Y en prenant en consideration que la
%la porte entre X et Y est ouverte
deplacer(X,Y):-dans(X),
               ouvert(X,Y),format("le porte est ouvert entre ~w et ~w ",[X,Y]),nl,
               retract(dans(X)),
               assert(dans(Y)),format("le Robot est dans ~w",[Y]),nl.


%deplacer(X,Y):-dans(X),
              % ouvert(X,Z),
              % deplacer(X,Z),
              % ouvert(Z,Y),
              % deplacer(Z,Y).

               %j'ajote ça pour eviter que par exemple
               %deplacer(a,c) dans(c) ==> true donc pas de probleme
               %mais si je fais aussi dans(b) ==> aussi true
               %c'est pour cela je fait retract(dans(Z)).
              % retract(dans(Z)).






%foction principale de deplacement de a vers d
deplacer(X,Y):-dans(X),format("le Robot est dans ~w ",[X]),nl,deplacer(X,Z),nl,deplacer(Z,Y).

%ouvrir la porte s'il est ferme
ouvrir(X,Y):-ferme(X,Y),
             format("ouvrir la porte entre ~w et ~w ",[X,Y]),nl,
             retract(ferme(X,Y)),
             assert(ouvert(X,Y)).



p:-abolish(dans/1),abolish(ouvert/2),abolish(ferme/2).



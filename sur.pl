:-dynamic(sur/2).
:-dynamic(libre/1).

sur(a,terre).
sur(b,terre).
sur(c,a).
sur(d,c).

libre(c).
libre(b).

% deplacer(X,Y):-libre(Y),libre(X),retract(libre(Y)),assert(sur(X,Y)),format("~w
% est sur ~w ",[X,Y]).


liberer(X):-not(libre(X)),sur(Y,X),libre(Y),retract(sur(Y,X)),assert(sur(Y,terre)),assert(libre(X)).

surterre(X,terre):-libre(X),surterre(X,terre).

surterre(X,terre):-libre(X),not(surterre(X,terre)),retract(not(surterre(X,terre))),assert(surterre(X,terre)).

surterre(X,terre):-not(libre(X)),liberer(X),surterre(X,terre).



liberer(X):-not(libre(X)),sur(Y,X),not(libre(Y)),liberer(Y),retract(sur(Y,X)),assert(libre(X)).


deplacer(Z,Y,X):-not(libre(Z)),liberer(Z),retract(sur(Z,Y)),assert(libre(Y)),not(libre(X)),liberer(X),assert(sur(Z,X)),retract(libre(X)),assert(sur(Y,Z)),retract(libre(Z)),format("~w est sur ~w sur ~w ",[Z,X,Y]).



p:-abolish(libre/1),abolish(sur/2).









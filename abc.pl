:-dynamic(sur/2).
:-dynamic(libre/1).

%sur(a,terre).
sur(b,terre).
%sur(c,terre).

%sur(c,b).
%sur(b,c).
%sur(c,a).
sur(a,c).
sur(c,b).

%sur(c,a).
%sur(d,c).
%sur(e,b).
%sur(f,e).


libre(a).
%libre(f).
%libre(e).
%libre(d).
%libre(c).

%libre(b).

%Liberer un element qui est se trouve au dessous d'un element libre
liberer(X):-not(libre(X)),
           sur(Y,X),
           libre(Y),
           retract(sur(Y,X)),
           assert(sur(Y,terre)),
           assert(libre(X)).


% liberer un element qui est se trouve au dessous d'un element qui
% n'est pas libre
liberer(X):-not(libre(X)),
           sur(Y,X),
           not(libre(Y)),
           liberer(Y),
           retract(sur(Y,X)),
           assert(sur(Y,terre)),
           assert(libre(X)).

%l'element est deja sur terre
surterre(X,terre):-sur(X,terre).


%l'element n'est aps sur terre mais il est libre
surterre(X,terre):-not(sur(X,terre)),
                  libre(X),
                  sur(X,Y),
                  retract(sur(X,Y)),
                  assert(libre(Y)),
                  assert(sur(X,terre)).

%l'element est sur terre mais il est pas libre
surterre(X,terre):-not(sur(X,terre)),
                  not(libre(X)),
                  liberer(X),
                  sur(X,Y),
                  retract(sur(X,Y)),
                  assert(libre(Y)),
                  assert(sur(X,terre)).


%mettre un element qui est libre sur un autre qui est aussi libre
deplacer(X,Y):-libre(Y),libre(X),
               assert(sur(X,Y)),
               retract(libre(Y)).


%mettre un element qui n'est pas libre sur un autre qui est libre
deplacer(X,Y):-libre(Y),not(libre(X)),
               liberer(X),
               sur(X,Z),
               retract(sur(X,Z)),
               assert(sur(X,Y)),
               assert(libre(Z)).


% mettre un element qui n'est pas libre sur un autre qui est aussi n'est
% pas libre
deplacer(X,Y):-not(libre(Y)),not(libre(X)),
               liberer(Y),liberer(X),
               sur(X,Z),
               retract(sur(X,Z)),
               assert(sur(X,Y)),
               assert(libre(Z)).


%mettre tous les element sur terre et deplacer les element un par un
super:-surterre(a,terre),surterre(b,terre),surterre(c,terre),deplacer(b,a),write("b est sur a "),nl,deplacer(c,b),write("c est sur b").


p:-abolish(libre/1),abolish(sur/2).



:-dynamic(sur/2).
:-dynamic(libre/1).

%sur(a,terre).
%sur(b,terre).
sur(c,terre).
%sur(e,terre).


%sur(c,b).
%sur(b,c).
%sur(c,a).
sur(a,c).
%sur(c,b).
sur(b,a).
%sur(a,b).
%sur(d,b).
%sur(d,a).

%libre(d).
%sur(c,a).
%sur(d,c).
%sur(e,b).
%sur(f,e).

%sur(c,e).
%libre(a).
%libre(f).
%libre(e).
%libre(d).
%libre(c).

libre(b).


liberer(X):-not(libre(X)),
           sur(Y,X),
           libre(Y),format("=> ~w est sur ~w",[Y,X]),nl,
           format("~w est libre",[Y]),nl,
           retract(sur(Y,X)),format("extraire ~w",[Y]),nl,
           assert(sur(Y,terre)),format("mettre ~w sur terre",[Y]),nl,
           assert(libre(X)),format("~w est libre maintenant",[X]),nl,nl.


liberer(X):-not(libre(X)),
           sur(Y,X),format("~w est sur ~w",[Y,X]),nl,
           not(libre(Y)),format("~w n'est pas libre",[Y]),nl,
           format("liberer ~w :",[Y]),nl,
           liberer(Y),
           retract(sur(Y,X)),format("retirer ~w de ~w ",[Y,X]),nl,
           assert(sur(Y,terre)),format("mettre ~w sur terre",[Y]),nl,
           assert(libre(X)),format("~w sur libre maintenant",[X]),nl,nl.



deplacer(X,Y):-libre(Y),
               libre(X),format("~w est libre",[Y]),nl,
               format("~w est libre",[X]),nl,
               sur(X,Z),format("~w est sur ~w",[X,Z]),nl,

               assert(sur(X,Y)),format("on deplace ~w sur  ~w",[X,Y]),nl,
               retract(sur(X,Z)),format("~w n'est plus sur ~w ",[X,Z]),nl,
               retract(libre(Y)),format("~w n'est plus libre",[Y]),nl,nl,
               assert(libre(Z)).%format("~w devienne libre",[Z]),nl.


deplacer(X,Y):-libre(Y),
               not(libre(X)),format("~w est libre",[Y]),nl,
               format("~w n'est pas libre",[X]),nl,
               format("liberer ~w :",[X]),nl,
               liberer(X),
               sur(X,Z),format("~w est sur ~w",[X,Z]),nl,
               assert(sur(X,Y)),format("on deplace ~w sur  ~w",[X,Y]),nl,
               retract(sur(X,Z)),format("~w n'est plus sur ~w ",[X,Z]),nl,
               retract(libre(Y)),format("~w n'est plus libre",[Y]),nl,nl,
               assert(libre(Z)).%format("~w devienne libre",[Z]),nl.


deplacer(X,Y):-not(libre(Y)),format("~w n'est pas libre",[Y]),nl,
               format("liberer ~w :",[Y]),nl,
               liberer(Y),
               sur(Y,Z),format("~w est sur ~w ",[Y,Z]),nl,
               retract(sur(Y,Z)),format("~w n'est plus sur ~w ",[Y,Z]),nl,
               assert(sur(Y,terre)),format("~w est sur terre",[Y]),nl,
               assert(libre(Y)),
               deplacer(X,Y),deplacer(Z,Y).




surterre(X,terre):-sur(X,terre),format("~w est sur terre",[X]),nl.


surterre(X,terre):-not(sur(X,terre)),
                   libre(X),format("~w n'est pas sur terre",[X]),nl,
                   format("~w est libre",[X]),nl,
                   sur(X,Y),format("~w est sur ~w",[X,Y]),nl,


                   assert(sur(X,terre)),format("mettre ~w sur la terre",[X]),nl,
                   retract(sur(X,Y)),format("~w n'est plus dans ~w ",[X,Y]),nl.

surterre(X,terre):-not(sur(X,terre)),
                   not(libre(X)),format("~w n'est pas sur terre",[X]),nl,
                   format("~w n'est pas libre",[X]),nl,
                   format("liberer ~w",[X]),nl,
                   liberer(X),
                   sur(X,Y),format("~w est sur ~w",[X,Y]),nl,
                   assert(sur(X,terre)),format("mettre ~w sur la terre",[X]),nl,
                   retract(sur(X,Y)),format("~w n'est plus dans ~w ",[X,Y]),nl.



%super(X,Y,Z):-sur(Y,X),deplacer(Z,Y).


super(X,Y,Z):-deplacer(Y,X),deplacer(Z,Y).

super(X,Y,Z):-sur(Y,terre),sur(X,terre),sur(Z,terre),deplacer(Y,X),deplacer(Z,Y).



p:-abolish(sur/2),abolish(libre/1).

:-dynamic sur/2.
:-dynamic libre/1.


%sur(a,terre).
sur(c,terre).
sur(b,a).
sur(a,c).
%libre(a).
libre(b).



librer(X):-libre(X).
librer(X):-not(libre(X)),sur(Y,X),libre(Y),retract(sur(Y,X)),assert(sur(Y,terre)),assert(libre(X)).
librer(X):-not(libre(X)),sur(Y,X),not(libre(Y)),sur(Z,Y),libre(Z),retract(sur(Z,Y)),assert(sur(Z,terre)),assert(libre(Y)),retract(sur(Y,X)),assert(sur(Y,terre)),assert(libre(X)).

surterre(X):-sur(X,terre),writeln(X:' sur terre').
surterre(X):-not(sur(X,terre)),librer(X),retract(sur(X,Y)),assert(sur(X,terre)),assert(libre(Y)),writeln(X:' est met sur terre').

build(A,B,C):-sur(A,terre),sur(B,A),sur(C,B),writeln('deja bien structuree').
build(A,B,C):-sur(A,terre),
    writeln(A:' sur terre'),
    libre(A),
    writeln(A:' est libre'),
    libre(B),
    writeln(B:' est libre'),
    retract(sur(B,_)),assert(sur(B,A)),
    write(', on a met ':B),writeln(' sur ':A),
    retract(sur(C,_)),assert(sur(C,B)),
    writeln('on a met':C),write(' sur ':B).

build(A,B,C):-surterre(A),surterre(B),surterre(C),retract(sur(B,terre)),
    assert(sur(B,A)),
    write(', on a met':B),write(' sur ':A),
    retract(sur(C,terre)),
    assert(sur(C,B)),
   write(A:'=> terre '),

   write(', on a met':C),write('sur ':B).


vider:-abolish(sur/2),abolish(libre/1).




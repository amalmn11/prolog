liaison(casa,rabat).
liaison(rabat,fes).
liaison(fes,benimellal).
liaison(benimellal,marrakech).
liaison(marrakech,casa).
liaison(marrakech,agadir).
liaison(fes,oujda).


chemain(X,Y):-liaison(X,Y),write(Y).
chemain(X,Z):-write(X),write("->"),liaison(X,Y),chemain(Y,Z),write(Y),write("-").




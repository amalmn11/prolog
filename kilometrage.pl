liaison(casa,marrakech,200).
liaison(marrakech,agadir,200).
liaison(casa,rabat,100).
liaison(rabat,fes,200).
liaison(fes,benimellal,300).
liaison(benimellal,marrakech,100).
liaison(fes,oujda,300).


chemain(X,Y,T):-liaison(X,Y,T).
chemain(X,Z,T):-liaison(X,Y,T1),chemain(Y,Z,T2),T is T1+T2.

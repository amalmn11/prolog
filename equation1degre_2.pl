solutuion(A,B,C):-A=0,B=0,C=0,write("pas de solution !!").
solutuion(A,B,C):-A=0,S is (-C/B),format("la solution est ~2f",[S]).
solutuion(A,B,C):-N is (B*B),M is (4*A*C),D is N-M,D=0,S is (-B/(2*A)),format("la solution est ~2f",[S]).
solutuion(A,B,C):-N is (B*B),M is (4*A*C),D is N-M,D>0,S1 is (((-B) - sqrt(D))/(2*A)),S2 is (((-B) + sqrt(D))/(2*A)),format("la solution est  ~2f et ~2f",[S1,S2]).
solutuion(A,B,C):-N is (B*B),M is (4*A*C),D is N-M,D<0,write("Pas de solution dans R").




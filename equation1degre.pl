solution(0,0,0,_,_):-write("pas de solution").
solution(0,B,C,X1,X2):- X1 is -C/B,X2 is -C/B,write(X1),write(X2).
delta(A,B,C,S):-E is (B*B),F is 4*A*C,S is E-F.
solution(A,B,C,X1,X2):-delta(A,B,C,S),S = 0,X1 is -B/2*A,X2 is 0,write(X1).
solution(A,B,C,X1,X2):-delta(A,B,C,S),S > 0,X1 is (((-B) - sqrt(S)) / (2*A)),X2 is (((-B) + sqrt(S)) / (2*A)).
solution(A,B,C,X1,X2):-delta(A,B,C,S),S<0,write("delta est negatif !! pas de solution dans R").




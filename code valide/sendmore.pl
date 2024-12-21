chiffre(0).
chiffre(1).
chiffre(2).
chiffre(3).
chiffre(4).
chiffre(5).
chiffre(6).
chiffre(7).
chiffre(8).
chiffre(9).
r(0).
r(1).

solution(M,E,N,D,S,O,R,Y):- r(M),
chiffre(S),S\==M,chiffre(O),O\==M,O\==S,r(R3),
R4 is M,A1 is S+M+R3, B1 is O+(10*R4),A1 = B1,
chiffre(E),E\==M,E\==S,E\==O,chiffre(N),N\==M,N\==S,N\==O,N\=E,r(R2),
A2 is O+E+R2, B2 is N+(10*R3), A2 = B2,
chiffre(R),R\==M,R\==S,R\==N,R\==O,R\==E,r(R1),
r(R2),A3 is N+R+R1, B3 is E+(10*R2) , A3 = B3,
chiffre(D),D\==M,D\==S,D\==O,D\==E,D\==N,D\==R,chiffre(Y),Y\==S,Y\==N,Y\==M,Y\==O,Y\==R,Y\==E,Y\=D,
A4 is D+E,B4 is Y+(10*R1) , A4 = B4.

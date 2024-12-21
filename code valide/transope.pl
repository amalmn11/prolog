

transposer([[],[]],[]).
transposer([[X],[Y]],[X,Y]).
transposer([[X1,X2],[Y1,Y2]],[[X1,Y1],[X2,Y2]]).


transposer([[H1|L1],[H2|L2]],[[H1,H2]|T]):-transposer([L1,L2],T),!.

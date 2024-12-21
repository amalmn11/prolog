:- use_module(library(clpfd)).

send_more_money(S, E, N, D, M, O, R, Y) :-
    Digits = [S, E, N, D, M, O, R, Y],
    Digits ins 0..9,
    all_distinct(Digits),

    S #\= 0, M #\= 0,              % Ensure leading zeros are not allowed

    SEND #= 1000*S + 100*E + 10*N + D,
    MORE #= 1000*M + 100*O + 10*R + E,
    MONEY #= 10000*M + 1000*O + 100*N + 10*E + Y,

    SEND + MORE #= MONEY,

    label(Digits).

% Example usage:
% ?- send_more_money(S, E, N, D, M, O, R, Y).








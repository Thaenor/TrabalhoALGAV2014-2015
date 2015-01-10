/*
gera interseccoes entre linhas
*/

interseccao([],_,[]).
interseccao([X|R],Y,[X|Z]):-member(X,Y),!,interseccao(R,Y,Z).
interseccao([_|R],Y,Z):-interseccao(R,Y,Z).

gera_cruzamentos:- findall(_,cruzamento,_).
cruzamento:-  linha(N1,LE1), linha(N2,LE2),
              N1 \== N2,
              interseccao(LE1,LE2,LI),
              LI \== [],
              assertz(cruza(N1,N2,LI)).


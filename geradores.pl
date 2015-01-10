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


conector(N,[]).
conector(N,[H1,H2|T]):- assertz(liga(N,H1,H2)),
					%write(liga(N,H1,H2)),
					conector(N, [H2|T]).

gera_ligacoes:- findall(_,ligador,_).
ligador:- linha(N1,LE1),
          conector(N1,LE1).
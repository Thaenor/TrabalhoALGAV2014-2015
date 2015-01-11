/*
gera interseccoes entre linhas
*/

intersecao([],_,[]).
intersecao([X|L],L1,[X|L2]):-member(X,L1),!,intersecao(L,L1,L2).
intersecao([_|L],L1,L2):-intersecao(L,L1,L2).

gera_cruzamentos:- findall(_,cruzamento,_).
cruzamento:-  linha(N1,LE1), linha(N2,LE2),
              N1 \== N2,
              intersecao(LE1,LE2,LI),
              LI \== [],
              assertz(cruza(N1,N2,LI)).


conector(_,[]).
conector(N,[H1,H2|T]):- assertz(liga(N,H1,H2)),
					%write(liga(N,H1,H2)),
					conector(N, [H2|T]).

gera_ligacoes:- findall(_,ligador,_).
ligador:- linha(N1,LE1),
          conector(N1,LE1).

uniao([ ],L,L).
uniao([X|L],L1,L2):- member(X,L1),!,uniao(L,L1,L2).
uniao([X|L],L1,[X|L2]):- uniao(L,L1,L2).

gera_estacoes:- findall(L,linha(_,L),LE),
				gera_estacoes(LE,Estacoes),
				assertz(estacoes(Estacoes)).

gera_estacoes([H|[]],H):-!.
gera_estacoes([H|T],U):-gera_estacoes(T,X),
					uniao(H,X,U).


gera_estacoes_linhas:- gera_estacoes,
				estacoes(Estacoes),
				%aqui temos a variavel Estacoes que contem uma lista de todas as estacoes sem duplicados
				percorreLista(Estacoes).

passa_linha(E,L):- findall(N,(linha(N,LE),member(E,LE)),L).

percorreLista([]):-!.
percorreLista([E|T]):- passa_linha(E,L),assertz(estacao_linhas(E,L)),percorreLista(T).
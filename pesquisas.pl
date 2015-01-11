%%%%%%%% Algoritmos auxiliares %%%%%%%%

%% Para criar e escrever em ficheiro
escreverFicheiro(NomeDoFicheiro,Conteudo):- 
				open(NomeDoFicheiro,write,Stream), 
         		write(Stream,Conteudo),  nl(Stream), 
         		close(Stream).

%% Para adicionar conteudo a ficheiro existente
adicionarAFicheiro(NomeDoFicheiro,Conteudo):- 
				open(NomeDoFicheiro,append,Stream), 
         		write(Stream,Conteudo),  nl(Stream), 
         		close(Stream).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Algoritmos de pesquisa

%%%%%%%% Algoritmos auxiliares %%%%%%%%
proximo_no(L,X,T,Z):- liga(L,X,Z), \+ member(Z,T).

proximo_no(X,T,Z,C):- liga(X,Z,C), \+ member(Z,T).

inverte(L,LI):-inverte(L,[],LI).
inverte([],LI,LI).
inverte([H|T],L,LI):-inverte(T,[H|L],LI).

melhor([(_,EstX)|T],M,EstM):-
	melhor(T,M,EstM),
	EstM =< EstX, !.
melhor([(X,EstX)|_],X,EstX).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Primeiro em Profundidade
primeiroProfundidade(Orig,Dest,Perc):- primeiroProfundidade([[Orig]],Dest,P), inverte(P,Perc).

primeiroProfundidade1([Prim|_],Dest,Prim):- Prim=[Dest|_].
primeiroProfundidade1([[Dest|_]|Resto],Dest,Perc):- !, primeiroProfundidade1(Resto,Dest,Perc).
primeiroProfundidade1([[Ult|T]|Outros],Dest,Perc):-
		findall([Z,Ult|T],proximo_no(Ult,T,Z),Lista),
		append(Lista,Outros,NPerc),
		write('NPerc:'), write(NPerc),nl,
		primeiroProfundidade1(NPerc,Dest,Perc).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Primeiro em Largura

primeiroLargura(Orig,Dest,Perc):- primeiroLargura1([Orig],Dest,P), inverte(P,Perc).

primeiroLargura1([Prim|_],Dest,Prim):- Prim=[Dest|_].
primeiroLargura1([[Dest|_]|Resto],Dest,Perc):- !, primeiroLargura1(Resto,Dest,Perc).

primeiroLargura1([[H|T]|Outros],Dest,Perc):-
		findall([X,H|T],
		proximo_no(H,T,X),Novos),
		append(Outros,Novos,Todos),
		primeiroLargura1(Todos,Dest,Perc).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Primeiro o Melhor
primeiroMelhor(Orig,Dest,L):-primeiroMelhor(Orig,Dest,[Orig],L).

primeiroMelhor(Dest,Dest,_,[Dest]).
primeiroMelhor(Orig,Dest,LA,[Orig|L]):-
	findall((X,EstX),
		(liga(Orig,X), \+ member(X,LA), estimativa(X,EstX)),LX),
	melhor(LX,MX,_),
	primeiroMelhor(MX,Dest,[MX|LA],L).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Branch and Bound
branch(Orig,Dest,Perc):-
	branch1([(0,[Orig])],Dest,P),
	reverse(P,Perc).

branch1([(_,Prim)|_],Dest,Prim):- Prim=[Dest|_].
branch1([(_,[Dest|_])|Resto],Dest,Perc):- !, branch1(Resto,Dest,Perc).
branch1([(C,[Ult|T])|Outros],Dest,Perc):-
		findall((NC,[Z,Ult|T]),
			(proximo_no(Ult,T,Z,C1),NC is C+C1),Lista),
		append(Outros,Lista,NPerc),
		sort(NPerc,NPerc1),
	write(NPerc1),nl,
		branch1(NPerc1,Dest,Perc).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% A*

hbf(Orig,Dest,Perc,Total):-
			estimativa(Orig,Dest,H), F is H + 0, % G = 0
			hbf1([c(F/0,[Orig])],Dest,P,Total),
			reverse(P,Perc).

hbf1(Percursos,Dest,Percurso,Total):-
			menor_percursoh(Percursos,Menor,Restantes),
			percursos_seguintesh(Menor,Dest,Restantes,Percurso,Total).

percursos_seguintesh(c(_/Dist,Percurso),Dest,_,Percurso,Dist):- Percurso=[Dest|_].
percursos_seguintesh(c(_,[Dest|_]),Dest,Restantes,Percurso,Total):-!,
	hbf1(Restantes,Dest,Percurso,Total).
percursos_seguintesh(c(_/Dist,[Ult|T]),Dest,Percursos,Percurso,Total):-
	findall(c(F1/D1,[Z,Ult|T]),proximo_noh(Ult,T,Z,Dist,Dest,F1/D1),Lista),
	append(Lista,Percursos,NovosPercursos),
	hbf1(NovosPercursos,Dest,Percurso,Total).

proximo_noh(X,T,Y,Dist,Dest,F/Dist1):-
					(estradah(X,Y,Z);estradah(Y,X,Z)),
					\+ member(Y,T),
					Dist1 is Dist + Z,
					estimativa(Y,Dest,H), F is H + Dist1.

estimativa(C1,C2,Est):-
		cidade(C1,X1,Y1),
		cidade(C2,X2,Y2),
		DX is X1-X2,
		DY is Y1-Y2,
		Est is sqrt(DX*DX+DY*DY).

% estimativa(_,_,0). % para desprezar a heurística.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Executar 'gera_cruzamentos' antes disto.
%% 3. Funcionalidades Rede de Metro

indexOf([Element|_], Element, 0):- !.
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1),
  !,
  Index is Index1+1.

% 1.18 (**):  Extract a slice from a list

% slice(L1,I,K,L2) :- L2 is the list of the elements of L1 between
%    index I and index K (both included).
%    (list,integer,integer,list) (?,+,+,?)

slice([X|_],1,1,[X]).
slice([X|Xs],1,K,[X|Ys]) :- K > 1, 
   K1 is K - 1, slice(Xs,1,K1,Ys).
slice([_|Xs],I,K,Ys) :- I > 1, 
   I1 is I - 1, K1 is K - 1, slice(Xs,I1,K1,Ys).

innerList(Orig,Dest,List,Perc):-
				indexOf(List,Orig,I),
				indexOf(List,Dest,K),IF is I + 1, KF is K + 1,
				(slice(List,IF,KF,Perc);slice(List,KF,IF,Perc)),!.

%menosTrocas('La Defense Grande Arche','Charles de Gaulle - Etoile',C,Trocas).
%menosTrocas(Orig,Dest,Caminho,CTrocas):-(linha(_,X),member(Orig,X),member(Dest,X),innerList(Orig,Dest,X,Caminho),CTrocas is 0).

maisRapido(Orig,Dest,Caminho):-maisRapido2(Dest,[[Orig]],Caminho).

maisRapido2(Dest,[[Dest|T]|_],Cam):-reverse([Dest|T],Cam),escreverFicheiro('maisRapido.txt',Cam),!.

maisRapido2(Dest,[[H|T]|Outros],Cam):-
					findall([X,H|T],
						(Dest\==H,
							liga(_,H,X),
							not(member(X,[H|T]))),
						Novos),
					append(Outros,Novos,Todos),
					%write(Todos),nl,
					maisRapido2(Dest,Todos,Cam).


menosTrocas(Orig,Dest,Caminho,CTrocas):-menosTrocas2(Dest,[[Orig]],Caminho,0,CTrocas).

menosTrocas2(Dest,[[Dest|T]|_],Cam,_,_):-reverse([Dest|T],Cam),escreverFicheiro('menosTrocas.txt',Cam).

menosTrocas2(Dest,[[H|T]|Outros],Cam,LAnterior,CTrocas):-
					findall([X,H|T],
						(Dest\==H,
							liga(_,H,X),
							not(member(X,[H|T]))),
						Novos),
					append(Outros,Novos,Todos),
					%write(Todos),nl,
					menosTrocas2(Dest,Todos,Cam,LAtual,CTrocasAtual).

visitaMeioDia(LPDI,Orig,Dest,Caminho):-
		maisRapido(Orig,Dest,Caminho),
		subset(LPDI,Caminho),!.

subset([ ],_).
subset([H|T],List) :-
	pdi(X|H,_,_), % busca a estacao que tem o ponto de interesse
    member(X,List), % verifica se a estacao existe na lista de estacoes que pertence ao percurso
    subset(T,List).

:-dynamic cruza/3, estacoes/1, estacao_linhas/2.
% este gera_caminho é capaz de gerar o caminho entre duas estações que servem de cruzamento entre linhas.
gera_caminho(E1,E2,LC):- 
			estacao_linhas(E1,LE1),
			estacao_linhas(E2,LE2),
			caminho(E1, LE1, E2, LE2,[],LC).

caminho(E1,LE1,E2,LE2,_,[(E1,E2,Linha)]):-
				intersecao(LE1,LE2,LC),
				member(Linha,LC),!.

caminho(E1,LE1,E2,LE2,LLV,[(E1,EI,Linha)|LC]):-
				member(Linha,LE1),
				(not(member(Linha,LE1))),
				cruza(Linha,_,L),
				member(EI,L),
				estacao_linhas(EI,LEI),
				caminho(EI,LEI,E2,LE2,[Linha|LLV],LC).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
maisRapido(Origem,Destino,ListaTrajeto,CTempo):-.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

menorPercursoAPe(Origem,Destino,ListaTrajeto,CDistanciaAPe):-.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Funcionalidades Pontos de interesse

%% 5. Visitas de meio dia / dia inteiro

visitaMeioDia():-.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

visitaDiaInteiro():-.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 6. Visita Circular (Origem = Destino)
%%% LocalInicial - pode ser local de interesse ou estação de metro.
visitaCircular(LocalInicial, HoraInicial, ListaLocais, NomeDoFicheiro):-.
*/
% Trabalho Prático de ALGAV %
% 	  Francisco Santos      %
% 		  Rui Silva 		%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base de conhecimento

%% 1. Rede de Metro
%%% Linhas
linha("1").
linha("2").
linha("3").
linha("3bis").
linha("4").
linha("5").
linha("6").
linha("7").
linha("7bis").
linha("8").
linha("9").
linha("10").
linha("11").
linha("12").
linha("13").
linha("14").
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Estações
%para linha 1
estacao("la defense grande arche"). % 2 %
estacao("charles de gaulle etoile"). %2 6%
estacao("franklin d roosevelt"). %9 %
estacao("champs elysees clemenceau	"). %13 %
estacao("concorde"). %8 12 %
estacao("palais royal musee du louvre	"). %7 %
estacao("chatelet"). %4 7 11 14 %
estacao("hotel de ville"). %11 %
estacao("bastille bassin de larsenal"). %5 8 %
estacao("gare de lyon"). %14 %
estacao("reuilly diderot"). %8 %
estacao("nation"). %2 6 9 %
estacao("porte de vincennes"). %3a 3b %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Cruzamentos
cruzamento().
cruzamento().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Direções
direcao().
direcao().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 2. Horarios
horario().
horario().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 4. Pontos de interesse
pontoInteresse().
pontoInteresse().
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%% Algoritmos auxiliares %%%%%%%%

%% Para criar e escrever em ficheiro
escreverFicheiro(NomeDoFicheiro,Conteudo):- 
				open(’NomeDoFicheiro.txt’,write,Stream), 
         		write(Stream,’Conteudo’),  nl(Stream), 
         		close(Stream).

%% Para adicionar conteudo a ficheiro existente
adicionarAFicheiro(NomeDoFicheiro,Conteudo):- 
				open(’NomeDoFicheiro.txt’,append,Stream), 
         		write(Stream,’Conteudo’),  nl(Stream), 
         		close(Stream).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Algoritmos de pesquisa

%%%%%%%% Algoritmos auxiliares %%%%%%%%
proximo_no(X,T,Z):- liga(X,Z), \+ member(Z,T).

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
primeiroProfundidade(Orig,Dest,Perc):- primeiroProfundidade1([[Orig]],Dest,P), inverte(P,Perc).

primeiroProfundidade1([Prim|Resto],Dest,Prim):- Prim=[Dest|_].
primeiroProfundidade1([[Dest|T]|Resto],Dest,Perc):- !, primeiroProfundidade1(Resto,Dest,Perc).
primeiroProfundidade1([[Ult|T]|Outros],Dest,Perc):-
		findall([Z,Ult|T],proximo_no(Ult,T,Z),Lista),
		append(Lista,Outros,NPerc),
		write('NPerc:'), write(NPerc),nl,
		primeiroProfundidade1(NPerc,Dest,Perc).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Primeiro em Largura
primeiroLargura(Orig,Dest,Perc):- primeiroLargura1([[Orig]],Dest,P), inverte(P,Perc).

primeiroLargura1([Prim|Resto],Dest,Prim):- Prim=[Dest|_].
primeiroLargura1([[Dest|T]|Resto],Dest,Perc):- !, primeiroLargura1(Resto,Dest,Perc).
primeiroLargura1([[Ult|T]|Outros],Dest,Perc):-
		findall([Z,Ult|T],proximo_no(Ult,T,Z),Lista),
		append(Outros,Lista,NPerc),
		write('NPerc:'), write(NPerc),nl,
		primeiroLargura1(NPerc,Dest,Perc).
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

%% 3. Funcionalidades Rede de Metro
menosTrocas(Origem,Destino,ListaTrajeto,CTrocas):-.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
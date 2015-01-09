% Trabalho Prático de ALGAV %
% 	  Francisco Santos      %
% 		  Rui Silva 		%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Base de conhecimento

%% 1. Rede de Metro
%%% Linhas
linha(1,['La Defense Grande Arche','Esplanade de la Defense','Pont de Neuilly','Les Sablons Jardin dAcclimatation','Porte Maillot Palais des Congres','Argentine','Charles de Gaulle — Etoile','George V','Franklin D. Roosevelt','Champs-Elysees — Clemenceau Grand Palais','Concorde','Tuileries','Palais Royal — Musee du Louvre','Louvre — Rivoli','Chatelet','Hotel de Ville','Saint-Paul Le Marais','Bastille','Gare de Lyon','Reuilly — Diderot','Nation','Porte de Vincennes','Saint-Mande','Berault','Chateau de Vincennes']).

linha(2,['Porte Dauphine – Marechal de Lattre de Tassigny','Victor Hugo','Charles de Gaulle — Etoile','Terne','Courcelle','Moncea','Villier','Rom','Place de Clichy','Blanch','Pigall','Anvers – Sacre Coeur','Barbes — Rochechouart','La Chapelle','Stalingrad','Jaures','Colonel Fabien','Belleville','Couronnes','Menilmontant','Pere Lachaise','Philippe Auguste','Alexandre Dumas','Avron','Nation']).

linha(3,['Pont de Levallois — Becon','Anatole France','Louise Michel','Porte de Champerret','Pereire','Marechal Juin','Wagram','Malesherbes','Villiers','Europe','Saint-Lazare','Havre — Caumartin','Opera','Quatre-Septembre','Bourse','Sentier','Reaumur — Sebastopol','Arts et Metiers','Temple','Republique	','Parmentier	','Rue Saint-Maur','Pere Lachaise	','Gambetta	','Porte de Bagnolet','Gallieni']).

linha(4,['Gambetta','Pelleport','Saint-Fargeau','Porte des Lilas']).

linha(5, ['Bobigny — Pablo Picasso Préfecture — Hôtel du Département','Bobigny — Pantin — Raymond Queneau	Bobigny','Église de Pantin','Hoche	Pantin','Porte de Pantin – Parc de la Villette','Ourcq','Laumière','Jaurès','Stalingrad','Gare du Nord','Gare de l’Est – Verdun','Jacques Bonsergent','République','Oberkampf','Richard-Lenoir','Bréguet — Sabin','Bastille','Quai de la Rapée','Gare d’Austerlitz','Saint-Marcel','Campo-Formio','Place d’Italie']).

linha(6,['Charles de Gaulle — Etoile','Kleber','Boissiere','Trocadero','Passy','Bir-Hakeim Tour Eiffel','Dupleix','La Motte-Picquet — Grenelle','Cambronne','Sevres — Lecourbe','Pasteur','Montparnasse — Bienvenue','Edgar Quinet','Raspail','Denfert-Rochereau','Saint-Jacques','Glaciere','Corvisart','Place dItalie','Nationale','Chevaleret','Quai de la Gare','Bercy','Dugommier','Daumesnil – Felix Eboue','Bel-Air','Picpus – Courteline','Nation']).

linha(7,['La Courneuve — 8 Mai 1945','Fort d’Aubervilliers','Aubervilliers — Pantin — Quatre Chemins','Porte de la Villette – Cite des Sciences et de lIndustrie','Corentin Cariou','Crimee','Riquet','Stalingrad','Louis Blanc','Chateau-Landon','Gare de l’Est, Verdun','Poissonniere','Cadet','Le Peletier','Chaussee dAntin — La Fayette','Opera','Pyramides','Palais Royal — Musee du Louvre','Pont Neuf	1er,','Chatelet','Pont Marie – Cite des Arts','Sully — Morland','Jussieu','Place Monge Jardin des Plantes — Arenes de Lutece','Censier — Daubenton','Les Gobelins','Place dItalie','Tolbiac','Maison Blanche','Le Kremlin-Bicetre','Villejuif — Leo Lagrange','Villejuif — Paul Vaillant-Couturier — Hopital Paul Brousse','Villejuif — Louis Aragon','Porte dItalie','Porte de Choisy','Porte dIvry','Pierre et Marie Curie','Mairie dIvry']).

linha(8,['Balard','Lourmel','Boucicaut','Felix Faure','Commerce','La Motte-Picquet — Grenelle	','Ecole Militaire','La Tour-Maubourg','Invalides','Concorde','Madeleine','Opera','Richelieu — Drouot','Grands Boulevards','Bonne Nouvelle','Strasbourg — Saint-Denis','Republique','Filles du Calvaire','Saint-Sebastien — Froissart','Chemin Vert','Bastille','Ledru-Rollin','Faidherbe — Chaligny','Reuilly — Diderot','Montgallet','Daumesnil – Felix Eboué','Michel Bizot','Porte Doree','Porte de Charenton','Liberte','Charenton — Ecoles – Place Aristide Briand','Ecole Veterinaire de Maisons-Alfort','Maisons-Alfort — Stade','Maisons-Alfort — Les Juilliottes','Creteil — LEchat Hopital Henri Mondor','Creteil — Universite','Creteil — Prefecture Hotel de Ville']).

linha(9,['Pont de Sevres','Billancourt','Marcel Sembat','Porte de Saint-Cloud Parc des Princes','Exelmans','Michel-Ange — Molitor','Michel-Ange — Auteuil','Jasmin','Ranelagh','La Muette','Rue de la Pompe','Trocadero','Iena','Alma — Marceau','Franklin D Roosevelt','Saint-Philippe du Roule','Miromesnil','Saint-Augustin','Havre — Caumartin','Chaussee dAntin — La Fayette','Richelieu — Drouot','Grands Boulevards','Bonne Nouvelle','Strasbourg — Saint-Denis','Republique','Oberkampf','Saint-Ambroise','Voltaire – Leon Blum','Charonne','Rue des Boulets','Nation','Buzenval','Maraichers','Porte de Montreuil','Robespierre','Croix de Chavaux – Place Jacques Duclos','Mairie de Montreuil']).

linha(10,['Boulogne — Pont de Saint-Cloud Rhin et Danube','Boulogne — Jean Jaures','Porte dAuteuil','Michel-Ange — Molitor','Michel-Ange — Auteuil','Chardon-Lagache','eglise dAuteuil','Mirabeau','Javel — Andre Citroen','Charles Michels	','Avenue emile Zola	','La Motte-Picquet — Grenelle	','Segur','Duroc','Vaneau','Sevres — Babylone','Mabillon','Odeon','Cluny — La Sorbonne','Maubert — Mutualite','Cardinal Lemoine','Jussieu','Gare dAusterlitz']).

linha(11,['Chatelet','Hotel de Ville','Rambuteau – Centre Georges Pompidou','Arts et Metiers','Republique','Goncourt – Hopital Saint-Louis','Belleville','Pyrenees','Jourdain','Place des Fetes','Telegraphe','Porte des Lilas','Mairie des Lilas']).

linha(12,['Porte de la Chapelle','Marx Dormoy','Marcadet — Poissonniers','Jules Joffrin','Lamarck — Caulaincourt','Abbesses – Butte Montmartre','Pigalle','Saint-Georges','Notre-Dame-de-Lorette','Trinite — dEstienne dOrves','Saint-Lazare','Madeleine','Concorde','Assemblee nationale','Solferino – Musee dOrsay','Rue du Bac','Sevres — Babylone','Rennes','Notre-Dame-des-Champs','Montparnasse — Bienvenue','Falguiere','Pasteur','Volontaires','Vaugirard – Adolphe Cherioux','Convention','Porte de Versailles Parc des Expositions de Paris','Corentin Celton','Mairie dIssy']).

linha(13,['Asnieres — Gennevilliers Les Courtilles','Les Agnettes','Gabriel Peri','Mairie de Clichy	Clichy','Porte de Clichy','Brochant','Saint-Denis — Universite','Basilique de Saint-Denis – Hotel de Ville','Saint-Denis — Porte de Paris Stade de France','Carrefour Pleyel','Mairie de Saint-Ouen','Garibaldi','Porte de Saint-Ouen','Guy Moquet','La Fourche','Place de Clichy','Liege','Saint-Lazare','Miromesnil','Champs-elysees — Clemenceau Grand Palais','Invalides','Varenne','Saint-François-Xavier','Duroc','Montparnasse — Bienvenue','Gaite','Pernety','Plaisance','Porte de Vanves','Malakoff — Plateau de Vanves','Malakoff — Rue Etienne Dolet','Chatillon — Montrouge']).

linha(14, ['Saint-Lazare', 'Madeleine', 'Pyramides', 'Châtelet', 'Gare de Lyon', 'Bercy', 'Cour Saint-Émilion', 'Bibliothèque François Mitterrand', 'Olympiades']).


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
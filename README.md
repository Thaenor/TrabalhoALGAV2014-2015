Trabalho ALGAV 2014 - 2015
======================

Projecto de ALGAV desenvolvido em PROLOG

Neste projecto temos de implementar em PROLOG um sistema que visa a ajudar utilizadores 
do metro de Paris a deslocarem-se pela cidade

Deve incluir as seguintes funcionalidades:

* Permitir a modelação da rede de metro, com indicação das linhas, estações, cruzamentos e direção.

* Permitir a incorporação do conceito de horário de funcionamento, tempos de viagem entre estações e frequências,que podem variar de acordo com os atributos:

 * dia / noite,
 * dia útil / sábado / domingo.

*  Dada a hora de comparência numa dada estação determinar o trajeto para chegar a outra estação de acordo com diferentes critérios:

 * Menos trocas
 * Mais rápido
 * Menor percurso a pé, considerando as deslocações entre linhas dentro da mesma estação (valores estimados com base na representação gráfica da rede).

* Permitir a modelação de alguns pontos de interesse turísticos com a indicação de atributos como horário de funcionamento (dias e horas), tempo estimado de 
visita, localização (estação ou estações de metro mais próximas).

* Planear visitas de meio dia (horas) ou dia inteiro (horas). Receba indicação dos locais que se pretendem visitar e elabora um plano de visita 
usando o metro como meio de transporte.

* Planear uma visita que começa e acaba no mesmo local usando o metro como meio de transporte e que deverá ser exportada para um ficheiro de texto.
Este ficheiro deverá conter os trajetos a fazer e a estimativa das horas parciais e de termino da visita. 
Deverão se fornecidos os locais de interesse que se deseja visitar, o local de inicio (que poderá ser um local de interesse ou uma estação de metro) e a hora 
de inicio.



##notas:##

* Para simplificação da base de conhecimentos, não consideramos um ramo da linha 7 (Le Kremlin-Bicêtre a Villejuif — Louis Aragon)


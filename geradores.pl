/*
gera interseccoes entre linhas
*/

generate_line_intersections:- 
		findall(_,line_intersection_generation,_).
line_intersection_generation:-
		line(N1,_,List1,_,_,_,_),
		line(N2,_,List2,_,_,_,_),
		N1 \== N2,
		intersection(List1,List2,Result),
		Result \== [],
		not(line_intersection(N1,N2,_)),
		assertz(line_intersection(N1,N2,Result)).
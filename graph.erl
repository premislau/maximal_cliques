%module containing functions dealing with graphs represented as adacency matrixes
-module(graph).

-export([get_row/2, neighbours/2, vertexes_list/1]).

%Searched is an index of vertex (indexes starting with 0)
get_row(G, Searched) -> iget_row(G, Searched, 0).

neighbours(G, Searched) -> ineighbours(get_row(G, Searched), Searched, [], 0).

vertexes_list(G) -> ivertexes_list(G, [], 0).

%auxiliary function for get_row/2
iget_row([H | _], Searched, Searched) -> H;
iget_row([_ | T], Searched, N) when Searched > N -> iget_row(T, Searched, N + 1);
iget_row(_,_,_)->no_such_row.

%auxiliary function for neighbours/2
ineighbours([], _, A, _) -> A;
ineighbours([0 | T], Searched, A, N) -> ineighbours(T, Searched, A, N + 1);
ineighbours([1 | T], Searched, A, N) -> ineighbours(T, Searched, A ++ [N], N + 1).

%auxiliary function for vertex_list/1
ivertexes_list([], Acc, _) -> Acc;
ivertexes_list([_ | T], Acc, N) -> ivertexes_list(T, Acc++[N], N + 1).
%module finding maximal cliques in a graph

-module(bk).

-export([find/1, find/4]).



find(G) ->
    find(G, set:create([]), set:create(graph:vertexes_list(G)), set:create([])).


find(_, R, [], []) -> 
    io:format("~w~n",[R]);%TODO: replace with report
find(G, R, P, X) ->
    invoking_step(G, R, P, X).


%auxiliray function
invoking_step(_, _, [], _) ->
    ok;
invoking_step(G, R, [HP | TP], X) ->
    %io:format("~w;~w;~w~n",[R,[HP | TP],X]),
    N=graph:neighbours(G, HP),
    find(
        G,
        set:union(R, set:create([HP])),
        set:intersection([HP | TP], N),
        set:intersection(X, N)
    ),
    invoking_step(G, R, TP, set:union(X, set:create([HP]))).
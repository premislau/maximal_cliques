%sets implemented using lists
%It works, but probably there are faster replacements

-module(set).

-export([union/2, remove/2, intersection/2, create/1, foreach/2]).

%set lists are assumed to be sorted in other functions in this module
create(L) -> lists:sort(L).

intersection(L1, L2) -> inter(L1, L2, []).

union(L1, L2) -> un(L1, L2, []).

remove(L1, L2) -> re(L1, L2, []).

foreach([], _) ->
    ok;
foreach([H1 | L1], F) ->
    F(H1),
    foreach(L1, F).


%auxiliary function for remove/2
re([], _, A) -> A;
re(L1, [], A) -> A ++ L1;
re([H | T1], [H | T2], A) -> re(T1, T2, A);
re([H1 | T1], [H2 | T2], A) when H1 < H2 -> re(T1, [H2 | T2], A ++ [H1]);
re([H1 | T1], [H2 | T2], A) when H1 > H2 -> re([H1 | T1], T2, A).

%auxiliary function for union/2
un([], [], A) -> A;
un([], L2, A) -> A ++ L2;
un(L1, [], A) -> A ++ L1;
un([H | T1], [H | T2], A) -> un(T1, T2, A ++ [H]);
un([H1 | T1], [H2 | T2], A) when H1 < H2 -> un(T1, [H2 | T2], A ++ [H1]);
un([H1 | T1], [H2 | T2], A) when H1 > H2 -> un([H1 | T1], T2, A ++ [H2]).

%auxiliary function for intersection/2
inter([], _, A) -> A;
inter(_, [], A) -> A;
inter([H | T1], [H | T2], A) -> inter(T1, T2, A ++ [H]);
inter([H1 | T1], [H2 | T2], A) when H1 < H2 -> inter(T1, [H2 | T2], A);
inter([H1 | T1], [H2 | T2], A) when H1 > H2 -> inter([H1 | T1], T2, A).
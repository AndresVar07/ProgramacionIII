% Hechos: el grafo es una lista de estructuras arco(Origen, Destino, Costo) 
grafo([arco(vancouver, edmonton, 16),
       arco(vancouver, calgary, 13),
       arco(edmonton, saskatoon, 12),
       arco(calgary, edmonton, 4),
       arco(calgary, regina, 14),
       arco(saskatoon, calgary, 9),
       arco(regina, saskatoon, 7),
       arco(saskatoon, winnipeg, 20),
       arco(regina, winnipeg, 4)]).

%  Reglas: 

arista(O, D, C) :- grafo(G), member(arco(O, D, C), G).


no_esta(_, []).
no_esta(X, [Y|Resto]) :- X \= Y, no_esta(X, Resto).

% ruta de X a Y sin repetir ciudades
camino(X, Y, Ruta, Costo) :-
    recorrer(X, Y, [X], RutaInv, Costo),
    reverse(RutaInv, Ruta).

recorrer(X, Y, Visitados, [Y|Visitados], Costo) :-
    arista(X, Y, Costo),
    no_esta(Y, Visitados).
recorrer(X, Y, Visitados, Ruta, Costo) :-
    arista(X, Z, C1),
    no_esta(Z, Visitados),
    recorrer(Z, Y, [Z|Visitados], Ruta, C2),
    Costo is C1 + C2.

conectado(X, Y) :- camino(X, Y, _, _).

tiene_aristas(N) :- arista(N, _, _).
tiene_aristas(N) :- arista(_, N, _).

costo_por(X, Y, Z, Costo) :-
    camino(X, Y, _, C1),
    camino(Y, Z, _, C2),
    Costo is C1 + C2.

% costo de recorrer una lista de ciudades dada
costo_ruta([_], 0).
costo_ruta([A, B|Resto], Costo) :-
    arista(A, B, C1),
    costo_ruta([B|Resto], C2),
    Costo is C1 + C2.

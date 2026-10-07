% Hechos: arista(Origen, Destino, Costo) 

arista(vancouver, edmonton, 16).
arista(vancouver, calgary, 13).
arista(edmonton, saskatoon, 12).
arista(calgary, edmonton, 4).
arista(calgary, regina, 14).
arista(saskatoon, calgary, 9).
arista(regina, saskatoon, 7).
arista(saskatoon, winnipeg, 20).
arista(regina, winnipeg, 4).

% Reglas

% X no aparece en la lista
no_esta(_, []).
no_esta(X, [Y|Resto]) :- X \= Y, no_esta(X, Resto).

% ruta de X a Y sin repetir nodos
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

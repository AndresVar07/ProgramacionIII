% Hechos
estadounidense(west).
enemigo(corea_del_sur, estados_unidos).
misil(m1).
tiene(corea_del_sur, m1).

% Reglas
arma(X) :- misil(X).
hostil(X) :- enemigo(X, estados_unidos).
vende(west, X, corea_del_sur) :- misil(X), tiene(corea_del_sur, X).

es_criminal(X) :-
    estadounidense(X),
    arma(Y),
    vende(X, Y, Z),
    hostil(Z).
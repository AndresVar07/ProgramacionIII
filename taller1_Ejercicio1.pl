% ---------- Hechos (relaciones directas) ----------
padre(abraham, herbert).
padre(abraham, homero).
padre(clancy, marge).
padre(clancy, patty).
padre(clancy, selma).
padre(homero, bart).
padre(homero, lisa).
padre(homero, maggie).

madre(mona, homero).
madre(jacqueline, marge).
madre(jacqueline, patty).
madre(jacqueline, selma).
madre(marge, bart).
madre(marge, lisa).
madre(marge, maggie).
madre(selma, ling).

% ---------- Reglas ----------
progenitor(X, Y) :- padre(X, Y).
progenitor(X, Y) :- madre(X, Y).

abuelo(X, Y) :- padre(X, Z), progenitor(Z, Y).
abuela(X, Y) :- madre(X, Z), progenitor(Z, Y).

hermano(X, Y) :- progenitor(P, X), progenitor(P, Y), X \= Y.

tio(X, Y) :- progenitor(P, Y), hermano(X, P).

primo(X, Y) :- progenitor(P, X), progenitor(Q, Y), hermano(P, Q).
% Hechos: estructura familia(Padre, Madre, ListaHijos) 
familia(abraham, mona, [herbert, homero]).
familia(clancy, jacqueline, [marge, patty, selma]).
familia(homero, marge, [bart, lisa, maggie]).
familia(ninguno, selma, [ling]).

% Reglas:
% padre y madre se obtienen buscando al hijo dentro de la lista
padre(X, Y) :- familia(X, _, Hijos), member(Y, Hijos).
madre(X, Y) :- familia(_, X, Hijos), member(Y, Hijos).

progenitor(X, Y) :- padre(X, Y).
progenitor(X, Y) :- madre(X, Y).

abuelo(X, Y) :- padre(X, Z), progenitor(Z, Y).
abuela(X, Y) :- madre(X, Z), progenitor(Z, Y).

hermano(X, Y) :- progenitor(P, X), progenitor(P, Y), X \= Y.

tio(X, Y) :- progenitor(P, Y), hermano(X, P).

primo(X, Y) :- progenitor(P, X), progenitor(Q, Y), hermano(P, Q).


hijos(P, Lista) :- familia(P, _, Lista).
hijos(P, Lista) :- familia(_, P, Lista).


hermanos(X, Lista) :- setof(Y, hermano(X, Y), Lista).


nietos(X, Lista) :- setof(Y, (abuelo(X, Y) ; abuela(X, Y)), Lista).

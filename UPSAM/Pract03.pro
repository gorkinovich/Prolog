/*----------------------------------------------------------------------*/
domains
   lista    = elemento*.
   elemento = integer.
/*----------------------------------------------------------------------*/
predicates
   crearLista1 (lista).
   crearLista2 (lista).
   crearLista3 (lista).
   menor (lista, elemento, lista).
   ordenar (lista, lista).
   prog (lista).
/*----------------------------------------------------------------------*/
clauses
   crearLista1 (L) :- L = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].
   crearLista2 (L) :- L = [0, 8, 2, 6, 4, 5, 3, 7, 1, 9].
   crearLista3 (L) :- L = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0].
/*----------------------------------------------------------------------*/
   menor ([L], Elem, []) :- Elem = L, !.
   menor ([C1|R1], Elem, LR) :- menor (R1, Elem2, LR2), C1 < Elem2,
                                Elem = C1, LR = [Elem2|LR2], !.
   menor ([C1|R1], Elem, LR) :- menor (R1, Elem2, LR2), Elem = Elem2,
                                LR = [C1|LR2], !.
/*----------------------------------------------------------------------*/
   ordenar ([], LR) :- LR = [], !.
   ordenar (L, LR) :- menor (L, Elem, L2), ordenar (L2, L3),
                      LR = [Elem|L3], !.
/*----------------------------------------------------------------------*/
   prog (LR) :- crearLista1 (L), ordenar (L, LR), !.
/*----------------------------------------------------------------------*/
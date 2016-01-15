/*----------------------------------------------------------------------*/
domains
   lista    = registro*.
   registro = producto (nombre, id, precio).
   nombre   = string.
   id       = integer.
   precio   = integer.
/*----------------------------------------------------------------------*/
predicates
   crearLista1 (lista).
   crearLista2 (lista).
   mayor (registro, registro).
   menor (registro, registro).
   igual (registro, registro).
   fusionListas (lista, lista, lista).
   programa (lista).
/*----------------------------------------------------------------------*/
clauses
   crearLista1 (L) :- L = [producto ("Disquetera", 5, 25),
                           producto ("Grabadora CD-R", 7, 75),
                           producto ("Lectora DVD", 8, 50),
                           producto ("Memoria Ram", 4, 50),
                           producto ("Raton Genius", 6, 10),
                           producto ("Raton Optico", 9, 25),
                           producto ("Raton PS/2", 1, 10),
                           producto ("Raton Serial", 3, 10),
                           producto ("Teclado MS", 2, 25)].
/*----------------------------------------------------------------------*/
   crearLista2 (L) :- L = [producto ("Disquetes 10 Unidades", 14, 25),
                           producto ("Grabadora DVD-R", 16, 200),
                           producto ("Joystick MS", 13, 50),
                           producto ("Memoria Ram", 12, 75),
                           producto ("Microprocesador", 17, 100),
                           producto ("Placa Base", 11, 100),
                           producto ("Teclado Estandar", 15, 10),
                           producto ("Teclado PS2", 10, 10)].
/*----------------------------------------------------------------------*/
   mayor (producto(N1, ID1, _), producto(N2, ID2, _)) :- N1 = N2,
                                                         ID1 > ID2.
   mayor (producto(N1, _, _), producto(N2, _, _))     :- N1 > N2.
/*----------------------------------------------------------------------*/
   menor (producto(N1, ID1, _), producto(N2, ID2, _)) :- N1 = N2,
                                                         ID1 < ID2.
   menor (producto(N1, _, _), producto(N2, _, _))     :- N1 < N2.
/*----------------------------------------------------------------------*/
   igual (producto(N1, ID1, _), producto(N2, ID2, _)) :- N1 = N2,
                                                         ID1 = ID2.
/*----------------------------------------------------------------------*/
/* fusionListas (L1, L2, LR).                                           */
/*----------------------------------------------------------------------*/
   fusionListas ([], [], LR) :- LR = [], !.
   fusionListas (L1, [], LR) :- LR = L1, !.
   fusionListas ([], L2, LR) :- LR = L2, !.
   fusionListas ([C1|R1], [C2|R2], LR) :- menor (C1, C2),
                                          fusionListas (R1, [C2|R2], L3),
                                          LR = [C1|L3], !.
   fusionListas ([C1|R1], [C2|R2], LR) :- mayor (C1, C2),
                                          fusionListas ([C1|R1], R2, L3),
                                          LR = [C2|L3], !.
   fusionListas ([C1|R1], [_|R2], LR)  :- fusionListas (R1, R2, L3),
                                          LR = [C1|L3], !.
/*----------------------------------------------------------------------*/
   programa (LR) :- crearLista1 (L1), crearLista2 (L2),
                    fusionListas (L1, L2, LR), !.
/*----------------------------------------------------------------------*/
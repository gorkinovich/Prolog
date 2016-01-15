/*----------------------------------------------------------------------*/
predicates
   calcular (integer, integer, integer).
   calcPadre (integer, integer).
   calcHijo (integer, integer).
   decidir (integer, integer).
   prog (integer).
/*----------------------------------------------------------------------*/
clauses
   /* (sqrt(50 * sueldo) + 250) */
   calcular (N, M, R) :- M = 12, Aux = 50 * N, R = (sqrt(Aux) + 250), !.
   calcular (N, M, R) :- M2 = M + 1, calcular (N, M2, R2),
                         Aux = 50 * R2, R = (sqrt(Aux) + 250), !.
   calcPadre (N, R) :- calcular (N, 1, R), !.
/*----------------------------------------------------------------------*/
   calcHijo (N, R) :- R = N * 12, !.
/*----------------------------------------------------------------------*/
   decidir (RH, RP) :- RH >= RP, write ("Pero vamos a ver... "),
                       write ("El padre intenta estafar al hijo..."), nl, !.
   decidir (_, _)   :- write ("El sueldo propuesto por el padre... "),
                       write ("Es satisfactorio para el hijo."), nl, !.
   prog (N) :- calcHijo (N, RH), calcPadre (N, RP), decidir (RH, RP), !.
/*----------------------------------------------------------------------*/
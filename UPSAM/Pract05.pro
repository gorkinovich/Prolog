/*======================================================================*/
domains
   lista  = factor*.
   factor = reg(numero, veces).
   numero = integer.
   veces  = integer.

/*======================================================================*/
predicates
   darFactor (integer, integer, integer, integer).
   crearNodo  (integer, integer, lista, lista).
   descomponer (integer, integer, lista).
   factorizar (integer, lista).
/*----------------------------------------------------------------------*/
   elevar (integer, integer, integer).
   darNum (lista, integer).
   darMayor (integer, integer, integer).
   darMenor (integer, integer, integer).
   darRegMayor (factor, factor, factor).
   darRegMenor (factor, factor, factor).
   cme (lista, lista, lista).
   cyncme (lista, lista, lista).
   mcd (integer, integer, integer). /*Maximo Comun Divisor*/
   mcm (integer, integer, integer). /*Minimo Comun Multiplo*/

/*======================================================================*/
clauses
   darFactor (X, F, N, R) :- (X mod F) = 0, X2 = X / F,
                          darfactor (X2, F, N2, R2),
                          R = R2, N = N2 + 1, !.
   darFactor (X, _, N, R) :- N = 0, R = X, !.
/*----------------------------------------------------------------------*/
   crearNodo (F, N, L2, L) :- N >< 0, L = [reg(F, N)|L2], !.
   crearNodo (_, _, L2, L) :- L = L2, !.
/*----------------------------------------------------------------------*/
   descomponer (X, F, L) :- X > 1, darfactor(X, F, N, X2),
                            F2 = F + 1, descomponer(X2, F2, L2),
                            crearNodo (F, N, L2, L), !.
   descomponer (_, _, L) :- L = [], !.
/*----------------------------------------------------------------------*/
   factorizar (X, L) :- X > 1, descomponer (X, 2, L), !.
   factorizar (X, L) :- X <= 1, L = [reg(1, 1)], !.

/*======================================================================*/
   elevar (N, V, R) :- V > 0, V2 = (V - 1), elevar (N, V2, R2),
                       R = (N * R2), !.
   elevar (_, V, R) :- V = 0, R = 1, !.
/*----------------------------------------------------------------------*/
   darNum ([reg(N, V)|Resto], R) :- darNum(Resto, R2), elevar (N, V, R3),
                                    R = R2 * R3, !.
   darNum ([], R) :- R = 1, !.
/*----------------------------------------------------------------------*/
   darMayor (N1, N2, R) :- N1 > N2, R = N1, !.
   darMayor (N1, N2, R) :- N1 <= N2, R = N2, !.

   darMenor (N1, N2, R) :- N1 < N2, R = N1, !.
   darMenor (N1, N2, R) :- N1 >= N2, R = N2, !.

   darRegMayor (reg(N1, V1), reg(N2, _), R) :- N1 > N2, R = reg(N1, V1), !.
   darRegMayor (reg(N1, _), reg(N2, V2), R) :- N1 <= N2, R = reg(N2, V2), !.

   darRegMenor (reg(N1, V1), reg(N2, _), R) :- N1 < N2, R = reg(N1, V1), !.
   darRegMenor (reg(N1, _), reg(N2, V2), R) :- N1 >= N2, R = reg(N2, V2), !.

/*----------------------------------------------------------------------*/
/* Comunes con su menor exponente                                       */
/*----------------------------------------------------------------------*/
   cme ([], [], LR) :- LR = [], !.
   cme (_, [], LR)  :- LR = [], !.
   cme ([], _, LR)  :- LR = [], !.

   cme ([reg(N1, V1)|R1], [reg(N2, V2)|R2], LR) :- N1 = N2,
       darMenor (V1, V2, V), cme (R1, R2, L), LR = [reg(N1, V)|L], !.

   cme ([reg(N1, V1)|R1], [reg(N2, _)|R2], LR) :- N1 > N2,
       cme ([reg(N1, V1)|R1], R2, L), LR = L, !.

   cme ([reg(N1, _)|R1], [reg(N2, V2)|R2], LR) :- N1 < N2,
       cme (R1, [reg(N2, V2)|R2], L), LR = L, !.

/*----------------------------------------------------------------------*/
/* Comunes y no comunes con su mayor exponente                          */
/*----------------------------------------------------------------------*/
   cyncme ([], [], LR) :- LR = [], !.
   cyncme (L1, [], LR) :- LR = L1, !.
   cyncme ([], L2, LR) :- LR = L2, !.

   cyncme ([reg(N1, V1)|R1], [reg(N2, V2)|R2], LR) :- N1 = N2,
       darMayor (V1, V2, V), cyncme (R1, R2, L), LR = [reg(N1, V)|L], !.

   cyncme ([reg(N1, V1)|R1], [reg(N2, V2)|R2], LR) :- cyncme (R1, R2, L),
       darRegMenor (reg(N1, V1), reg(N2, V2), Rmen),
       darRegMayor (reg(N1, V1), reg(N2, V2), Rmay),
       LAux = [Rmay|L], LR = [Rmen| LAux], !.

/*======================================================================*/
/* El máximo común divisor (m.c.d.; mcd) de dos o más números naturales
 * es el mayor divisor posible de todos ellos. Para el cálculo del máximo
 * común divisor de dos o más números se descompondrán los números en
 * factores primos y se tomarán los factores comunes con su menor exponente.
 *======================================================================*/
   mcd (N1, N2, R) :- factorizar (N1, L1), factorizar (N2, L2),
                      cme (L1, L2, L3), darNum (L3, R),
                      write("Maximo Comun Divisor"), nl,
                      write (N1), write(" -> "), write (L1), nl,
                      write (N2), write(" -> "), write (L2), nl, nl,
                      write (R), write(" -> "), write (L3), nl, !.

/*======================================================================*/
/* El mínimo común múltiplo (m.c.m.) de dos o más números naturales es el
 * menor número natural que es múltiplo de todos ellos. Para el cálculo
 * del mínimo común múltiplo de dos o más números se descompondrán los
 * números en factores primos y se tomarán los factores comunes y no
 * comunes con su mayor exponente.
 *======================================================================*/
   mcm (N1, N2, R) :- factorizar (N1, L1), factorizar (N2, L2),
                      cyncme (L1, L2, L3), darNum (L3, R),
                      write("Minimo Comun Multiplo"), nl,
                      write (N1), write(" -> "), write (L1), nl,
                      write (N2), write(" -> "), write (L2), nl, nl,
                      write (R), write(" -> "), write (L3), nl, !.

/*======================================================================*/
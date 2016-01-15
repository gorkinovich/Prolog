predicates
   hanoi (integer, string, string, string).

clauses
   hanoi (1, Inicio, Final, _) :-
      write ("Mover disco de "),
      write (Inicio),
      write (" a "),
      write (Final),
      nl.
   hanoi (N, Inicio, Fin, Aux) :-
      M = N - 1,
      hanoi (M, Inicio, Aux, Fin),
      hanoi (1, Inicio, Fin, Aux),
      hanoi (M, Aux, Fin, Inicio).

/*
 * a) Ejecutar el goal: hanoi (4, "Torre izquierda", "Torre derecha", "Torre auxiliar").
 *    Mover disco de Torre izquierda a Torre auxiliar
 *    Mover disco de Torre izquierda a Torre derecha
 *    Mover disco de Torre auxiliar a Torre derecha
 *    Mover disco de Torre izquierda a Torre auxiliar
 *    Mover disco de Torre derecha a Torre izquierda
 *    Mover disco de Torre derecha a Torre auxiliar
 *    Mover disco de Torre izquierda a Torre auxiliar
 *    Mover disco de Torre izquierda a Torre derecha
 *    Mover disco de Torre auxiliar a Torre derecha
 *    Mover disco de Torre auxiliar a Torre izquierda
 *    Mover disco de Torre derecha a Torre izquierda
 *    Mover disco de Torre auxiliar a Torre derecha
 *    Mover disco de Torre izquierda a Torre auxiliar
 *    Mover disco de Torre izquierda a Torre derecha
 *    Mover disco de Torre auxiliar a Torre derecha
 *    Yes
 * b) Construir el arbol de decision, con el depurador (Options | Compiler Directivs | Trace).
 *    CALL:    hanoi(4,"Torre izquierda","Torre derecha","Torre auxiliar")
 *    REDO:    hanoi(4,"Torre izquierda","Torre derecha","Torre auxiliar")
 *             3=3
 *    CALL:    hanoi(3,"Torre izquierda","Torre auxiliar","Torre derecha")
 *    REDO:    hanoi(3,"Torre izquierda","Torre auxiliar","Torre derecha")
 *             2=2
 *    CALL:    hanoi(2,"Torre izquierda","Torre derecha","Torre auxiliar")
 *    REDO:    hanoi(2,"Torre izquierda","Torre derecha","Torre auxiliar")
 *             1=1
 *    CALL:    hanoi(1,"Torre izquierda","Torre auxiliar","Torre derecha")
 *             write("Mover disco de ")
 *             write("Torre izquierda")
 *             write(" a ")
 *             write("Torre auxiliar")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre izquierda","Torre auxiliar","Torre derecha")
 *    CALL:    hanoi(1,"Torre izquierda","Torre derecha","Torre auxiliar")
 *             write("Mover disco de ")
 *             write("Torre izquierda")
 *             write(" a ")
 *             write("Torre derecha")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre izquierda","Torre derecha","Torre auxiliar")
 *    CALL:    hanoi(1,"Torre auxiliar","Torre derecha","Torre izquierda")
 *             write("Mover disco de ")
 *             write("Torre auxiliar")
 *             write(" a ")
 *             write("Torre derecha")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre auxiliar","Torre derecha","Torre izquierda")
 *    RETURN:  hanoi(2,"Torre izquierda","Torre derecha","Torre auxiliar")
 *    CALL:    hanoi(1,"Torre izquierda","Torre auxiliar","Torre derecha")
 *             write("Mover disco de ")
 *             write("Torre izquierda")
 *             write(" a ")
 *             write("Torre auxiliar")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre izquierda","Torre auxiliar","Torre derecha")
 *    CALL:    hanoi(2,"Torre derecha","Torre auxiliar","Torre izquierda")
 *    REDO:    hanoi(2,"Torre derecha","Torre auxiliar","Torre izquierda")
 *             1=1
 *    CALL:    hanoi(1,"Torre derecha","Torre izquierda","Torre auxiliar")
 *             write("Mover disco de ")
 *             write("Torre derecha")
 *             write(" a ")
 *             write("Torre izquierda")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre derecha","Torre izquierda","Torre auxiliar")
 *    CALL:    hanoi(1,"Torre derecha","Torre auxiliar","Torre izquierda")
 *             write("Mover disco de ")
 *             write("Torre derecha")
 *             write(" a ")
 *             write("Torre auxiliar")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre derecha","Torre auxiliar","Torre izquierda")
 *    CALL:    hanoi(1,"Torre izquierda","Torre auxiliar","Torre derecha")
 *             write("Mover disco de ")
 *             write("Torre izquierda")
 *             write(" a ")
 *             write("Torre auxiliar")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre izquierda","Torre auxiliar","Torre derecha")
 *    RETURN:  hanoi(2,"Torre derecha","Torre auxiliar","Torre izquierda")
 *    RETURN:  hanoi(3,"Torre izquierda","Torre auxiliar","Torre derecha")
 *    CALL:    hanoi(1,"Torre izquierda","Torre derecha","Torre auxiliar")
 *             write("Mover disco de ")
 *             write("Torre izquierda")
 *             write(" a ")
 *             write("Torre derecha")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre izquierda","Torre derecha","Torre auxiliar")
 *    CALL:    hanoi(3,"Torre auxiliar","Torre derecha","Torre izquierda")
 *    REDO:    hanoi(3,"Torre auxiliar","Torre derecha","Torre izquierda")
 *             2=2
 *    CALL:    hanoi(2,"Torre auxiliar","Torre izquierda","Torre derecha")
 *    REDO:    hanoi(2,"Torre auxiliar","Torre izquierda","Torre derecha")
 *             1=1
 *    CALL:    hanoi(1,"Torre auxiliar","Torre derecha","Torre izquierda")
 *             write("Mover disco de ")
 *             write("Torre auxiliar")
 *             write(" a ")
 *             write("Torre derecha")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre auxiliar","Torre derecha","Torre izquierda")
 *    CALL:    hanoi(1,"Torre auxiliar","Torre izquierda","Torre derecha")
 *             write("Mover disco de ")
 *             write("Torre auxiliar")
 *             write(" a ")
 *             write("Torre izquierda")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre auxiliar","Torre izquierda","Torre derecha")
 *    CALL:    hanoi(1,"Torre derecha","Torre izquierda","Torre auxiliar")
 *             write("Mover disco de ")
 *             write("Torre derecha")
 *             write(" a ")
 *             write("Torre izquierda")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre derecha","Torre izquierda","Torre auxiliar")
 *    RETURN:  hanoi(2,"Torre auxiliar","Torre izquierda","Torre derecha")
 *    CALL:    hanoi(1,"Torre auxiliar","Torre derecha","Torre izquierda")
 *             write("Mover disco de ")
 *             write("Torre auxiliar")
 *             write(" a ")
 *             write("Torre derecha")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre auxiliar","Torre derecha","Torre izquierda")
 *    CALL:    hanoi(2,"Torre izquierda","Torre derecha","Torre auxiliar")
 *    REDO:    hanoi(2,"Torre izquierda","Torre derecha","Torre auxiliar")
 *             1=1
 *    CALL:    hanoi(1,"Torre izquierda","Torre auxiliar","Torre derecha")
 *             write("Mover disco de ")
 *             write("Torre izquierda")
 *             write(" a ")
 *             write("Torre auxiliar")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre izquierda","Torre auxiliar","Torre derecha")
 *    CALL:    hanoi(1,"Torre izquierda","Torre derecha","Torre auxiliar")
 *             write("Mover disco de ")
 *             write("Torre izquierda")
 *             write(" a ")
 *             write("Torre derecha")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre izquierda","Torre derecha","Torre auxiliar")
 *    CALL:    hanoi(1,"Torre auxiliar","Torre derecha","Torre izquierda")
 *             write("Mover disco de ")
 *             write("Torre auxiliar")
 *             write(" a ")
 *             write("Torre derecha")
 *    CALL:    nl()
 *    RETURN:  nl()
 *    RETURN:  *hanoi(1,"Torre auxiliar","Torre derecha","Torre izquierda")
 *    RETURN:  hanoi(2,"Torre izquierda","Torre derecha","Torre auxiliar")
 *    RETURN:  hanoi(3,"Torre auxiliar","Torre derecha","Torre izquierda")
 *    RETURN:  hanoi(4,"Torre izquierda","Torre derecha","Torre auxiliar")
 */
********************************************************************************
*-- Programa: VMER.PRG
*-- Fecha   : 12/13/91
*-- Version : V.LEEGSTRA
*-- Notas   : CORRIGE VARIABLES DE POSICION DE LAS VENTANAS
********************************************************************************
STORE PROGRAM() TO ulpr
@ 0,36 SAY TIME() COLOR I
@ 0,47 SAY PADC(ulpr,10) COLOR I
STORE ' DE MERCADERIAS' TO me1
STORE 'Correcci¢n Variables de Posici¢n MERCADERIAS - ' TO me2
DEFINE WINDOW win FROM vmerr,vmerc TO vmerr+vmerla,vmerc+vmeran TITL " Correcci¢n Variables de Posici¢n " SHAD COLOR SCHE 8                     	    && DEFINE LA VENTANA DE TRABAJO
ACTI WIND win
@ 0,0 SAY REPL('-',vmeran-1)
@ 1,1 SAY 'INGRESO'+me1 COLO SCHE 20
@ 2,1 SAY 'Linea Inicial   ' GET imerr VALID imerr+imerla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-imerla))
@ 3,1 SAY 'Columna Inicial ' GET imerc VALID imerc+imeran<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-imeran))
@ 4,0 SAY REPL('-',vmeran-1)
@ 5,1 SAY 'CORRECCION'+me1 COLO SCHE 20
@ 6,1 SAY 'Linea Inicial   ' GET cmerr VALID cmerr+cmerla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-cmerla))
@ 7,1 SAY 'Columna Inicial ' GET cmerc VALID cmerc+cmeran<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-cmeran))
@ 8,0 SAY REPL('-',vmeran-1)
@ 9,1 SAY 'MUESTRA'+me1 COLO SCHE 20
@ 10,1 SAY 'Linea Inicial   ' GET mmerr VALID mmerr+mmerla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-mmerla))
@ 11,1 SAY 'Columna Inicial ' GET mmerc VALID mmerc+mmeran<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-mmeran))
@ 12,0 SAY REPL('-',vmeran-1)
@ 13,1 SAY 'POPUP'+me1 COLO SCHE 20
@ 14,1 SAY 'Linea Inicial   ' GET merpopr VALID merpopr<16 MESS me2+'L¡nea V lida: 0 - 15'
@ 15,1 SAY 'Columna Inicial ' GET merpopc VALID merpopc<66 MESS me2+'Columna V lida: 0 - 65'
@ 16,0 SAY REPL('-',vmeran-1)
@ 17,1 SAY 'CORRECCION VARIABLES'+me1 COLO SCHE 20
@ 18,1 SAY 'Linea Inicial   ' GET vmerr VALID vmerr+vmerla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-vmerla))
@ 19,1 SAY 'Columna Inicial ' GET vmerc VALID vmerc+vmeran<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-vmeran))
@ 20,0 SAY REPL('-',vmeran-1)
READ
RELE WIND win
RETURN
*: EOF: VMER.PRG

********************************************************************************
*-- Programa: VRUB.PRG
*-- Fecha   : 12/10/91
*-- Version : V.LEEGSTRA
*-- Notas   : CORRIGE VARIABLES DE POSICION DE LAS VENTANAS
********************************************************************************
STORE PROGRAM() TO ulpr
@ 0,36 SAY TIME() COLOR I
@ 0,47 SAY PADC(ulpr,10,' ') COLOR I
STORE ' DE '+RUVRO TO me1
STORE 'Correcci¢n Variables de Posici¢n '+RUVRO+' - ' TO me2
DEFINE WINDOW win FROM vrubr,vrubc TO vrubr+vrubla,vrubc+vruban TITL " Correcci¢n Variables de Posici¢n " SHAD COLOR SCHE 8
ACTI WIND win
@ 0,0 SAY REPL('-',vruban-1)
@ 1,1 SAY 'INGRESO'+me1 COLO SCHE 20
@ 2,1 SAY 'Linea Inicial   ' GET irubr VALID irubr+irubla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-irubla))
@ 3,1 SAY 'Columna Inicial ' GET irubc VALID irubc+iruban<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-iruban))
@ 4,0 SAY REPL('-',vruban-1)
@ 5,1 SAY 'CORRECCION'+me1 COLO SCHE 20
@ 6,1 SAY 'Linea Inicial   ' GET crubr VALID crubr+crubla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-crubla))
@ 7,1 SAY 'Columna Inicial ' GET crubc VALID crubc+cruban<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-cruban))
@ 8,0 SAY REPL('-',vruban-1)
@ 9,1 SAY 'MUESTRA'+me1 COLO SCHE 20
@ 10,1 SAY 'Linea Inicial   ' GET mrubr VALID mrubr+mrubla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-mrubla))
@ 11,1 SAY 'Columna Inicial ' GET mrubc VALID mrubc+mruban<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-mruban))
@ 12,0 SAY REPL('-',vruban-1)
@ 13,1 SAY 'POPUP'+me1 COLO SCHE 20
@ 14,1 SAY 'Linea Inicial   ' GET rubpopr VALID rubpopr<16 MESS me2+'L¡nea V lida: 0 - 15'
@ 15,1 SAY 'Columna Inicial ' GET rubpopc VALID rubpopc<66 MESS me2+'Columna V lida: 0 - 65'
@ 16,0 SAY REPL('-',vruban-1)
@ 17,1 SAY 'CORRECCION VARIABLES'+me1 COLO SCHE 20
@ 18,1 SAY 'Linea Inicial   ' GET vrubr VALID vrubr+vrubla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-vrubla))
@ 19,1 SAY 'Columna Inicial ' GET vrubc VALID vrubc+vruban<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-vruban))
@ 20,0 SAY REPL('-',vruban-1)
READ
RELE WIND win
RETURN
*: EOF: VRUB.PRG

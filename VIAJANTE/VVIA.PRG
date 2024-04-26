********************************************************************************
*-- Programa: VVIA.PRG
*-- Fecha   : 06/06/91
*-- Version : R. 'EL BATA'
*-- Notas   : CORRIGE VARIABLES DE POSICION DE LAS VENTANAS
********************************************************************************
stor PROGRAM() TO ulpr
@ 0,RH SAY TIME() COLOR I
@ 0,rp say PADC(ulpr,10) COLOR I
stor ' DE '+upper(bIAJAS) TO me1
stor 'Correcci¢n Variables de Posici¢n '+bIAJAS+' - ' TO me2
DEFINE WINDOW win FROM vviar,vviac TO vviar+vviala,vviac+vviaan TITL " Correcci¢n Variables de Posici¢n " SHAD COLOR SCHE 8                                 && DEFINE LA VENTANA DE TRABAJO
ACTI WIND win
@ 0,nul SAY REPL('-',vviaan-1)
@ 1,1 SAY 'INGRESO'+me1 COLO SCHE 20
@ 2,1 SAY 'Linea Inicial   ' GET iviar VALID iviar+iviala<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-iviala))
@ 3,1 SAY 'Columna Inicial ' GET iviac VALID iviac+iviaan<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-iviaan))
@ 4,nul SAY REPL('-',vviaan-1)
@ 5,1 SAY 'CORRECCION'+me1 COLO SCHE 20
@ 6,1 SAY 'Linea Inicial   ' GET cviar VALID cviar+cviala<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-cviala))
@ 7,1 SAY 'Columna Inicial ' GET cviac VALID cviac+cviaan<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-cviaan))
@ 8,nul SAY REPL('-',vviaan-1)
@ 9,1 SAY 'MUESTRA'+me1 COLO SCHE 20
@ 10,1 SAY 'Linea Inicial   ' GET mviar VALID mviar+mviala<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-mviala))
@ 11,1 SAY 'Columna Inicial ' GET mviac VALID mviac+mviaan<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-mviaan))
@ 12,nul SAY REPL('-',vviaan-1)
@ 13,1 SAY 'POPUP'+me1 COLO SCHE 20
@ 14,1 SAY 'Linea Inicial   ' GET viapopr VALID viapopr<16 MESS me2+'L¡nea V lida: 0 - 15'
@ 15,1 SAY 'Columna Inicial ' GET viapopc VALID viapopc<66 MESS me2+'Columna V lida: 0 - 65'
@ 16,nul SAY REPL('-',vviaan-1)
@ 17,1 SAY 'CORRECCION VARIABLES'+me1 COLO SCHE 20
@ 18,1 SAY 'Linea Inicial   ' GET vviar VALID vviar+vviala<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-vviala))
@ 19,1 SAY 'Columna Inicial ' GET vviac VALID vviac+vviaan<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-vviaan))
@ 20,nul SAY REPL('-',vviaan-1)
READ
RETURN RELEWIN("WIN")

********************************************************************************
*-- Programa: VCNX.PRG
*-- Fecha   : 01-18-92 09:28am
*-- Version : R. 'EL BATA'
*-- Notas   : CORRIGE VARIABLES DE POSICION DE LAS VENTANAS
********************************************************************************
STORE PROGRAM() TO ulpr
@ 0,36 SAY TIME() COLOR I
@ 0,47 SAY PADC(PROGRAM(),10,' ') COLOR I
STORE ' DE ZONAS DE UNIDADES' TO me1
STORE 'Correcci¢n Variables de Posici¢n ZONAS UNIDADES - ' TO me2
=movewin(vCNXr,vCNXc,vCNXr+vCNXla,vCNXc+vCNXan,'win'," Correcci¢n Variables de Posici¢n ")
@ 0,NUL SAY REPL('-',vCNXan-1)
@ 1,1 SAY 'INGRESO'+me1 COLO SCHE 20
@ 2,1 SAY 'Linea Inicial   ' GET iCNXr VALID iCNXr+iCNXla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-iCNXla))
@ 3,1 SAY 'Columna Inicial ' GET iCNXc VALID iCNXc+iCNXan<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-iCNXan))
@ 4,NUL SAY REPL('-',vCNXan-1)
@ 5,1 SAY 'CORRECCION'+me1 COLO SCHE 20
@ 6,1 SAY 'Linea Inicial   ' GET cCNXr VALID cCNXr+cCNXla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-cCNXla))
@ 7,1 SAY 'Columna Inicial ' GET cCNXc VALID cCNXc+cCNXan<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-cCNXan))
@ 8,NUL SAY REPL('-',vCNXan-1)
@ 9,1 SAY 'MUESTRA'+me1 COLO SCHE 20
@ 10,1 SAY 'Linea Inicial   ' GET mCNXr VALID mCNXr+mCNXla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-mCNXla))
@ 11,1 SAY 'Columna Inicial ' GET mCNXc VALID mCNXc+mCNXan<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-mCNXan))
@ 12,NUL SAY REPL('-',vCNXan-1)
@ 13,1 SAY 'CORR. VARIABLES '+me1 COLO SCHE 20
@ 14,1 SAY 'Linea Inicial   ' GET vCNXr VALID vCNXr+vCNXla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-vCNXla))
@ 15,1 SAY 'Columna Inicial ' GET vCNXc VALID vCNXc+vCNXan<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-vCNXan))
@ 16,NUL SAY REPL('-',vCNXan-1)
READ
RETURN RELEWIN('win')
*: EOF: VCNX.PRG

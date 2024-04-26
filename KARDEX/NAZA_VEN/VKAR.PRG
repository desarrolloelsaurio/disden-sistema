*:*********************************************************************
*:
*:        Program: VKAR.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 08/16/91     17:01
*:
*:      Called by: KAR.PRG
*:
*:      Documented 09/25/91 at 13:43               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: VKAR.PRG
*-- Fecha   : 06/06/91
*-- Version : V.LEEGSTRA
*-- Notas   : CORRIGE VARIABLES DE POSICION DE LAS VENTANAS
********************************************************************************
STORE PROGRAM() TO ulpr
=HORA_ULP()
STORE ' DE KARDEX' TO me1
STORE 'Correcci¢n Variables de Posici¢n KARDEX - ' TO me2
defi wind win FROM vkarr,vkarc TO vkarr+vkarla,vkarc+vkaran TITL " Correcci¢n Variables de Posici¢n " SHAD colo sche 8                         && DEFINE LA VENTANA DE TRABAJO
ACTI WIND win
@ nul,nul SAY REPL('-',vkaran-1)
@ 1,1 SAY 'INGRESO'+me1 COLO SCHE 20
@ 2,1 SAY 'Linea Inicial   ' GET ikarr VALID ikarr+ikarla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-ikarla))
@ 3,1 SAY 'Columna Inicial ' GET ikarc VALID ikarc+ikaran<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-ikaran))
@ 4,nul SAY REPL('-',vkaran-1)
@ 5,1 SAY 'MUESTRA'+me1 COLO SCHE 20
@ 6,1 SAY 'Linea Inicial   ' GET mkarr VALID mkarr+mkarla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-mkarla))
@ 7,1 SAY 'Columna Inicial ' GET mkarc VALID mkarc+mkaran<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-mkaran))
@ 8,nul SAY REPL('-',vkaran-1)
@ 9,1 SAY 'CORRECCION VARIABLES'+me1 COLO SCHE 20
@ 10,1 SAY 'Linea Inicial   ' GET vkarr VALID vkarr+vkarla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-vkarla))
@ 11,1 SAY 'Columna Inicial ' GET vkarc VALID vkarc+vkaran<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-vkaran))
@ 12,nul SAY REPL('-',vkaran-1)
READ
=relewin("WIN")
RETURN

*: EOF: VKAR.PRG


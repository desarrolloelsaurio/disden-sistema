********************************************************************************
*-- Programa: VVIX.PRG
*-- Fecha   : 06/06/91
*-- Version : R. 'EL BATA'
*-- Notas   : CORRIGE VARIABLES DE POSICION DE LAS VENTANAS
*-- Modificaci¢n GOYO 04-02-92 12:55pm
********************************************************************************
stor HORA_ULP(PROGRAM()) TO ulpr
stor ' DE ZONAS DE '+upper(bIAJAS) TO me1
stor 'Correcci¢n Variables de Posici¢n ZONAS '+upper(bIAJAS)+' - ' TO me2
=MOVEWIN(vvixr,vvixc,vvixr+vvixla,vvixc+vvixan,'WIN'," Correcci¢n Variables de Posici¢n ")
@ 0,nul SAY REPL('-',vvixan-1)
@ 1,1 SAY 'INGRESO'+me1 COLO SCHE 20
@ 2,1 SAY 'Linea Inicial   ' GET ivixr VALID ivixr+ivixla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-ivixla))
@ 3,1 SAY 'Columna Inicial ' GET ivixc VALID ivixc+ivixan<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-ivixan))
@ 4,nul SAY REPL('-',vvixan-1)
@ 5,1 SAY 'CORRECCION'+me1 COLO SCHE 20
@ 6,1 SAY 'Linea Inicial   ' GET cvixr VALID cvixr+cvixla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-cvixla))
@ 7,1 SAY 'Columna Inicial ' GET cvixc VALID cvixc+cvixan<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-cvixan))
@ 8,nul SAY REPL('-',vvixan-1)
@ 9,1 SAY 'MUESTRA'+me1 COLO SCHE 20
@ 10,1 SAY 'Linea Inicial   ' GET mvixr VALID mvixr+mvixla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-mvixla))
@ 11,1 SAY 'Columna Inicial ' GET mvixc VALID mvixc+mvixan<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-mvixan))
@ 12,nul SAY REPL('-',vvixan-1)
@ 13,1 SAY 'CORR. VARIABLES '+me1 COLO SCHE 20
@ 14,1 SAY 'Linea Inicial   ' GET vvixr VALID vvixr+vvixla<23 MESS me2+'L¡nea V lida: 0 - '+ALLTRIM(STR(22-vvixla))
@ 15,1 SAY 'Columna Inicial ' GET vvixc VALID vvixc+vvixan<79 MESS me2+'Columna V lida: 0 - '+ALLTRIM(STR(78-vvixan))
@ 16,nul SAY REPL('-',vvixan-1)
READ
=RELEWIN("win")
RETURN
*: EOF: VVIX.PRG

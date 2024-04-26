*:*********************************************************************
*:
*:        Program: INFIC2.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: BUEMPL.PRG                    
*:
*:      Documented 04/23/91 at 21:59               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: INFIC2.PRG
*-- Fecha   : 26/09/89
*-- Version : G. REINER
*-- Notas   : INGRESA CANTIDAD DE REGISTROS EN FICHERO ACTIVO
*	      INGRESA TEXTO DEL PEDIDO DE INGRESO
*	      LA RESPUESTA SALE EN RESPUESTA (PUBLICA)
********************************************************************************
PARAMETER txto,ptr,cosa
ACTI SCREEN
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
STORE SPACE(LEN(ptr)) TO respuesta
DEFINE WINDOW fic FROM 10,0 TO 14,78 DOUBLE TITL txto SHADOW COLOR SCHE 8
ACTI WINDOW fic
SET MESS TO txto
@ 1,1 SAY cosa COLOR SCHE 3
@ 1,70-LEN(ptr) GET respuesta PICTURE ptr MESS txto
READ
RELE WINDOW fic
SET MESS TO
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: INFIC2.PRG

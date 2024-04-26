*:*********************************************************************
*:
*:        Program: INFIC1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:      Called by: ELIEMP()       (function  in ELIEMP.PRG)
*:
*:      Documented 04/05/91 at 19:58               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: INFIC1.PRG
*-- Fecha   : 26/09/89
*-- Version : G. REINER
*-- Notas   : INGRESA CANTIDAD DE REGISTROS EN FICHERO ACTIVO
*             INGRESA TEXTO DEL PEDIDO DE INGRESO
*	           LA RESPUESTA SALE EN RESPUESTA (PUBLICA)
********************************************************************************
PARAMETER txs
ACTI SCREEN
STORE SPACE(10) TO respuesta
@ 24,0 SAY PADC(ALLTRIM(txs),80,' ')
DEFINE WINDOW fic FROM 10,0 TO 14,78 DOUBLE TITL txs SHADOW COLOR SCHE 8
ACTI WINDOW fic
@ 1,1 SAY txs+'([ENTER] Para Men£) ' GET respuesta
READ
RELE WINDOW fic
@ 24,0 SAY SPACE(80)
RELE txs
RETURN
*: EOF: INFIC1.PRG

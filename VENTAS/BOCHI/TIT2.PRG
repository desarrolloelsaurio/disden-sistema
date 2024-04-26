*:*********************************************************************
*:
*:        Program: TIT2.PRG
*:
*:         System:
*:         Author:
*:      Copyright (c) 1991,
*:  Last modified: 04/24/160     12:16
*:
*:      Called by: LISCATE.PRG
*:
*:      Documented 02/21/91 at 11:04               FoxDoc  version 2.01
*:*********************************************************************
*******************************************************************************
*-- Programa: TIT2.PRG
*-- Fecha   : 29/9/89
*-- Version : G. REINER
*-- Notas   : IMPRIME TITULO EN VENTANA. ACLARANDO LARGO DE LA VENTANA
********************************************************************************
PARAMETERS renglon,texto,como,largo
 
xxii=LEN(texto)
xxii=largo-xxii
xxii=INT(xxii/2)
@ renglon,xxii SAY texto COLOR &como
@ renglon-1,xxii-1 TO renglon+1,xxii+LEN(texto) DOUB
RETURN
*: EOF: TIT2.PRG

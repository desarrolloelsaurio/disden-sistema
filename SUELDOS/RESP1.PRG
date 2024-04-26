*:*********************************************************************
*:
*:        Program: RESP1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:      Called by: OPJAN.PRG                     
*:               : OPEMP.PRG                     
*:               : OPCAT.PRG                     
*:               : OPCON.PRG                     
*:               : OPCCOS.PRG                    
*:               : OPTHOR.PRG                    
*:
*:      Documented 04/11/91 at 11:20               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: RESP1.PRG
*-- Fecha   : 26/08/89
*-- Version : G. REINER
*-- Notas   : LLEGA DE TODOS LOS POPUPS
*	      LA RESPUESTA SE GUARDA EN 'RESPUESTA' (VARIABLE PUBLICA)
********************************************************************************
STORE BAR() TO respuesta
DEAC POPUP
RETURN
*: EOF: RESP1.PRG

*:*********************************************************************
*:
*:        Program: LKARI2.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 08/22/91     15:41
*:
*:      Called by: LKARI.PRG
*:
*:          Calls: LKARI3.PRG
*:               : ELITAL()       (function  in ELITAL.PRG)
*:
*:      Documented 09/25/91 at 13:46               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: lkarI2.prg
*-- Fecha   : 07/25/91 11:53am
*-- Version : G. REINER
*-- Notas   : DERIVA A listados DE kardex
********************************************************************************
ulpr=PROGRAM()
DO CASE
CASE BAR()=1
fisc=fsc
tt=t1+' - Todos los Talleres'
tt=ALLTRIM(LEFT(tt,78))
DO lkari3
CASE BAR()=2
fisc=fsc+' .and. taller=NUL'
tt=t1+' - Dep¢sito F brica'
DO lkari3
CASE BAR()=3
STOR NUL TO respuesta
IF !EMPTY(elital(" a Listar"))
xcos=RECNO()
fisc=fsc+' .and. taller=xcos'
tt=t1+' - '+ALLTRIM(tal->talleres)
tt=ALLTRIM(LEFT(tt,78))
DO lkari3
ENDIF
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
*: EOF: LKARI2.PRG


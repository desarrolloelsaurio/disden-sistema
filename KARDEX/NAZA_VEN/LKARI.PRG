*:*********************************************************************
*:
*:        Program: LKARI.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 08/22/91     16:00
*:
*:      Called by: KAR.PRG
*:
*:          Calls: ELIAVI()       (function  in ELIAVI.PRG)
*:               : LKARI2.PRG
*:               : ELITEL()       (function  in ELITEL.PRG)
*:               : ELITAL()       (function  in ELITAL.PRG)
*:               : LKARI4.PRG
*:               : INFIC1.PRG
*:               : LKARI5.PRG
*:
*:      Documented 09/25/91 at 13:43               FoxDoc  version 2.01
*:*********************************************************************
*******************************************************************************
*-- Programa: lkarI.prg
*-- Fecha   : 06/21/91 11:46am
*-- Version : G. REINER
*-- Notas   : DERIVA A listados DE kardex
********************************************************************************
ulpr=PROGRAM()
DO CASE
CASE BAR()=1
STOR NUL TO respuesta
IF !EMPTY(eliavi(" a Listar",-1,1))
fsc='tipo="'+LEFT(abio,1)+'" .and. articulo="'+avi->avicod+'"'
t1='Listado de Kardex - '+abio+':'+ALLTRIM(avi->avios)
respuesta='nada2#11#47#Taller a Listar#3#T\<odos los Talleres#\<Dep¢sito F brica#\<Un Taller'
=DEFPOP()
ON SELE POPU nada2 DO lkari2
ACTI POPU nada2
RELE POPU nada2
ENDIF
CASE BAR()=2
STOR NUL TO respuesta
IF !EMPTY(elitel(" a Listar",-1,1))
fsc='tipo="'+LEFT(tella,1)+'" .and. articulo="'+tel->telcod+'"'
t1='Listado de Kardex - '+tella+':'+ALLTRIM(tel->tela)
respuesta='nada2#11#47#Taller a Listar#3#T\<odos los Talleres#\<Dep¢sito F brica#\<Un Taller'
=DEFPOP()
ON SELE POPU nada2 DO lkari2
ACTI POPU nada2
RELE POPU nada2
ENDIF
CASE BAR()=3
STOR NUL TO respuesta
IF !EMPTY(elital(" a Listar",-1,1))
xcos=RECNO()
fisc='tALLER=XCOS'
tt='Listado de Kardex - Taller:'+ALLTRIM(tal->talleres)
DO lkari4
ENDIF
CASE BAR()=4
STOR NUL TO respuesta
DO infic1 WITH 'INGRESE N§ ORDEN DE '+UPPER(favri)+" a Listar",10
respuesta=VAL(respuesta)
IF !EMPTY(respuesta) .OR. LASTKEY()=27
xcos=respuesta
fisc='numero=XCOS'
tt='Listado de Kardex - Orden de '+favri+' N§:'+ALLTRIM(STR(xcos))
DO lkari5
ENDIF
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
RETURN
*: EOF: LKARI.PRG

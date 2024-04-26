*:*********************************************************************
*:
*:        Program: BKAR.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/25/91     13:03
*:
*:      Called by: KAR.PRG
*:
*:          Calls: CONFIRMA()     (function  in CONFIRMA.PRG)
*:               : ELIAVI()       (function  in ELIAVI.PRG)
*:               : ELITEL()       (function  in ELITEL.PRG)
*:               : IAUD.PRG
*:
*:      Documented 09/26/91 at 12:02               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: kar.prg
*-- Fecha   : 06/21/91 11:46am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE kardex
********************************************************************************
SELE seg
tx=""
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
DO CASE
CASE BAR()=1
IF confirma("Borrar el Archivo de Kardex COMPLETO ? ",.T.,10,2)
SELE kar
@ 24,nul SAY PADC(" Borrando el Archivo de Kardex ",80,"*") COLO SCHE 19
do flok with "kar"
DELE ALL
tx='ZAP '
UNLO IN kar
ENDIF
CASE BAR()=2
IF confirma("Borrar "+abios+" del Archivo de Kardex ? ",.T.,10,2)
SELE kar
@ 24,nul SAY PADC(" Borrando "+abios+" del Archivo de Kardex ",80,"*") COLO SCHE 19
do flok with "kar"
DELE FOR tipo=LEFT(abio,1)
tx='BORRA '+UPPER(abios)+' '
UNLO IN kar
ENDIF
CASE BAR()=3
IF confirma("Borrar "+tellas+" del Archivo de Kardex ? ",.T.,10,2)
@ 24,nul SAY PADC(" Borrando "+tellas+" del Archivo de Kardex ",80,"*") COLO SCHE 19
SELE kar
do flok with "kar"
DELE FOR tipo=LEFT(tella,1)
tx='BORRA '+UPPER(tellas)+' '
UNLO IN kar
ENDIF
CASE BAR()=4
STOR NUL TO respuesta
IF !EMPTY(eliavi(" a Borrar"))
IF confirma("Borrar "+ALLTRIM(avi->avios)+" del Archivo de Kardex ? ",.T.,10,2)
SELE kar
@ 24,nul SAY PADC(" Borrando "+ALLTRIM(avi->avios)+" del Archivo de Kardex ",80,"*") COLO SCHE 19
do flok with "kar"
DELE FOR tipo=LEFT(abio,1) .AND. articulo=avi->avicod
tx='BORRA '+UPPER(abio)+' '+avi->avios
UNLO IN kar
ENDIF
ENDIF
CASE BAR()=5
STOR NUL TO respuesta
IF !EMPTY(elitel(" a Borrar"))
IF confirma("Borrar "+ALLTRIM(tel->tela)+" del Archivo de Kardex ? ",.T.,10,2)
SELE kar
@ 24,nul SAY PADC(" Borrando "+ALLTRIM(tel->tela)+" del Archivo de Kardex ",80,"*") COLO SCHE 19
do flok with "kar"
DELE FOR tipo=LEFT(tella,1) .AND. articulo=tel->telcod
tx='BORRA '+UPPER(tella)+' '+tel->tela
UNLO IN kar
ENDIF
ENDIF
ENDCASE
IF !EMPTY(tx)
DO iaud WITH tx+' KARDEX'
ENDIF
ELSE
=relewin("WIN")
=iaudi()
ENDIF
ulpr=PROGRAM()
@ 24,nul SAY SPACE(80)
RETURN

*: EOF: BKAR.PRG

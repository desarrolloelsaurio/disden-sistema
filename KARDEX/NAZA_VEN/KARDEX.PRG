*:*********************************************************************
*:
*:        Program: KARDEX.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 08/15/91     16:27
*:
*:      Called by: MERCAD.PRG
*:
*:          Calls: OPOPK.PRG
*:               : GRL1.PRG
*:               : OPK.PRG
*:               : OPMER.PRG
*:               : OPKAR.PRG
*:               : KAR.PRG
*:
*:      Documented 09/25/91 at 13:26               FoxDoc  version 2.01
*:*********************************************************************
*********************************************************************************
*-- Programa: kardex.prg
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
@ nul,nul SAY REPLICATE("Û",80) COLO W
@ nul,1 SAY PADC('Comercializaci¢n',21) COLO I
@ nul,23 SAY '|'
@ nul,25 SAY DATE() COLO I
@ nul,34 SAY '|'
@ nul,RP SAY PADC(PROGRAM(),10) COLO I
@ nul,58 SAY '|'
@ nul,60 SAY PADL(janname,19,' ') COLO I
DO CASE
CASE BAR()=1
=OPOPK()
DO grl1 WITH 5,20,'Men£ de Operaciones de Kardex'
ON SELE POPU grl DO opk
ACTI POPU grl
RELE POPU grl
CASE BAR()=2
=OPMER()
=OPKAR()
DO grl1 WITH 5,20,'Men£ de Kardex'
ON SELE POPU grl DO kar
ACTI POPU grl
RELE POPU grl
ENDCASE
=MEN_LIN(BOTOM)
RETURN
*: EOF: KARDEX.PRG


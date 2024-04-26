*:*********************************************************************
*:
*:        Program: ERROR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: ERROR1.PRG     (procedure in PROCESOS.PRG)
*:               : ERROR.PRG                     
*:               : CLIQ.PRG                      
*:               : RLIQ1.PRG                     
*:               : IADE1.PRG                     
*:               : GLADE1.PRG                    
*:
*:          Calls: HLP.PRG
*:               : ERROR.PRG
*:
*:      Documented 04/23/91 at 19:50               FoxDoc  version 2.01
*:*********************************************************************
*******************************************************************************
*-- Programa: ERROR.PRG
*-- Fecha   : 12/13/90 08:09pm
*-- Version : G. REINER
*-- Notas   : PROGRAMA DE ERROR
********************************************************************************
SET DEVICE TO SCRE
IF PRINTSTATUS()
   ON PAGE
   SET PRINTER TO
   SET PRINTER OFF
ENDIF
SET CONS ON
ACTI SCRE
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),5,' ') COLOR I
IF .NOT. EMPTY(ALIAS())
   GOTO BOTTOM
ENDIF
DEAC WIND ALL
_WRAP=.F.
CLEA
DEFINE WINDOW err FROM 4,5 TO 20,69 DOUB TITL ' *** ERROR *** ' SHAD COLO SCHE 8
ACTI WIND err
@ 4,5  SAY 'Programa:'
@ 4,15 SAY ulpr
@ 6,5 SAY 'Error:'
@ 6,15 SAY ERROR()
@ 8,5 SAY 'Tipo :'
@ 8,15 SAY MESSAGE()
@ 10,5 SAY 'L¡nea:'
@ 10,15 SAY MESSAGE(1)
DO WHILE INKEY()=0
ENDDO
RELE WIND err
ON KEY LABEL shift-f1 DO hlp
@ 0,0 SAY REPLICATE("Û",80) COLOR W
@ 0,1 SAY 'Sueldos y Jornales' COLOR I
@ 0,20 SAY '|'
@ 0,22 SAY DATE() COLOR I
@ 0,32 SAY '|'
@ 0,34 SAY TIME() COLOR I
@ 0,44 SAY '|'
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 0,58 SAY '|'
@ 0,60 SAY LEFT(janname,19) COLOR I
ON ERROR DO ERROR
RETURN TO MASTER

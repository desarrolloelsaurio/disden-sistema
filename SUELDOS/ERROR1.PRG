*:*********************************************************************
*:
*:        Program: ERROR1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:      Called by: RLIQ1.PRG                     
*:
*:          Calls: ERROR.PRG
*:               : ERROR2()       (function  in ERROR2.PRG)
*:               : HLP.PRG
*:
*:      Documented 04/06/91 at 17:01               FoxDoc  version 2.01
*:*********************************************************************
*******************************************************************************
*-- Programa: ERROR1.PRG
*-- Fecha   : 01/09/91 02:51pm
*-- Version : G. REINER
*-- Notas   : PROGRAMA DE ERROR
********************************************************************************
ACTI SCRE
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ulpr=PROGRAM()
ON ERROR DO ERROR
SET DEVICE TO SCRE
SET CONS ON
DEAC WIND ALL
_WRAP=.F.
CLEA
DEFINE WINDOW err FROM 4,3 TO 22,76 DOUB TITL ' *** ERROR *** ' SHAD COLO SCHE 8
ACTI WIND err
@ 2,10  SAY 'Programa:'
@ 2,20 SAY ulpr
@ 4,10 SAY 'Error:'
@ 4,20 SAY ERROR()
@ 6,10 SAY 'Tipo :'
@ 6,20 SAY MESSAGE()
@ 8,5 SAY "Se produjo un Error Mientras se Estaban Procesando los Sueldos"
respuesta=""
IF ERROR()=10
   @ 5,10 SAY "Es un ERROR DE SINTAXIS en el archivo de "+error2(&xa)
ELSE
   IF ERROR()=12
      @ 10,5 SAY "Es una VARIABLE DESCONOCIDA en el archivo de "+error2(&xa)
   ENDIF
ENDIF
@ 12,5 SAY "y Apareci¢ Calculando la F¢rmula para "
?? IIF(cat->periodo="M","Mensuales","Quincenales")
@ 14,5 SAY "En el Registro:"
?? STR(liq->registro,5)
IF liq->archivo<>"XXX"
   xa="'"+ALLTRIM(liq->archivo)+"'"
   SELE &xa
   GOTO liq->registro
   ?? ' - '
   ?? &respuesta
ENDIF
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
RETURN TO MASTER
*: EOF: ERROR1.PRG

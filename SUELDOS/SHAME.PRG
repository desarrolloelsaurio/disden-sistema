*:*********************************************************************
*:
*:        Program: SHAME.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/27/90      0:00
*:
*:      Called by: RLIQ1.PRG                     
*:
*:           Uses: &A.DBF         
*:
*:      Documented 04/06/91 at 17:01               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: shame.prg
*-- Fecha   : 02/01/91 10:53am
*-- Version : g. reiner
*-- Notas   : avisa que es una vergšenza
********************************************************************************
ACTI SCRE
DEFINE WINDOW err FROM 2,4 TO 22,74 DOUB TITL ' *** ERROR *** ' SHAD COLO SCHE 8
ACTI WIND err
_RMARGIN=60
_WRAP=.T.
_ALIGNMENT='CENTER'
?
?
? 'ES UNA VERGšENZA !'
?
?
? 'UN EMPRESARIO SERIO COMO USTED TRATANDO DE PIRATEAR UN PROGRAMA !'
?
?
? 'NO LO HAGA NUEVAMENTE !'
?
?
SELE 25
SCAN
   A=ALLTRIM(prg)+'.FXP'
   IF FILE(A)
      ERASE &a
   ENDIF
ENDSCAN
DO WHILE INKEY()=0
ENDDO
RELE WIND err
SET CLEAR OFF
QUIT
RETURN
*: EOF: SHAME.PRG

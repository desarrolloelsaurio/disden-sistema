********************************************************************************
*-- Programa: Gdia.PRG
*-- Fecha   : 02/27/91 03:36pm
*-- Version : G. REINER
*-- Notas   : GENERALIZA HORAS TRABAJADAS en el dia
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 10,0 TO 14,79
IF elithor(' a Generalizar')<>0
   GOTO respuesta
   @ 24,0 SAY PADC(' Generalizando Horas Trabajadas ',80,'*')
   DEFINE WINDOW win FROM 10,0 TO 15,77 TITL " Cantidad de "+ALLTRIM(hortipohor)+' a Generalizar' SHAD COLOR SCHE 8
   ACTI WIND win
   STORE 0 TO cantidad
   STORE DAY(DATE()) TO iom
   @ 1,10 SAY 'Cantidad de Horas ' GET cantidad PICTURE '999.99'
   @ 2,10 SAY 'Fecha de las Horas' GET iom PICTURE '99'
   READ
   ACTI SCRE
   IF cantidad>0
      maxiom=maxiom(DATE())
      IF iom>0 .AND. iom<=maxiom
         @ 24,0 SAY PADC(' Generalizando Horas Trabajadas del d¡a '+ALLTRIM(STR(iom,4))+' ',80,'*')
         ulpr=PROGRAM()
         tiho=RECNO()
         SELE emp
         SCAN FOR &fisc
            SELE dia
            APPE BLAN
            REPL legajo WITH emp->legajo
            REPL fecha WITH iom
            REPL thor WITH tiho
            REPL horas WITH cantidad
            REPL ccos WITH emp->ccos
            REPL empleado WITH RECNO("EMP")
            SELE emp
         ENDSCAN
      ENDIF
   ENDIF
ENDIF
RELE tiho,cantidad,iom,maxiom
RELE WIND win
@ 24,0 SAY SPACE(80)
RETURN

*: EOF: GDIA1.PRG

*:*********************************************************************
*:
*:        Program: CPAR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: PAR.PRG                       
*:
*:          Calls: EXISTE         (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:50               FoxDoc  version 2.01
*:*********************************************************************
*********************************************
*-- Programa: CPAR
*-- Fecha   : 24/07/90
*-- Version : G. REINER
*-- Notas   : CORRIGE DATOS PARENTESCOS
*********************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ff=RECNO()
me1=' CORRECCION PARENTESCOS '
DEFINE WINDOW win FROM 12,20 TO 16,60 DOUBLE TITL ' Correcci¢n Datos Parentescos ' SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,2 SAY "PARENTESCO" COLOR SCHE 3
SCATTER MEMVAR
@ 1,17 GET m->parentesco PICTURE "XXXXXXXXXXXXXXXXXXXX";
   MESSAGE me1+'- [ESC] para Men£'
READ
IF LASTKEY()<>27
   m->parentesco=PROPER(m->parentesco)
   IF m->parentesco<>parentesco
      IF ISALPHA(m->parentesco)
         SET DELE OFF
         SEEK ALLTRIM(m->parentesco)
         SET DELE ON
         IF FOUND()
            SET MESS TO 'PARENTESCO '+TRIM(UPPER(m->parentesco))+' EXISTE - ENTER PARA CONTINUAR'
            DO existe WITH ' PARENTESCO'
            DO WHILE INKEY()=0
            ENDDO
            CLEA
         ELSE
            GOTO ff
            GATHER MEMVAR
         ENDIF
      ENDIF
   ENDIF
ENDIF
RELE WIND win
RELE ff,parentesco,me1
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: CPAR.PRG

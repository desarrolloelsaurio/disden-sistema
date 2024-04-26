*:*********************************************************************
*:
*:        Program: IPAR.PRG
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
*:      Documented 04/23/91 at 20:49               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: IPAR
*-- Fecha   : 24/07/90
*-- Version : G. REINER
*-- Notas   : INGRESA DATOS PARENTESCO
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 11,20 TO 15,60 DOUBLE TITL ' Ingreso Datos Parentescos ' SHAD COLO SCHE 8
ACTI WINDOW win
me1=' INGRESO PARENTESCOS '
DO WHILE .T.
   SCATTER MEMVAR BLANK
   @ 1,2 SAY "PARENTESCO" COLOR SCHE 3
   @ 1,17 GET m->parentesco PICTURE "XXXXXXXXXXXXXXXXXXXX";
      MESSAGE me1+'- [ENTER] para Men£'
   READ
   IF ISALPHA(m->parentesco)
      m->parentesco=PROPER(m->parentesco)
      SET DELE OFF
      SEEK ALLTRIM(m->parentesco)
      SET DELE ON
      IF FOUND()
         @ 24,0 SAY PADC('Parentesco '+ALLTRIM(m->parentesco)+' existe - Enter para continuar',80,' ')
         DO existe WITH ' PARENTESCO'
         DO WHILE INKEY()=0
         ENDDO
         CLEAR
      ELSE
         SET MESS TO 'Grabando los datos ingresados'
         APPEND BLANK
         GATHER MEMVAR
      ENDIF
   ELSE
      EXIT
   ENDIF
ENDDO
DEAC WINDOW ALL
RELE parentesco,me1
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: IPAR.PRG

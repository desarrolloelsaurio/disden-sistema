*:*********************************************************************
*:
*:        Program: IESP.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: ESP.PRG                       
*:
*:          Calls: EXISTE         (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:49               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: IESP
*-- Fecha   : 24/07/90
*-- Version : G. REINER
*-- Notas   : INGRESA DATOS ESPECIALIDADES
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
me1=' Ingreso Especialidades '
DEFINE WINDOW win FROM 7,20 TO 11,60 DOUBLE TITL ' Ingreso Datos Especialidades ' SHAD COLOR SCHE 8
ACTI WINDOW win
SET MESSAGE TO 'INGRESO ESPECIALIDADES - ENTER PARA TERMINAR'
DO WHILE .T.
   SCATTER MEMVAR BLANK
   @ 1,2 SAY "ESPECIALIDAD" COLOR SCHE 3
   @ 1,17 GET m->especiali PICTURE "XXXXXXXXXXXXXXXXXXXX";
      MESS me1+'- [ENTER] para Men£'
   READ
   IF ISALPHA(m->especiali)
      m->especiali=PROPER(m->especiali)
      SET DELE OFF
      SEEK ALLTRIM(m->especiali)
      SET DELE ON
      IF FOUND()
         SET MESS TO 'Especialidad '+TRIM(m->especiali)+' existe - Enter para continuar'
         DO existe WITH ' Especialidad'
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
DEAC WINDOW win
SET MESSA TO ''
RELE especiali,me1
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: IESP.PRG

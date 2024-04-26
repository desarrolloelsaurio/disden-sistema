*:*********************************************************************
*:
*:        Program: IVAR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: VAR.PRG                       
*:
*:          Calls: EXISTE         (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:50               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: IVAR
*-- Fecha   : 24/07/90
*-- Version : G. REINER
*-- Notas   : INGRESA DATOS VARIABLES
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 11,15 TO 16,55 DOUBLE TITL ' Ingreso Constantes Liquidaci¢n ' SHAD COLOR SCHE 8
me1=' Ingreso Constantes Liquidaci¢n '
ACTI WINDOW win
SET MESSAGE TO 'INGRESO CONSTANTES - ENTER PARA TERMINAR'
DO WHILE .T.
   CLEA
   SCATTER MEMVAR BLANK
   @ 1,2 SAY "DEN. CONSTANTE" COLOR SCHE 3
   @ 1,17 GET m->nombre PICTURE "XXXXXXXXXXXXXXXXXXXX";
      MESS me1+'- [ENTER] para Men£'
   READ
   IF ISALPHA(m->nombre)
      m->nombre=PROPER(m->nombre)
      SET DELE OFF
      SEEK ALLTRIM(m->nombre)
      SET DELE ON
      IF FOUND()
         SET MESS TO 'Constante '+ALLTRIM(m->nombre)+' existe - Enter para continuar'
         DO existe WITH ' CONSTANTE'
         DO WHILE INKEY()=0
         ENDDO
         CLEAR
      ELSE
         @ 2,2 SAY "CONTENIDO" COLOR SCHE 3
         @ 2,17 GET m->contenido PICTURE "XXXXXXXXXXXXXXXXXXXX";
            MESS me1+'- Contenido de la Variable'
         READ
         APPEND BLANK
         GATHER MEMVAR
      ENDIF
   ELSE
      EXIT
   ENDIF
ENDDO
DEAC WINDOW ALL
SET MESSA TO ''
RELE nombre,contenido,me1
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: IVAR.PRG

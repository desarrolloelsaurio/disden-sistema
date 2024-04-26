*:*********************************************************************
*:
*:        Program: CVAR.PRG
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
*********************************************
*-- Programa: CVAR
*-- Fecha   : 24/07/90
*-- Version : G. REINER
*-- Notas   : CORRIGE DATOS VARIABLES
*********************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ff=RECNO()
DEFINE WINDOW win FROM 12,15 TO 17,55 DOUBLE TITL ' Correcci¢n Datos Constantes ' SHAD COLOR SCHE 8
me1=' Correcci¢n Datos Constantes '
ACTI WINDOW win
sigo=.T.
SCATTER MEMVAR
@ 1,2 SAY "DEN. CONSTANTE" COLOR SCHE 3
@ 2,2 SAY "CONTENIDO" COLOR SCHE 3
@ 2,17 GET contenido PICTURE "XXXXXXXXXXXXXXXXXXXX" COLOR I
CLEAR GETS
@ 1,17 GET m->nombre PICTURE "XXXXXXXXXXXXXXXXXXXX";
   MESSAGE me1+'- [ESC] para Men£'
READ
IF LASTKEY()<>27
   m->nombre=PROPER(m->nombre)
   IF ISALPHA(m->nombre)
      IF nombre<>m->nombre
         SET DELE OFF
         SEEK ALLTRIM(m->nombre)
         SET DELE ON
         IF FOUND()
            SET MESS TO 'CONSTANTES DE LIQUIDACION '+ALLTRIM(m->nombre)+' EXISTE - ENTER PARA CONTINUAR'
            DO existe WITH ' CONSTANTE DE LIQUIDACION'
            DO WHILE INKEY()=0
            ENDDO
            CLEA
            sigo=.F.
         ENDIF
      ENDIF
   ELSE
      sigo=.F.
   ENDIF
   IF sigo
      @ 2,17 GET m->contenido PICTURE "XXXXXXXXXXXXXXXXXXXX";
         MESSAGE 'CORRECCION CONSTANTES DE LIQUIDACION - Corrige Contenido'
      READ
      GOTO ff
      GATHER MEMVAR
   ENDIF
ENDIF
DEAC WINDOW ALL
@ 24,0 SAY SPACE(80)
RELE ff,nombre,contenido,sigo
RETURN
*: EOF: CVAR.PRG

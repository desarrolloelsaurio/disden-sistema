*:*********************************************************************
*:
*:        Program: CEMPL3.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: CEMPL2.PRG                    
*:
*:          Calls: ELICAT()       (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:02               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: cempl3.prg
*-- Fecha   : 01/29/91 07:14pm
*-- Version : g. reiner
*-- Notas   : programa de correcci¢n global de un concepto
*--           corrige=3 -> Categor¡a
*--           corrige=4 -> Convenio
*--           corrige=5 -> Centro de Costos
*--           corrige=6 -> Empresa
*--           corrige=7 -> Especialidad
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE emp
SET ORDER TO ordlis
DEFINE WIND win FROM 13,29 TO 19,79 TITL " Correcci¢n Global " SHAD COLO SCHE 8
ACTI WIND win
SCAN FOR &fisc
   @ 1,1 SAY "Legajo " COLO SCHE 3
   @ 2,1 SAY "Empleado" COLO SCHE 3
   @ 1,15 GET legajo
   @ 2,15 GET apynom
   CLEAR GETS
   DO CASE
   CASE corrige=3
      @ 3,1 SAY 'Categor¡a' COLO SCHE 3
      GOTO emp->cat IN cat
      nada=cat->categoria
      @ 3,15 GET nada MESS '[ENTER] Pr¢ximo / [ESC] Final / [TECLA y ENTER] Corrige'
      READ
      IF LASTKEY()<>27
         IF nada<>cat->categoria
            STORE 0 TO respuesta
            IF elicat(" del Empleado")<>0
               GOTO respuesta IN cat
               SELE emp
               REPL cat WITH RECNO("CAT")
               ACTI WIND win
               @ 3,15 GET cat->categoria
               CLEAR GETS
            ENDIF
         ENDIF
      ELSE
         EXIT
      ENDIF
   CASE corrige=4
      @ 3,1 SAY 'Convenio' COLO SCHE 3
      GOTO emp->con IN con
      nada=con->convenio
      @ 3,15 GET nada MESS '[ENTER] Pr¢ximo / [ESC] Final / [TECLA y ENTER] Corrige'
      READ
      IF LASTKEY()<>27
         IF nada<>con->convenio
            STORE 0 TO respuesta
            IF elicon(" del Empleado")<>0
               GOTO respuesta IN con
               SELE emp
               REPL con WITH RECNO("CON")
               ACTI WIND win
               @ 3,15 GET con->convenio
               CLEAR GETS
            ENDIF
         ENDIF
      ELSE
         EXIT
      ENDIF
   CASE corrige=5
      @ 3,1 SAY 'Centro Costo' COLO SCHE 3
      GOTO emp->ccos IN ccos
      nada=ccos->cencos
      @ 3,15 GET nada MESS '[ENTER] Pr¢ximo / [ESC] Final / [TECLA y ENTER] Corrige'
      READ
      IF LASTKEY()<>27
         IF nada<>ccos->cencos
            STORE 0 TO respuesta
            IF eliccos(" del Empleado")<>0
               GOTO respuesta IN ccos
               SELE emp
               REPL ccos WITH RECNO("CCOS")
               ACTI WIND win
               @ 3,15 GET ccos->cencos
               CLEAR GETS
            ENDIF
         ENDIF
      ELSE
         EXIT
      ENDIF
   CASE corrige=7
      @ 3,1 SAY 'Especialidad' COLO SCHE 3
      GOTO emp->esp IN esp
      nada=esp->especiali
      @ 3,15 GET nada MESS '[ENTER] Pr¢ximo / [ESC] Final / [TECLA y ENTER] Corrige'
      READ
      IF LASTKEY()<>27
         IF nada<>esp->especiali
            STORE 0 TO respuesta
            IF eliesp(" del Empleado")<>0
               GOTO respuesta IN esp
               SELE emp
               REPL esp WITH RECNO("ESP")
               ACTI WIND win
               @ 3,15 GET esp->especiali
               CLEAR GETS
            ENDIF
         ENDIF
      ELSE
         EXIT
      ENDIF
      SELE emp
   ENDCASE
   ACTI WIND win
ENDSCAN
RELE WIND win
@ 24,0 SAY SPACE(80)
RETURN

*: EOF: CEMPL3.PRG

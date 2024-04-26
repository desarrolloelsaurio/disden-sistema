*:*********************************************************************
*:
*:        Program: BQSAL.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: QSAL.PRG
*:
*:          Calls: ELIJAN         (procedure in PROCESOS.PRG)
*:               : OPLIQ          (procedure in PROCESOS.PRG)
*:               : OPEMP          (procedure in PROCESOS.PRG)
*:               : ELISAL()       (function  in PROCESOS.PRG)
*:               : ELIEMP()       (function  in PROCESOS.PRG)
*:               : CQSAL2.PRG
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : CQSAL1.PRG
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:01               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: BQSAL.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : DERIVA AL PROGRAMA DE BORRADO DE SALARIO FAMILIAR
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE emp
SET ORDER TO ordlis
IF jannro=0
   DO elijan
   DO opliq
ENDIF
IF jannro<>0
   DO opemp
   fisc='.T.'
   DO CASE
   CASE BAR()=1
      STORE 0 TO respuesta
      IF elisal('a Borrar')<>0
         STORE respuesta TO xcos
         @ 24,0 SAY PADC('Borrando los Datos Requeridos',80,'*') colo sche 19
         SELE liq
         DELE ALL FOR filtcon=40 .AND. registro=xcos
         PACK
         @ 24,0 SAY SPACE(80)
      ENDIF
   CASE BAR()=2
      STORE 0 TO respuesta
      IF eliemp(' - Borra Salario Familiar')<>0
         GOTO respuesta
         xcos=RECNO()
			@ 24,0 say padc(" Ordenando el Archivo - Espere Por Favor ",80,'*') colo sche 19
			sele liq
			index on registro to tmp for liq->empleado=xcos .and. filtcon=40
			goto top
			if .not. eof()
	         DO cqsal2
			endif
      ENDIF
   CASE BAR()=3
      STORE 0 TO respuesta
      IF elicat(' - Borra Salario Familiar')<>0
         xcos=respuesta
			sele emp
			set order to
			sele liq
			@ 24,0 say padc(" Ordenando el Archivo - Espere Por Favor ",80,'*') colo sche 19
			set rela to empleado into emp
			index on legajo to tmp for emp->cat=xcos .and. filtcon=40
			goto top
			if .not. eof()
	         DO cqsal1
			endif
			sele emp
			set order to 1
      ENDIF
   CASE BAR()=4
      STORE 0 TO respuesta
      IF elicon(' - Borra Salario Familiar')<>0
         xcos=respuesta
			sele emp
			set order to
			sele liq
			@ 24,0 say padc(" Ordenando el Archivo - Espere Por Favor ",80,'*') colo sche 19
			set rela to empleado into emp
			index on legajo to tmp for emp->con=xcos .and. filtcon=40
			goto top
			if .not. eof()
	         DO cqsal1
			endif
			sele emp
			set order to 1
      ENDIF
   CASE BAR()=5
      STORE 0 TO respuesta
      IF eliccos(' - Borra Salario Familiar')<>0
         xcos=respuesta
			sele emp
			set order to
			sele liq
			@ 24,0 say padc(" Ordenando el Archivo - Espere Por Favor ",80,'*') colo sche 19
			set rela to empleado into emp
			index on legajo to tmp for emp->ccos=xcos .and. filtcon=40
			goto top
			if .not. eof()
	         DO cqsal1
			endif
			sele emp
			set order to 1
      ENDIF
   CASE BAR()=6
      STORE 0 TO respuesta
      IF eliesp(' - Borra Salario Familiar')<>0
         xcos=respuesta
			sele emp
			set order to
			sele liq
			@ 24,0 say padc(" Ordenando el Archivo - Espere Por Favor ",80,'*') colo sche 19
			set rela to empleado into emp
			index on legajo to tmp for emp->esp=xcos .and. filtcon=40
			goto top
			if .not. eof()
	         DO cqsal1
			endif
			sele emp
			set order to 1
      ENDIF
   ENDCASE
ENDIF
RETURN
*: EOF: BQSAL.PRG

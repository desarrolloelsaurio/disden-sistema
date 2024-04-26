********************************************************************************
*-- Programa: BQADE.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : DERIVA AL PROGRAMA DE BORRADO DE ADELANTOS
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
      IF eligas(" a Borrar")<>0
         @ 24,0 SAY PADC(" Borrando los datos requeridos ",80,"*") COLO SCHE 19
         xcos=respuesta
         SELE liq
         DELE ALL FOR filtcon>70 .AND. registro=xcos
         PACK
         @ 24,0 SAY SPACE(80)
      ENDIF
   CASE BAR()=2
      STORE 0 TO respuesta
      IF eliemp(' - Borra Adelantos de Sueldo')<>0
         GOTO respuesta
         xcos=RECNO()
			@ 24,0 say padc(" Ordenando el Archivo - Espere Por Favor ",80,'*') colo sche 19
			sele liq
			index on registro to tmp for liq->empleado=xcos .and. filtcon>70
			goto top
			if .not. eof()
   		   DO cqade1
			endif
      ENDIF
   CASE BAR()=3
      STORE 0 TO respuesta
      IF elicat(' - Borra Adelantos de Sueldo')<>0
         xcos=respuesta
			sele emp
			set order to
			sele liq
			@ 24,0 say padc(" Ordenando el Archivo - Espere Por Favor ",80,'*') colo sche 19
			set rela to empleado into emp
			index on legajo to tmp for emp->cat=xcos .and. filtcon>70
			goto top
			if .not. eof()
   	      DO cqade1
			endif
			sele emp
			set order to 1
      ENDIF
   CASE BAR()=4
      STORE 0 TO respuesta
      IF elicon(' - Borra Adelantos de Sueldo')<>0
         xcos=respuesta
			sele emp
			set order to
			sele liq
			@ 24,0 say padc(" Ordenando el Archivo - Espere Por Favor ",80,'*') colo sche 19
			set rela to empleado into emp
			index on legajo to tmp for emp->con=xcos .and. filtcon>70
			goto top
			if .not. eof()
   	      DO cqade1
			endif
			sele emp
			set order to 1
      ENDIF
   CASE BAR()=5
      STORE 0 TO respuesta
      IF eliccos(' - Borra Adelantos de Sueldo')<>0
         xcos=respuesta
			sele emp
			set order to
			sele liq
			@ 24,0 say padc(" Ordenando el Archivo - Espere Por Favor ",80,'*') colo sche 19
			set rela to empleado into emp
			index on legajo to tmp for emp->ccos=xcos .and. filtcon>70
			goto top
			if .not. eof()
   	      DO cqade1
			endif
			sele emp
			set order to 1
      ENDIF
   CASE BAR()=6
      STORE 0 TO respuesta
      IF eliesp(' - Borra Adelantos de Sueldo')<>0
         xcos=respuesta
			sele emp
			set order to
			sele liq
			@ 24,0 say padc(" Ordenando el Archivo - Espere Por Favor ",80,'*') colo sche 19
			set rela to empleado into emp
			index on legajo to tmp for emp->esp=xcos .and. filtcon>70
			goto top
			if .not. eof()
   	      DO cqade1
			endif
			sele emp
			set order to 1
      ENDIF
   ENDCASE
ENDIF
RETURN

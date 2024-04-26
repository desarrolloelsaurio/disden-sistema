********************************************************************************
*-- Programa: CSAC2.PRG
*-- Fecha   : 01/25/91 06:27pm
*-- Version : G. REINER
*-- Notas   : CALCULA AGUINALDO POR MEJOR SUELDO
********************************************************************************
PARAMETER cs1,cs2
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   SELE emp
   @ 24,0 SAY PADC(" Borrando Registros Existentes ",80,'*') COLOR SCHE 19
   REPL ALL mejorsuel WITH 0,periodos WITH 0
   @ 24,0 SAY PADC(" Calculando Mejor Sueldos ",80,'*') COLOR SCHE 19
   SCAN
      SELE sue
      CALC MAX(haberagu+adicagu) FOR mes>cs1 .AND. mes<cs2 .AND. empleado=recno("EMP") TO empmejor
      COUNT FOR mes>cs1 .AND. mes<cs2 .AND. empleado=recno("EMP") TO empper
      SELE emp
      REPL emp.mejorsuel WITH empmejor
      REPL emp.periodos WITH empper
   ENDSCAN
   SELE emp
   SCAN
      IF emp.haberRET+emp.adicRET<>0
         IF (emp.haberRET+emp.adicRET)>emp.mejorsuel
            REPL emp.mejorsuel WITH emp.haberRET+emp.adicRET
            REPL EMP.PERIODOS WITH EMP.PERIODOS+1
         ENDIF
      ENDIF
   ENDSCAN
CASE BAR()=2
   STORE 0 TO respuesta
   IF !EMPTY(eliemp("a Calcular"))
      GOTO respuesta
      LGJ=RECNO("EMP")
      @ 24,0 SAY PADC(" Calculando Mejor Sueldos ",80,'*') COLOR SCHE 19
      REPL mejorsuel WITH 0,periodos WITH 0
      SELE sue
      CALC MAX(haberagu+adicagu) FOR mes>cs1 .AND. mes<cs2 .AND. empleado=LGJ TO empmejor
      COUNT FOR mes>cs1 .AND. mes<cs2 .AND. empleado=recno("EMP") TO empper
      SELE emp
      REPL emp.mejorsuel WITH empmejor
      REPL emp.periodos WITH empper
      IF emp.haberRET+emp.adicRET<>0
         REPL emp.periodos WITH emp.periodos+1
         IF (emp.haberRET+emp.adicRET)>emp.mejorsuel
            REPL emp.mejorsuel WITH emp.haberRET+emp.adicRET
            REPL EMP.PERIODOS WITH EMP.PERIODOS+1
         ENDIF
      ENDIF
   ENDIF
ENDCASE
@ 24,0 SAY SPACE(80)
RETURN

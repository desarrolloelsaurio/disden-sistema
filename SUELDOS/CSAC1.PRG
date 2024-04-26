********************************************************************************
*-- Programa: CSAC1.PRG
*-- Fecha   : 01/25/91 06:27pm
*-- Version : G. REINER
*-- Notas   : CALCULA AGUINALDO POR PROMEDIO (QUE VIEJO !)
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
   @ 24,0 SAY PADC(" Calculando Promedio de Sueldos para Aguinaldo ",80,'*') COLOR SCHE 19
   SCAN
      SELE sue
      SUM haberagu+adicagu TO empmejor FOR mes>cs1 .AND. mes<cs2 .AND. empleado=recno("EMP")
      COUNT FOR mes>cs1 .AND. mes<cs2 .AND. empleado=recno("EMP") TO empper
      SELE emp
      REPL emp->mejorsuel WITH empmejor,emp->periodos WITH empper
   ENDSCAN
   SELE emp
   SCAN
      IF emp->haberRET+emp->adicRET<>0
         REPL emp->mejorsuel WITH emp->mejorsuel+emp->haberRET+emp->adicRET
         REPL emp->periodos WITH emp->periodos+1
      ENDIF
   ENDSCAN
CASE BAR()=2
   STORE 0 TO respuesta
   IF eliemp("a Calcular")<>0
      GOTO respuesta
      REPL mejorsuel WITH 0,periodos WITH 0
      lgj=recno("EMP")
      @ 24,0 SAY PADC(" Calculando Promedio de Sueldos para Aguinaldo ",80,'*') COLOR SCHE 19
      SELE sue
      SUM haberagu+adicagu TO empmejor FOR mes>cs1 .AND. mes<cs2 .AND. empleado=lgj
      COUNT FOR mes>cs1 .AND. mes<cs2 .AND. empleado=recno("EMP") TO empper
      SELE emp
      REPL emp->mejorsuel WITH empmejor,emp->periodos WITH empper
      IF emp->haberRET+emp->adicRET<>0
         REPL emp->mejorsuel WITH emp->mejorsuel+emp->haberRET+emp->adicRET
         REPL emp->periodos WITH emp->periodos+1
      ENDIF
   ENDIF
ENDCASE
@ 24,0 SAY SPACE(80)
RETURN

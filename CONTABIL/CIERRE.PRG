*
*                         CIERRE DEL EJERCICIO
*
* CIERRE.PRG
* GOYO / 10-06-93 01:47am
store "CIERRE DEL EJERCICIO" to TITULO
=CARTEL("Esta operacion borrara TODOS los archivos de movimientos colocando",;
  "los saldos actuales como saldos del ejercicio anterior dejando los",;
  " archivos listos para comenzar un NUEVO ejercicio.",;
  "PULSE UNA TECLA PARA CONTINUAR")
IF CONFIRM1("CERRAR EL EJERCICIO")
   IF PREGUNT1("ESTA SEGURO DE QUERER CERRAR EL EJERCICIO")
      IF CLAVE()
         SELE BAL
         REPL ALL DEBE0 WITH DEBE0+DEBE1+DEBE2+DEBE3+DEBE4+DEBE5+DEBE6+DEBE7+DEBE8+DEBE9+DEBE10+DEBE11+DEBE12
         REPL ALL HABER0 WITH HABER0+HABER1+HABER2+HABER3+HABER4+HABER5+HABER6+HABER7+HABER8+HABER9+HABER10+HABER11+HABER12 
         REPL ALL DEBE1 with 0,;
         DEBE2 with 0,;
         DEBE3 with 0,;
         DEBE4 with 0,;
         DEBE5 with 0,;
         DEBE6 with 0,;
         DEBE7 with 0,;
         DEBE8 with 0,;
         DEBE9 with 0,;
         DEBE10 with 0,;
         DEBE11 with 0,;
         DEBE12 with 0
         REPL ALL HABER1 with 0,;
         HABER2 with 0,;
         HABER3 with 0,;
         HABER4 with 0,;
         HABER5 with 0,;
         HABER6 with 0,;
         HABER7 with 0,;
         HABER8 with 0,;
         HABER9 with 0,;
         HABER10 with 0,;
         HABER11 with 0,;
         HABER12 with 0
         SELE MOV
         zap
         go top
         go bottom
         go top
         store recno() to PRINCIPIO
         STORE 1 TO KASIENTO,KMOVIMIENTO
         =TECLA(21,20,"Operacion terminada, pulse <RETURN> ")
      ENDIF
   ENDIF
ENDIF
=MEN_LIN(SYSNOMBRE)
RETURN

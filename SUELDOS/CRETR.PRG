********************************************************************************
*-- Programa: cretr.PRG
*-- Fecha   : 04/24/91 03:48pm
*-- Version : G. REINER
*-- Notas   : calcula retroactivos
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
dijo=BAR()
DO CASE
CASE BAR()=1
   @ 24,0 SAY PADC(" Calculando Retroactividades ",80,"*") COLO SCHE 19
   SELE emp
   REPL ALL haberret WITH 0,adicret WITH 0
   SELE sue
   SCAN FOR mes=sobremes .AND. quincena=sobrequi
      rcd=RECNO()
      GOTO sue.empleado IN emp
      IF sobrehab='SI'
         REPL emp.haberret WITH sue.haberagu*sobrepor/100
      ENDIF
      IF sobreadi='SI'
         REPL emp.adicret WITH sue.adicagu*sobrepor/100
      ENDIF
      GOTO rcd
   ENDSCAN
CASE BAR()=2
   DO opccos
   STORE 0 TO respuesta
   IF eliccos('a Listar')<>0
      GOTO respuesta
      xcos=RECNO()
      @ 24,0 SAY PADC(" Calculando Retroactividades ",80,"*") COLO SCHE 19
      SELE emp
      REPL ALL haberret WITH 0,adicret WITH 0 FOR emp.ccos=xcos
      SELE sue
      SCAN FOR mes=sobremes .AND. quincena=sobrequi
         rcd=RECNO()
         GOTO sue.empleado IN emp
         IF emp.ccos=xcos
            IF sobrehab='SI'
               REPL emp.haberret WITH sue.haberagu*sobrepor/100
            ENDIF
            IF sobreadi='SI'
               REPL emp.adicret WITH sue.adicagu*sobrepor/100
            ENDIF
         ENDIF
         GOTO rcd
      ENDSCAN
   ENDIF
CASE BAR()=3
   DO opcat
   STORE 0 TO respuesta
   IF elicat('a Listar')<>0
      GOTO respuesta
      xcos=RECNO()
      SELE emp
      @ 24,0 SAY PADC(" Calculando Retroactividades ",80,"*") COLO SCHE 19
      SELE emp
      REPL ALL haberret WITH 0,adicret WITH 0 FOR emp.cat=xcos
      SELE sue
      SCAN FOR mes=sobremes .AND. quincena=sobrequi
         rcd=RECNO()
         GOTO sue.empleado IN emp
         IF emp.cat=xcos
            IF sobrehab='SI'
               REPL emp.haberret WITH sue.haberagu*sobrepor/100
            ENDIF
            IF sobreadi='SI'
               REPL emp.adicret WITH sue.adicagu*sobrepor/100
            ENDIF
         ENDIF
         GOTO rcd
      ENDSCAN
   ENDIF
CASE BAR()=4
   DO opcon
   STORE 0 TO respuesta
   IF elicon('a Listar')<>0
      GOTO respuesta
      xcos=RECNO()
      @ 24,0 SAY PADC(" Calculando Retroactividades ",80,"*") COLO SCHE 19
      SELE emp
      REPL ALL haberret WITH 0,adicret WITH 0 FOR emp.con=xcos
      SELE sue
      SCAN FOR mes=sobremes .AND. quincena=sobrequi
         rcd=RECNO()
         GOTO sue.empleado IN emp
         IF emp.con=xcos
            IF sobrehab='SI'
               REPL emp.haberret WITH sue.haberagu*sobrepor/100
            ENDIF
            IF sobreadi='SI'
               REPL emp.adicret WITH sue.adicagu*sobrepor/100
            ENDIF
         ENDIF
			sele sue
         GOTO rcd
      ENDSCAN
   ENDIF
CASE BAR()=5
   DO opesp
   STORE 0 TO respuesta
   IF eliesp('a Listar')<>0
      GOTO respuesta
      xcos=RECNO()
      @ 24,0 SAY PADC(" Calculando Retroactividades ",80,"*") COLO SCHE 19
      SELE emp
      REPL ALL haberret WITH 0,adicret WITH 0 FOR emp.esp=xcos
      SELE sue
      SCAN FOR mes=sobremes .AND. quincena=sobrequi
         rcd=RECNO()
         GOTO sue.empleado IN emp
         IF emp.esp=xcos
            IF sobrehab='SI'
               REPL emp.haberret WITH sue.haberagu*sobrepor/100
            ENDIF
            IF sobreadi='SI'
               REPL emp.adicret WITH sue.adicagu*sobrepor/100
            ENDIF
         ENDIF
         GOTO rcd
      ENDSCAN
   ENDIF
ENDCASE
RETURN

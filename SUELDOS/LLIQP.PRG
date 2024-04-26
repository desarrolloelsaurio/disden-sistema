********************************************************************************
*-- Programa: lliqp.prg
*-- Fecha   : 12/31/90 03:38pm
*-- Version : G. REINER
*-- Notas   : deriva al listado de recibos de sueldo por pantalla
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   SELE emp
   goto top
   SET ORDER TO ordlis
   DEFINE WIND win FROM 0,0 TO 23,79
   legacy='zzz'
   SCAN
      ACTI SCRE
      @ 24,0 SAY PADC("Buscando "+ALLTRIM(apynom),80,'*') COLOR SCHE 19
      persona=RECNO("emp")
      SELE liq
      IF ordlis=2
         DO WHILE empleado<>persona .AND. .NOT. EOF()
            SKIP
         ENDDO
      ELSE
         IF emp->legajo<legacy
            GOTO TOP
         ENDIF
         legacy=emp->legajo
         DO WHILE empleado<>persona .AND. .NOT. EOF()
            SKIP
         ENDDO
      ENDIF
      IF .NOT. EOF()
         DO WHILE empleado=persona .AND. .NOT. imprime .AND. .NOT. EOF()
            SKIP
         ENDDO
         IF .NOT. EOF() .AND. empleado=persona
            @ 24,0 SAY PADC("[ESC] para Terminar",80,' ')
            DO lliqp1
            DO WHILE INKEY()=0
            ENDDO
            IF LASTKEY()=27
               EXIT
            ENDIF
            CLEA
         ENDIF
      ENDIF
      SELE emp
      GOTO persona
   ENDSCAN
   RELE WIND win
   SELE liq
CASE BAR()=2
   respuesta=0
   IF eliemp("a Listar")<>0
      GOTO respuesta
      persona=RECNO("EMP")
      @ 24,0 SAY PADC("Buscando "+ALLTRIM(apynom),80,'*') COLOR SCHE 19
      SELE liq
      GOTO TOP
      DO WHILE empleado<>persona .AND. .NOT. EOF()
         SKIP
      ENDDO
      IF .NOT. EOF()
         DEFINE WIND win FROM 0,0 TO 23,79
         DO lliqp1
         DO WHILE INKEY()=0
         ENDDO
         CLEA
         RELE WIND win
         SET INDEX TO
      ENDIF
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicat("a Imprimir")<>0
      GOTO respuesta
      SELE liq
      GOTO TOP
      SELE emp
      goto top
      DEFINE WIND win FROM 0,0 TO 23,79
      legacy='zzzz'
      SCAN FOR cat=RECNO("CAT")
         ACTI SCRE
         @ 24,0 SAY PADC("Buscando "+ALLTRIM(apynom),80,'*') COLOR SCHE 19
         persona=RECNO("emp")
         SELE liq
         IF ordlis=2
            DO WHILE empleado<>persona .AND. .NOT. EOF()
               SKIP
            ENDDO
         ELSE
            IF emp->legajo<legacy
               GOTO TOP
            ENDIF
            legacy=emp->legajo
            DO WHILE empleado<>persona .AND. .NOT. EOF()
               SKIP
            ENDDO
         ENDIF
         IF .NOT. EOF()
            @ 24,0 SAY PADC("[ESC] para Terminar",80,' ')
            DO lliqp1
            DO WHILE INKEY()=0
            ENDDO
            IF LASTKEY()=27
               EXIT
            ENDIF
            CLEA
         ENDIF
         SELE emp
         GOTO persona
      ENDSCAN
      RELE WIND win
      SELE liq
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF elicon("a Imprimir")<>0
      GOTO respuesta
      SELE liq
      GOTO TOP
      SELE emp
      goto top
      SET ORDER TO ordlis
      DEFINE WIND win FROM 0,0 TO 23,79
      legacy='zzz'
      SCAN FOR con=RECNO("CON")
         persona=RECNO("EMP")
         ACTI SCRE
         @ 24,0 SAY PADC("Buscando "+ALLTRIM(apynom),80,'*') COLOR SCHE 19
         SELE liq
         IF ordlis=2
            DO WHILE empleado<>persona .AND. .NOT. EOF()
               SKIP
            ENDDO
         ELSE
            IF emp->legajo<legacy
               GOTO TOP
            ENDIF
            legacy=emp->legajo
            DO WHILE empleado<>persona .AND. .NOT. EOF()
               SKIP
            ENDDO
         ENDIF
         IF .NOT. EOF()
            @ 24,0 SAY PADC("[ESC] para Terminar",80,' ')
            DO lliqp1
            DO WHILE INKEY()=0
            ENDDO
            IF LASTKEY()=27
               EXIT
            ENDIF
            CLEA
         ENDIF
         SELE emp
         GOTO persona
      ENDSCAN
      RELE WIND win
      SELE liq
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliccos("a Imprimir")<>0
      GOTO respuesta
      SELE liq
      GOTO TOP
      SELE emp
      goto top
      SET ORDER TO ordlis
      DEFINE WIND win FROM 0,0 TO 23,79
      legacy='zzz'
      SCAN FOR ccos=RECNO("CCOS")
         persona=RECNO("EMP")
         ACTI SCRE
         @ 24,0 SAY PADC("Buscando "+ALLTRIM(apynom),80,'*') COLOR SCHE 19
         SELE liq
         IF ordlis=2
            DO WHILE empleado<>persona .AND. .NOT. EOF()
               SKIP
            ENDDO
         ELSE
            IF emp->legajo<legacy
               GOTO TOP
            ENDIF
            legacy=emp->legajo
            DO WHILE empleado<>persona .AND. .NOT. EOF()
               SKIP
            ENDDO
         ENDIF
         IF .NOT. EOF()
            @ 24,0 SAY PADC("[ESC] para Terminar",80,' ')
            DO lliqp1
            DO WHILE INKEY()=0
            ENDDO
            IF LASTKEY()=27
               EXIT
            ENDIF
            CLEA
         ENDIF
         SELE emp
         GOTO persona
      ENDSCAN
      RELE WIND win
      SELE liq
   ENDIF
CASE BAR()=6
   STORE 0 TO respuesta
   IF eliesp("a Imprimir")<>0
      GOTO respuesta
      SELE liq
      GOTO TOP
      SELE emp
      goto top
      SET ORDER TO ordlis
      DEFINE WIND win FROM 0,0 TO 23,79
      legacy='zzz'
      SCAN FOR esp=RECNO("ESP")
         persona=RECNO("EMP")
         ACTI SCRE
         @ 24,0 SAY PADC("Buscando "+ALLTRIM(apynom),80,'*') COLOR SCHE 19
         SELE liq
         IF ordlis=2
            DO WHILE empleado<>persona .AND. .NOT. EOF()
               SKIP
            ENDDO
         ELSE
            IF emp->legajo<legacy
               GOTO TOP
            ENDIF
            legacy=emp->legajo
            DO WHILE empleado<>persona .AND. .NOT. EOF()
               SKIP
            ENDDO
         ENDIF
         IF .NOT. EOF()
            @ 24,0 SAY PADC("[ESC] para Terminar",80,' ')
            DO lliqp1
            DO WHILE INKEY()=0
            ENDDO
            IF LASTKEY()=27
               EXIT
            ENDIF
            CLEA
         ENDIF
         SELE emp
         GOTO persona
      ENDSCAN
      RELE WIND win
      SELE liq
   ENDIF
ENDCASE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
RELE persona
RETURN

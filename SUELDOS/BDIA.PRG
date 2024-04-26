********************************************************************************
*-- Programa: BDIA.PRG
*-- Fecha   : 02/27/91 10:02pm
*-- Version : G. REINER
*-- Notas   : BORRA TODAS LAS HORAS TRABAJADAS DE UN DIA
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   STORE 0 TO respuesta
   DEFINE WINDOW fic FROM 10,0 TO 14,77 DOUBLE TITL ' Fecha a Borrar ' SHADOW COLOR SCHE 8
   ACTI WINDOW fic
   @ 1,1 SAY "FECHA A BORRAR " GET respuesta MESS 'Fecha para Borrar Horas Trabajadas - [ESC] para anular'
   READ
   IF respuesta<>0 .AND. LASTKEY()<>27
      aborrar=respuesta
      STORE 'NO' TO respuesta
      @ 1,1 SAY SPACE(70)
      @ 1,10 SAY "Confirma Borrar Hs. Trabajadas " GET respuesta PICTURE "@M NO,SI"
      READ
      IF respuesta="SI"
         ACTI SCRE
         @ 24,0 SAY PADC(" Borrando datos requeridos ",80,"*") COLO SCHE 19
         SELE dia
         DELE ALL FOR fecha=aborrar
         PACK
         RELE aborrar
         @ 24,0 SAY SPACE(80)
      ENDIF
   ENDIF
   RELE WIND fic
CASE BAR()=2
   STORE 0 TO respuesta
   IF eliemp(' - Borra Horas Trabajadas')<>0
      GOTO respuesta
      xcos=legajo
      fisc='legajo=XCOS'
      DO bdia1
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicat(' - Borra Horas Trabajadas')<>0
      xcos=respuesta
      fisc='CAT=XCOS'
      DO bdia1
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF elicon(' - Borra Horas Trabajadas')<>0
      xcos=respuesta
      fisc='CON=XCOS'
      DO bdia1
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliccos(' - Borra Horas Trabajadas')<>0
      xcos=respuesta
      fisc='CCOS=XCOS'
      DO bdia1
   ENDIF
CASE BAR()=6
   STORE 0 TO respuesta
   IF eliesp(' - Borra Horas Trabajadas')<>0
      xcos=respuesta
      fisc='esp=XCOS'
      DO bdia1
   ENDIF
ENDCASE
RETURN

********************************************************************************
*-- Programa: BDIA1.PRG
*-- Fecha   : 02/27/91 10:07pm
*-- Version : G. REINER
*-- Notas   : BORRA HORAS TRABAJADAS DE UN DIA
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
STORE 0 TO respuesta
DEFINE WINDOW fic FROM 10,0 TO 14,77 DOUBLE TITL ' Fecha a Borrar ' SHADOW COLOR SCHE 8
ACTI WINDOW fic
@ 1,1 SAY "FECHA A BORRAR " GET respuesta MESS 'Fecha para Borrar Horas Trabajadas - [ESC] para anular'
READ
IF respuesta>1 .AND. respuesta<31 .AND. LASTKEY()<>27
   aborrar=respuesta
   STORE 'NO' TO respuesta
   @ 1,1 SAY SPACE(70)
   @ 1,10 SAY "Confirma Borrar Hs. Trabajadas " GET respuesta PICTURE "@M NO,SI"
   READ
   IF respuesta="SI"
      ACTI SCRE
      @ 24,0 SAY PADC(" Borrando datos requeridos ",80,"*") COLO SCHE 19
      SELE emp
      fisc=fisc+" .and. emp->jan=m->jannro"
      SCAN FOR &fisc
         nada=RECNO("EMP")
         SELE dia
         DELE ALL FOR empleado=nada .AND. fecha=aborrar
      ENDSCAN
      PACK
   ENDIF
ENDIF
RELE WIND fic
RELE aborrar,nada
RETURN
*: EOF: BDIA1.PRG

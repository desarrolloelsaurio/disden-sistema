********************************************************************************
*-- Programa: cempl.prg
*-- Fecha   : 01/29/91 06:32pm
*-- Version : g. reiner
*-- Notas   : deriva a distintas correcciones de empleados
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   STORE 0 TO respuesta
   IF eliemp('a Corregir')<>0
      GOTO respuesta
      DO cempl1
   ENDIF
CASE BAR()=2
   @ 24,0 SAY PADC("Correcci¢n de Puntaje",80,' ') COLO I
   DEFINE WIND win FROM 3,10 TO 22,62 TITL ' Correcci¢n Puntaje ' SHAD COLO SCHE 8
   BROWSE FIELDS legajo/R,apynom/R/H="Empleado",puntaje FREEZE puntaje WIND win
   RELE WIND win
   @ 24,0 SAY SPACE(80)
OTHERWISE
   DO kk2 WITH 15,35,'L¡mites de la Correcci¢n'
   corrige=BAR()
   ON SELE POPU caca1 DO cempl2
   ACTI POPU caca1
   RELE POPU caca1
ENDCASE
RELE corrige
RETURN

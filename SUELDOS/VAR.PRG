********************************************************************************
*-- Programa: VAR.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : ABRE LOS ARCHIVOS DE TRABAJO PARA VARIABLES
*	      GENERA POPUP DE ELECCION PARA TRABAJOS CON RESP1 COMO RESPUESTA
*	      DERIVA A LOS PROGRAMAS CORRESPONDIENTES
********************************************************************************
varok=22
ulpr=PROGRAM()
@ 0,0 SAY REPLICATE("Û",80) COLOR W
@ 0,1 SAY 'Sueldos y Jornales' COLOR I
@ 0,20 SAY '|'
@ 0,22 SAY DATE() COLOR I
@ 0,32 SAY '|'
@ 0,34 SAY TIME() COLOR I
@ 0,44 SAY '|'
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 0,58 SAY '|'
@ 0,60 SAY PADL(janname,19,' ') COLOR I
DO CASE
CASE BAR()=1
   DO ivar
CASE BAR()=7 .OR. BAR()=8
   MAX=3
   DECL co[MAX]
   tt='Listado de Constantes para Definici¢n de Conceptos'
   co[1]=' N§ '
   co[2]='       NOMBRE       '
   co[3]='           CONTENIDO           '
   IF BAR()=7
      DO lvari
   ELSE
      DO lvarp
   ENDIF
   RELE co,ct,gt,gto,ctt
CASE BAR()=10
   ulpr='XVAR'
   DO kk WITH 17,20
   ON SELE POPU caca DO xvar
   ACTI POPU caca
OTHERWISE
   STORE varpop TO anterior
   dijo=BAR()
   IF dijo=5
      SET DELE OFF
      STORE .T. TO varpop
      DO opvar
      SET FILTER TO DELETED()
   ENDIF
   STORE 0 TO respuesta
   IF elivar(pq[DIJO])<>0
      IF respuesta>varok
         GOTO respuesta
         IF dijo=2
            DO cvar
         ELSE
            IF dijo=4
               DO bvar
            ELSE
               DO llvar
               SET FILTER TO
            ENDIF
         ENDIF
      ENDIF
   ENDIF
   SET DELE ON
   STORE anterior TO varpop
ENDCASE
RELE dijo
ulpr=PROGRAM()
RETURN

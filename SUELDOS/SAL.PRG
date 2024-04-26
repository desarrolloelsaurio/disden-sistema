******************************************************************************
*-- Programa: sal.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : ABRE LOS ARCHIVOS DE TRABAJO PARA salario familiar
*	      GENERA POPUP DE ELECCION PARA TRABAJOS CON RESP1 COMO RESPUESTA
*	      DERIVA A LOS PROGRAMAS CORRESPONDIENTES
********************************************************************************
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
CASE BAR()=10
   SELE sal
   DEFINE WINDOW win FROM 5,26 TO 22,63 DOUBLE TITL " Correcci¢n Convenios " SHAD COLOR SCHE 8
   BROWSE FIELD sal->salario:H=PADC("RUBRO",20),sal->salmonto:p="99999999999.99":H=PADC("MONTO",14) FREEZE salmonto NOAPPEND NODELETE NOMENU WINDOW win
CASE BAR()=1
   DO ISAL
CASE BAR()=7 .OR. BAR()=8
   MAX=7
   tt='Listado de Salario Familiar'
   MAX=8
   DECL co[MAX]
   co[1]=' N§ '
   co[2]='      Salario       '
   co[3]='   Monto      '
   co[4]=' Per¡odo '
   co[5]=' Vencim '
   co[6]='Reset'
   co[7]='Mes'
   co[8]='Quinc'
   IF BAR()=7
      DO lsali
   ELSE
      DO lsalp
   ENDIF
   RELE tt,MAX,ct
CASE BAR()=12
   ulpr='XSAL'
   DO kk WITH 13,20
   ON SELE POPU caca DO xsal
   ACTI POPU caca
OTHERWISE
   dijo=BAR()
   STORE salpop TO anterior
   IF dijo=5
      SET DELE OFF
      STORE .T. TO salpop
      DO opsal
      SET FILTER TO DELETED()
   ENDIF
   STORE 0 TO respuesta
   IF elisal(pq[DIJO])<>0
      GOTO respuesta
      IF dijo=2
         DO csal
      ELSE
         IF dijo=4
            DO bsal
         ELSE
            DO llsal
            SET FILTER TO
         ENDIF
      ENDIF
   ENDIF
   SET DELE ON
   STORE anterior TO salpop
ENDCASE
RELE dijo
ulpr=PROGRAM()
RETURN
*: EOF: SAL.PRG

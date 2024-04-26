********************************************************************************
*-- Programa: CCOS.prg
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : ABRE LOS ARCHIVOS DE TRABAJO PARA CENTROS DE COSTOS
*	      GENERA POPUP DE ELECCION PARA TRABAJOS CON RESP1 COMO RESPUESTA
*	      DERIVA A LOS PROGRAMAS CORRESPONDIENTES
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   ulpr='ICCOS'
   DO iccos
CASE BAR()=8 .OR. BAR()=7
   MAX=3+IIF(jannro=0,1,0)
   DECL co[MAX]
   tt='Listado de Centros de Costo'
   co[1]=' N§ '
   co[2]='  Centro de Costo   '
   co[3]='Identific.'
   IF jannro=0
      co[4]=PADC("Empresa",20)
   ENDIF
   IF BAR()=7
      ulpr='LCCOSI'
      DO lccosi
   ELSE
      ulpr='LCCOSP'
      DO lccosp
   ENDIF
   RELE co,ct,gt,gto,ctt
CASE BAR()=10
   ulpr='XCCOS'
   DO kk WITH 13,20
   ON SELE POPU caca DO xccos
   ACTI POPU caca
OTHERWISE
   dijo=BAR()
   STORE cospop TO anterior
   STORE 0 TO respuesta
   IF dijo=2
      ulpr='CCCOS'
   ELSE
      IF dijo=4
         ulpr='BCCOS'
      ELSE
         ulpr='LLCCOS'
         SET DELE OFF
         STORE .T. TO cospop
         DO opccos
         SET FILTER TO DELETED()
      ENDIF
   ENDIF
   IF eliccos(pq[DIJO])<>0
      GOTO respuesta
      IF dijo=2
         DO cccos
      ELSE
         IF dijo=4
            DO bccos
         ELSE
            DO llccos
            DO opccos
         ENDIF
      ENDIF
   ENDIF
   SET DELE ON
   STORE anterior TO cospop
ENDCASE
RELE dijo
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ulpr='CCOS'
RETURN

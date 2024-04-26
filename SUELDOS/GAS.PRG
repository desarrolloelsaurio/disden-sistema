*:*********************************************************************
*:
*:        Program: GAS.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: VARIOS.PRG
*:
*:          Calls: IGAS.PRG
*:               : LGENI.PRG
*:               : LGENIE.PRG
*:               : LGENP.PRG
*:               : LGENPE.PRG
*:               : KK             (procedure in PROCESOS.PRG)
*:               : XGAS           (procedure in PROCESOS.PRG)
*:               : OPGAS          (procedure in PROCESOS.PRG)
*:               : ELIGAS()       (function  in PROCESOS.PRG)
*:               : CGAS.PRG
*:               : BGAS.PRG
*:               : LLGAS.PRG
*:
*:      Documented 04/23/91 at 20:45               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: GAS.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : ABRE LOS ARCHIVOS DE TRABAJO PARA TIPOS DE GASTO
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
CASE BAR()=1
   DO igas
CASE BAR()=7 .OR. BAR()=8
   MAX=2+IIF(jannro=0,1,0)
   tt='Listado de Tipos de Adelanto'
   DECL co[MAX],ct[MAX],gt[MAX],gto[MAX],ctt[MAX]
   co[1]=' N§ '
   co[2]='       GASTO        '
   ct[1]='STR(RECNO(),4)'
   ct[2]='GASTO'
   IF jannro=0
      co[3]='      Empresa       '
      ct[3]='****'
      gt[3]='gas->empresa'
      gto[3]='JAN'
      ctt[3]='left(jan->empresa,20)'
   ENDIF
   IF BAR()=7
      IF jannro<>0
         DO lgeni
      ELSE
         DO lgenie
      ENDIF
   ELSE
      IF jannro<>0
         DO lgenp
      ELSE
         DO lgenpe
      ENDIF
   ENDIF
   RELE co,ct,gt,gto,ctt
CASE BAR()=10
   ulpr='XGAS'
   DO kk WITH 17,20
   ON SELE POPU caca DO xgas
   ACTI POPU caca
OTHERWISE
   dijo=BAR()
   STORE gaspop TO anterior
   IF dijo=5
      SET DELE OFF
      STORE .T. TO gaspop
		=OPGAS()
      SET FILTER TO DELETED()
   ENDIF
   STORE 0 TO respuesta
   IF eligas(pq[DIJO])<>0
      GOTO respuesta
      IF dijo=2
         DO cgas
      ELSE
         IF dijo=4
            DO bgas
         ELSE
            DO llgas
				=OPGAS()
         ENDIF
      ENDIF
   ENDIF
   SET DELE ON
   STORE anterior TO gaspop
ENDCASE
RELE dijo
ulpr=PROGRAM()
RETURN
*: EOF: GAS.PRG

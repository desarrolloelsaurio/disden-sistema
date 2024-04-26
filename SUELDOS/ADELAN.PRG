********************************************************************************
*-- Programa: ADELAN.PRG
*-- Fecha   : 12/13/90 00:47am
*-- Version : G. REINER
*-- Notas   : DERIVA A LAS OPERACIONES DE ADELANTO DE SUELDO
********************************************************************************
ulpr=PROGRAM()
@ 24,0 SAY PADC('Espere por Favor',80,' ')
@ 0,0 SAY REPLICATE("Û",80) COLOR W
@ 0,1 SAY 'Sueldos y Jornales' COLOR I
@ 0,20 SAY '|'
@ 0,22 SAY DATE() COLOR I
@ 0,32 SAY '|'
@ 0,34 SAY TIME() COLOR I
@ 0,44 SAY '|'
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 0,58 SAY '|'
@ 0,60 SAY LEFT(janname,19) COLOR I
DO opjan
IF jannro=0
   DO elijan
ENDIF
IF jannro<>0
   DO opliq
   DO opccos
   DO opcat
   DO opcon
	=OPGAS()
   DO opemp
   DO CASE
   CASE BAR()=1
      DO kk1 WITH 4,45,'Ingreso de Adelantos de Sueldo'
      ON SELECTION POPUP caca1 DO iade
      ACTI POPU caca1
      RELE POPU caca1
   CASE BAR()=2
      DO kk2 WITH 5,45,'Generaliza Adelantos de Sueldo'
      ON SELECTION POPUP caca1 DO gade
      ACTI POPU caca1
      RELE POPU caca1
   CASE BAR()=3
      DO kk2 WITH 8,45,'Ingreso Global de Adelantos de Sueldo'
      ON SELECTION POPUP caca1 DO glade
      ACTI POPU caca1
      RELE POPU caca1
   CASE BAR()=5
      DEFI POPU caca1 FROM 8,45 MESS "Tipo de Correcci¢n" SHAD COLOR SCHE 3
      DEFI BAR 1 OF caca1 PROM ' Por \<Empleado'
      DEFI BAR 2 OF caca1 PROM ' Por \<Tipo de Adelanto '
      ON SELE POPU caca1 DO chog WITH '7','Tipo de Adelanto','GAS->GASTO','ELIGAS(" a Corregir")','OPGAS',70
      ACTI POPU caca1
      RELE POPU caca1
   CASE BAR()=7
      DO kk1 WITH 10,45,'Borra Adelantos de Sueldo'
      ON SELECTION POPUP caca1 DO bade
      ACTI POPU caca1
      RELE POPU caca1
   CASE BAR()=8
      @ 24,0 SAY PADC('Borrando el Archivo de Adelantos de Sueldo',80,'*') COLO SCHE 19
      SELE liq
      IF jannro=0
         A=CONFI(.T.,"Borrar Archivo de Adelantos de Sueldo de Todas las Empresas ?",0,0)
      ELSE
         A=CONFI(.T.,"Borrar Archivo de Adelantos de Sueldo de "+ALLTRIM(janname)+' ?',0,0)
      ENDIF
      IF A
         IF jannro=0
            DELE ALL FOR archivo='GAS'
         ELSE
            DELE ALL FOR archivo='GAS'.AND. empresa=jannro
         ENDIF
         @ 24,0 SAY PADC('Compactando el Archivo de Adelantos de Sueldo',80,'*') COLO SCHE 19
         PACK
         @ 24,0 SAY SPACE(80)
      ENDIF
   CASE BAR()=10
   DEFI POPU caca2 FROM 11,45 MESSAGE 'Listado de Adelantos por Impresora' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Un \<Tipo de Adelanto '
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' \<Listado Completo'
   ON SELECTION POPUP caca2 DO lqadei
      ACTI POPU caca2
      RELE POPU caca2
   CASE BAR()=11
   DEFI POPU caca2 FROM 11,45 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Un \<Tipo de Adelanto '
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' \<Listado Completo'
   ON SELECTION POPUP caca2 DO lqadep
   ACTI POPU caca2
   RELE POPU caca2
   CASE BAR()=12
		=OPGAS()
      DO radei WITH RECC("GAS"),'Tipo de Adelanto',"Adelantos "+ALLTRIM(peraliq)
   ENDCASE
ENDIF
ulpr=PROGRAM()
RETURN

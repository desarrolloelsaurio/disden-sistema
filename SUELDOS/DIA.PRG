*:*********************************************************************
*:
*:        Program: DIA.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPQ.PRG
*:
*:          Calls: KK1            (procedure in PROCESOS.PRG)
*:               : IDIA.PRG
*:               : KK2.PRG
*:               : GDIA.PRG
*:               : GLDIA.PRG
*:               : CHDIA.PRG
*:               : BDIA.PRG
*:               : LDIAI.PRG
*:               : LDIAP.PRG
*:               : OPLIQ          (procedure in PROCESOS.PRG)
*:               : OPDIA          (procedure in PROCESOS.PRG)
*:               : RDIA.PRG
*:               : XDIA           (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:53               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: dia.PRG
*-- Fecha   : 02/24/91 05:42pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE INGRESO DE HORAS TRABAJADAS en el dia
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10," ") COLOR I
DO CASE
CASE BAR()=1
   DO kk1 WITH 8,45,'Ingreso de Hs. Trabajadas en el D¡a'
   ON SELECTION POPUP caca1 DO idia
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=2
   DO kk2 WITH 8,45,'Generaliza Hs. Trabajadas en el D¡a'
   ON SELECTION POPUP caca1 DO gdia
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=3
   DO kk2 WITH 8,45,'Ingreso Global Hs. Trabajadas en el D¡a'
   ON SELECTION POPUP caca1 DO gldia
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=5
   DEFI POPU caca1 FROM 9,50 MESS "Tipo de Correcci¢n" SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca1 PROM ' Por \<Empleado'
   DEFI BAR 2 OF caca1 PROM ' Por \<Fecha'
   DEFI BAR 3 OF caca1 PROM ' Por \<Tipo de Hora '
   ON SELE POPU caca1 DO chdia
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=7
   DO kk1 WITH 11,45,'Borra Hs. Trabajadas en el D¡a'
   ON SELECTION POPUP caca1 DO bdia
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=8
   @ 24,0 SAY PADC('Borrando el Archivo de Hs. Trabajadas en el D¡a',80,'*')
   SELE dia
   IF jannro<>0
      A=CONFI(.T.,"Borrar Archivo de Hs. Diarias de "+ALLTRIM(janname)+' ?',0,0)
      IF A
         ZAP
      ENDIF
   ENDIF
   @ 24,0 SAY SPACE(80)
CASE BAR()=10
   DEFI POPU caca2 FROM 12,40 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Un \<Tipo de Hora'
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' Un \<D¡a'
   DEFI BAR 4 OF caca2 PROM ' Completo Por \<Empleado-Tipo de Hora '
   DEFI BAR 5 OF caca2 PROM ' \<Completo Por Tipo de Hora-D¡a'
   DEFI BAR 6 OF caca2 PROM ' Completo Por Em\<pleado-D¡a'
   ON SELECTION POPUP caca2 DO ldiai
   ACTI POPU caca2
   RELE POPU caca2
CASE BAR()=11
   DEFI POPU caca2 FROM 13,50 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Un \<Tipo de Hora'
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' Un \<D¡a'
   DEFI BAR 4 OF caca2 PROM ' Completo Por \<Empleado '
   ON SELECTION POPUP caca2 DO ldiap
   ACTI POPU caca2
   RELE POPU caca2
CASE BAR()=13
   IF jannro<>0
      DO opliq
      DO opdia
      DO rdia
   ENDIF
CASE BAR()=15
   IF jannro<>0
      DO opdia
      ulpr='XDIA'
      DEFI POPU caca2 FROM 16,50 MESSAGE 'Tipo de Restauraci¢n' SHADOW COLOR SCHE 3
      DEFI BAR 1 OF caca2 PROM ' \<Reindexa'
      DEFI BAR 2 OF caca2 PROM ' Reconstruye \<Indice '
      DEFI BAR 3 OF caca2 PROM '----------------------' SKIP
      DEFI BAR 4 OF caca2 PROM ' \<Levanta de Back-Up'
      ON SELE POPU caca2 DO xdia
      ACTI POPU caca2
      RELE POPU caca2
   ENDIF
case bar()=16
	do problem1
ENDCASE
ulpr=PROGRAM()
RETURN
*: EOF: DIA.PRG

*:*********************************************************************
*:
*:        Program: EMPLEA.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: SUELDOS.PRG                   
*:
*:          Calls: OPCAT          (procedure in PROCESOS.PRG)
*:               : OPCON          (procedure in PROCESOS.PRG)
*:               : OPJAN          (procedure in PROCESOS.PRG)
*:               : OPCCOS         (procedure in PROCESOS.PRG)
*:               : OPESP          (procedure in PROCESOS.PRG)
*:               : OPEMP          (procedure in PROCESOS.PRG)
*:               : EMPL.PRG
*:               : OPPAR          (procedure in PROCESOS.PRG)
*:               : OPEPAR         (procedure in PROCESOS.PRG)
*:               : EMPF.PRG
*:               : EMPQ.PRG
*:               : EMPJ.PRG
*:
*:      Documented 04/23/91 at 20:44               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: EMPLEA.PRG
*-- Fecha   : 11/02/90 11:39pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LAS OPERACIONES DE EMPLEADOS
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
DO CASE
CASE BAR()=1
   ulpr='EMPL'
   do opjan
   if jannro<>0
   DO opcat
   DO opcon
   DO opccos
   DO opesp
   DO opemp
   SELE emp
   DEFI POPU grl FROM 4,20 MESS 'Empleados - Datos Personales' SHADOW COLOR SCHE 3
   DEFI BAR 1 OF grl PROM ' \<Ingreso'
   DEFI BAR 2 OF grl PROM ' \<Correcci¢n '
   DEFI BAR 3 OF grl PROM '---------------------' SKIP
   DEFI BAR 4 OF grl PROM ' \<Baja Empleados'
   DEFI BAR 5 OF grl PROM ' \<Recupera Empleado'
   DEFI BAR 6 OF grl PROM '---------------------' SKIP
   DEFI BAR 7 OF grl PROM ' \<Lista por Impresora '
   DEFI BAR 8 OF grl PROM ' Lista por \<Pantalla'
   DEFI BAR 9 OF grl PROM '---------------------' SKIP
   DEFI BAR 10 OF grl PROM ' \<Restaura Archivo'
   ON SELE POPU grl DO empl
   ACTI POPU grl
   endif
CASE BAR()=2
   ulpr='EMPF'
   DO opjan
   if jannro<>0
   DO oppar
   DO opepar
   DO opesp
   DO opemp
   SELE emp
   DEFI POPU grl FROM 5,20 MESS 'Empleados - Datos Familiares' SHADOW COLOR SCHE 3
   DEFI BAR 1 OF grl PROM ' \<Ingreso'
   DEFI BAR 2 OF grl PROM ' \<Correcci¢n'
   DEFI BAR 3 OF grl PROM '------------------------' SKIP
   DEFI BAR 4 OF grl PROM ' \<Borra un Registro'
   DEFI BAR 5 OF grl PROM ' Borra \<Todo'
   DEFI BAR 6 OF grl PROM '------------------------' SKIP
   DEFI BAR 7 OF grl PROM ' \<Lista por Impresora '
   DEFI BAR 8 OF grl PROM ' Lista por \<Pantalla'
   DEFI BAR 9 OF grl PROM '------------------------' SKIP
   DEFI BAR 10 OF grl PROM ' \<Restaura el Archivo'
   ON SELE POPU grl DO empf
   ACTI POPU grl
   endif
CASE BAR()=3
   ulpr='EMPQ'
   DEFI POPU grl FROM 4,20 MESS 'Empleados - Datos de la Liquidaci¢n' SHADOW COLOR SCHE 3
   DEFI BAR 1 OF grl PROM ' Horas Trabajadas \<Diarias'
   DEFI BAR 2 OF grl PROM ' \<Horas Trabajadas'
   DEFI BAR 3 OF grl PROM ' \<Asigna Adicionales'
   DEFI BAR 4 OF grl PROM ' Asigna \<Retenciones'
   DEFI BAR 5 OF grl PROM ' Asigna \<Salario Familiar'
   DEFI BAR 6 OF grl PROM ' Asigna Registro de R\<edondeo '
   ON SELE POPU grl DO empq
   ACTI POPU grl
CASE BAR()=4
   ulpr='EMPJ'
   do opjan
   if jannro<>0
   DO opcat
   DO opcon
   DO opccos
   DO opjan
   DO opesp
   DO opemp
   SELE emp
   DEFI POPU grl FROM 5,20 MESS 'Legajo del Empleado' SHADOW COLOR SCHE 3
   DEFI BAR 1 OF grl PROM ' \<Ingreso / Correcci¢n'
   DEFI BAR 2 OF grl PROM '--------------------------' SKIP
   DEFI BAR 3 OF grl PROM ' \<Borra Legajo'
   DEFI BAR 4 OF grl PROM ' Borra \<Todos los Legajos '
   DEFI BAR 5 OF grl PROM '--------------------------' SKIP
   DEFI BAR 6 OF grl PROM ' \<Lista por Impresora'
   DEFI BAR 7 OF grl PROM ' Lista por \<Pantalla'
   ON SELE POPU grl DO empj
   ACTI POPU grl
   endif
ENDCASE
ulpr=PROGRAM()
RETURN
*: EOF: EMPLEA.PRG

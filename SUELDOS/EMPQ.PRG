*:*********************************************************************
*:
*:        Program: EMPQ.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPLEA.PRG
*:
*:          Calls: OPJAN          (procedure in PROCESOS.PRG)
*:               : ELIJAN         (procedure in PROCESOS.PRG)
*:               : OPDIA          (procedure in PROCESOS.PRG)
*:               : OPEMP          (procedure in PROCESOS.PRG)
*:               : OPCAT          (procedure in PROCESOS.PRG)
*:               : OPCON          (procedure in PROCESOS.PRG)
*:               : OPCCOS         (procedure in PROCESOS.PRG)
*:               : OPTHOR         (procedure in PROCESOS.PRG)
*:               : KK3            (procedure in PROCESOS.PRG)
*:               : DIA.PRG
*:               : OPLIQ          (procedure in PROCESOS.PRG)
*:               : HOR.PRG
*:               : OPADI          (procedure in PROCESOS.PRG)
*:               : QADI.PRG
*:               : OPRET          (procedure in PROCESOS.PRG)
*:               : QRET.PRG
*:               : OPSAL          (procedure in PROCESOS.PRG)
*:               : QSAL.PRG
*:               : QRED.PRG
*:
*:      Documented 04/23/91 at 20:45               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: EMPQ.PRG
*-- Fecha   : 11/03/90 01:05am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE INGRESO DE DATOS DE LIQUIDACION
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro<>0
      DO opdia
      DO opemp
      DO opcat
      DO opcon
      DO opccos
      DO opthor
      DO kk3 WITH 6,30,'Horas Trabajadas en el D¡a','Hs. Trabajadas'
      DEFI BAR 12 OF caca PROM '-------------------------------' SKIP
      DEFI BAR 13 OF caca PROM ' G\<enera Registro Horas'
      DEFI BAR 14 OF caca PROM '-------------------------------' SKIP
      DEFI BAR 15 OF caca PROM ' \<Restaura Archivo'
      DEFI BAR 16 OF caca PROM ' \<Problemas'
      ON SELE POPU caca DO dia
      ACTI POPU caca
      RELE POPU caca
   ENDIF
CASE BAR()=2
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro<>0
      DO opliq
      DO opemp
      DO opcat
      DO opcon
      DO opccos
      DO opthor
      DO kk3 WITH 6,30,'Horas Trabajadas','Hs. Trabajadas'
      ON SELE POPU caca DO hor
      ACTI POPU caca
      RELE POPU caca
   ENDIF
CASE BAR()=3
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro<>0
      DO opliq
      DO opemp
      DO opcat
      DO opcon
      DO opccos
      DO opadi
      DO kk3 WITH 6,30,'Asigna Adicionales','Adicionales'
      ON SELE POPU caca DO qadi
      ACTI POPU caca
      RELE POPU caca
   ENDIF
CASE BAR()=4
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro<>0
      DO opliq
      DO opemp
      DO opcat
      DO opcon
      DO opccos
      DO opret
      DO kk3 WITH 7,30,'Asigna Retenciones','Retenciones'
      ON SELE POPU caca DO qret
      ACTI POPU caca
      RELE POPU caca
   ENDIF
CASE BAR()=5
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro<>0
      DO opemp
      DO opcat
      DO opcon
      DO opccos
      DO opsal
      DO opliq
      DO kk3 WITH 8,30,'Asigna Salario Familiar',"Salario Familiar"
      ON SELE POPU caca DO qsal
      ACTI POPU caca
      RELE POPU caca
   ENDIF
CASE BAR()=6
   DO opjan
   IF jannro=0
      DO elijan
   ENDIF
   IF jannro<>0
      DO opemp
      DO opliq
      DEFI POPU caca FROM 10,40 MESSAGE 'Rango de Generaci¢n Registro de Redondeo' SHADOW COLOR SCHE 3
      DEFI BAR 1 OF caca PROM ' \<Todos los Empleados '
      DEFI BAR 2 OF caca PROM ' \<Un Empleado'
      ON SELE POPU caca DO qred
      ACTI POPU caca
      RELE POPU caca
   ENDIF
ENDCASE
ulpr=PROGRAM()
RETURN
*: EOF: EMPQ.PRG

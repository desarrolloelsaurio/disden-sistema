********************************************************************************
*-- Programa: HOR.PRG
*-- Fecha   : 11/03/90 01:05am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE INGRESO DE
*             HORAS TRABAJADAS
********************************************************************************
ulpr=PROGRAM()
uli=ulpr
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10," ") COLOR I
DO CASE
CASE BAR()=1
   DO kk1 WITH 7,45,'Ingreso de Horas Trabajadas'
   ON SELECTION POPUP caca1 DO ihor
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=2
   DO kk2 WITH 8,45,'Generaliza Horas Trabajadas'
   ON SELECTION POPUP caca1 DO ghor
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=3
   DO kk2 WITH 8,45,'Ingreso Global Horas Trabajadas'
   ON SELECTION POPUP caca1 DO glhor
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=5
   DEFI POPU caca1 FROM 9,45 MESS "Tipo de Correcci¢n" SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca1 PROM ' Cantidades por \<Empleado'
   DEFI BAR 2 OF caca1 PROM ' Cantidades por Tipo de \<Hora '
   DEFI BAR 3 OF caca1 PROM '\-' SKIP
   DEFI BAR 4 OF caca1 PROM ' \<Montos por Empleado'
   DEFI BAR 5 OF caca1 PROM ' M\<ontos por Tipo de Hora'
   ON SELE POPU caca1 DO chog WITH '9','Horas Trabajadas','THOR->HORTIPOHOR','ELITHOR(" a Corregir")','OPTHOR',10
   DO opthor
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=7
   DO kk1 WITH 11,45,'Borra Horas Trabajadas'
   ON SELECTION POPUP caca1 DO bhor
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=8
   @ 24,0 SAY PADC('Borrando el Archivo de Horas Trabajadas',80,'*')
   SELE liq
   IF jannro=0
      A=CONFI(.T.,"Borrar Archivo de Horas Trabajadas de Todas las Empresas ?",0,0)
   ELSE
      A=CONFI(.T.,"Borrar Archivo de Horas Trabajadas de "+ALLTRIM(janname)+' ?',0,0)
   ENDIF
   IF A
      IF jannro=0
         DELE ALL FOR filtcon=10
      ELSE
         DELE ALL FOR filtcon=10 .AND. empresa=jannro
      ENDIF
      @ 24,0 SAY PADC('Compactando el Archivo de Horas Trabajadas',80,'*')
      PACK
      @ 24,0 SAY SPACE(80)
   ENDIF
CASE BAR()=10
   DEFI POPU caca2 FROM 12,50 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Un \<Tipo de Hora'
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' Listado Control Gr fico'
   DEFI BAR 4 OF caca2 PROM ' \<Listado Horas Trabajadas '
   ON SELECTION POPUP caca2 DO lhori WITH 10,'THOR','THOR->HORTIPOHOR','Horas Trabajadas','ELITHOR(" a Listar")',9
   ACTI POPU caca2
   RELE POPU caca2
CASE BAR()=11
   DEFI POPU caca2 FROM 13,50 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Un \<Tipo de Hora'
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' \<Listado Completo Horas '
   ON SELECTION POPUP caca2 DO lhorp WITH 10,'THOR','THOR->HORTIPOHOR','Horas Trabajadas','ELITHOR(" a Listar")'
   ACTI POPU caca2
   RELE POPU caca2
ENDCASE
ulpr=PROGRAM()
RETURN

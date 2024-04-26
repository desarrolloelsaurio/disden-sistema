*:*********************************************************************
*:
*:        Program: QSAL.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPQ.PRG                      
*:
*:          Calls: KK1            (procedure in PROCESOS.PRG)
*:               : IQSAL.PRG
*:               : KK2.PRG
*:               : GQSAL.PRG
*:               : GLSAL.PRG
*:               : CHOG.PRG
*:               : OPSAL          (procedure in PROCESOS.PRG)
*:               : BQSAL.PRG
*:               : LHORI.PRG
*:               : LHORP.PRG
*:
*:      Documented 04/23/91 at 20:53               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: QSAL.PRG
*-- Fecha   : 11/12/90 06:59pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE INGRESO DE
*             SALARIO FAMILIAR
********************************************************************************
ulpr=PROGRAM()
uli=ulpr
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   DO kk1 WITH 10,45,'Asignaci¢n de Salario Familiar al Empleado'
   ON SELECTION POPUP caca1 DO iqsal
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=2
   DO kk2 WITH 10,45,'Generaliza Salario Familiar'
   ON SELECTION POPUP caca1 DO gqsal
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=3
   DO kk2 WITH 8,45,'Ingreso Global de Adicionales'
   ON SELECTION POPUP caca1 DO glsal
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=5
   DEFI POPU caca1 FROM 12,45 MESS "Tipo de Correcci¢n" SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca1 PROM ' Cantidades por \<Empleado'
   DEFI BAR 2 OF caca1 PROM ' Cantidades por \<Rubro '
   DEFI BAR 3 OF caca1 PROM '-----------------------------' SKIP
   DEFI BAR 4 OF caca1 PROM ' \<Montos por Empleado'
   DEFI BAR 5 OF caca1 PROM ' M\<ontos por Rubro'
   ON SELE POPU caca1 DO chog WITH '12','Salario Familiar','SAL->SALARIO','ELISAL(" a Corregir")','OPSAL',40
   DO opsal
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=7
   DO kk1 WITH 10,45,'Borra Salario Familiar'
   ON SELECTION POPUP caca1 DO bqsal
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=8
   @ 24,0 SAY PADC('Borrando el Archivo de Salario Familiar',80,'*')
   SELE liq
   IF jannro=0
      A=CONFI(.T.,"Borrar Archivo de Salario Familiar de Todas las Empresas ?",0,0)
   ELSE
      A=CONFI(.T.,"Borrar Archivo de Salario Familiar de "+ALLTRIM(janname)+' ?',0,0)
   ENDIF
   IF A
      IF jannro=0
         DELE ALL FOR filtcon=40
      ELSE
         DELE ALL FOR filtcon=40 .AND. empresa=jannro
      ENDIF
      @ 24,0 SAY PADC('Compactando el Archivo de Salario Familiar',80,'*')
      PACK
      @ 24,0 SAY SPACE(80)
   ENDIF
   SELE liq
   @ 24,0 SAY PADC('Compactando el Archivo de Salario Familiar',80,'*')
   PACK
   @ 24,0 SAY SPACE(80)
CASE BAR()=10
   DEFI POPU caca2 FROM 12,50 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Un \<Rubro'
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' \<Listado Control Gr fico '
   DEFI BAR 4 OF caca2 PROM ' Listado \<Casos'
   ON SELECTION POPUP caca2 DO lhori WITH 40,'SAL','SAL->SALARIO','Salario Familiar','ELISAL(" a Listar")',12
   ACTI POPU caca2
   RELE POPU caca2
CASE BAR()=11
   DEFI POPU caca2 FROM 13,50 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Un \<Rubro'
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' \<Listado Completo '
   ON SELECTION POPUP caca2 DO lhorp WITH 40,'SAL','SAL->SALARIO','Salario Familiar','ELISAL(" a Listar")'
   ACTI POPU caca2
   RELE POPU caca2
ENDCASE
ulpr=PROGRAM()
RETURN

*: EOF: QSAL.PRG

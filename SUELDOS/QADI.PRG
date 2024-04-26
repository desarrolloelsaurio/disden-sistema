*:*********************************************************************
*:
*:        Program: QADI.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPQ.PRG                      
*:
*:          Calls: KK1            (procedure in PROCESOS.PRG)
*:               : IQADI.PRG
*:               : KK2.PRG
*:               : GQADI.PRG
*:               : GLADI.PRG
*:               : CHOG.PRG
*:               : OPADI          (procedure in PROCESOS.PRG)
*:               : BQADI.PRG
*:               : LHORI.PRG
*:               : LHORP.PRG
*:
*:      Documented 04/23/91 at 20:53               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: QADI.PRG
*-- Fecha   : 11/12/90 06:59pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE INGRESO DE
*             ADICIONALES
********************************************************************************
ulpr=PROGRAM()
uli=ulpr
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   DO kk1 WITH 10,45,'Asignaci¢n de Adicionales al Empleado'
   ON SELECTION POPUP caca1 DO iqadi
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=2
   DO kk2 WITH 10,45,'Generaliza Adicionales'
   ON SELECTION POPUP caca1 DO gqadi
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=3
   DO kk2 WITH 8,45,'Ingreso Global de Adicionales'
   ON SELECTION POPUP caca1 DO gladi
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=5
   DEFI POPU caca1 FROM 10,50 MESS "Tipo de Correcci¢n" SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca1 PROM ' Por \<Empleado'
   DEFI BAR 2 OF caca1 PROM ' Por \<Adicional '
   ON SELE POPU caca1 DO chog WITH '10','Adicionales','ADI->ADICIONAL','ELIADI(" a Corregir")' ,'OPADI',20
   DO opadi
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=7
   DO kk1 WITH 10,45,'Borra Adicionales'
   ON SELECTION POPUP caca1 DO bqadi
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=8
   @ 24,0 SAY PADC('Borrando el Archivo de Adicionales',80,'*')
   SELE liq
   IF jannro=0
      A=CONFI(.T.,"Borrar Archivo de Adicionales de Todas las Empresas ?",0,0)
   ELSE
      A=CONFI(.T.,"Borrar Archivo de Adicionales de "+ALLTRIM(janname)+' ?',0,0)
   ENDIF
   IF A
      IF jannro=0
         DELE ALL FOR filtcon=20
      ELSE
         DELE ALL FOR filtcon=20 .AND. empresa=jannro
      ENDIF
      @ 24,0 SAY PADC('Compactando el Archivo de Adicionales',80,'*')
      PACK
      @ 24,0 SAY SPACE(80)
   ENDIF
CASE BAR()=10
   DEFI POPU caca2 FROM 12,50 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Un \<Adicional'
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' \<Listado Control Gr fico '
   ON SELECTION POPUP caca2 DO lhori WITH 20,'ADI','ADI->ADICIONAL','Adicionales','ELIADI(" a Listar")',10
   ACTI POPU caca2
   RELE POPU caca2
CASE BAR()=11
   DEFI POPU caca2 FROM 13,50 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Un \<Adicional'
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' \<Listado Completo '
   ON SELECTION POPUP caca2 DO lhorp WITH 20,'ADI','ADI->ADICIONAL','Adicionales','ELIADI(" a Listar")'
   ACTI POPU caca2
   RELE POPU caca2
ENDCASE
ulpr=PROGRAM()
RETURN

*: EOF: QADI.PRG

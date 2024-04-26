********************************************************************************
*-- Programa: QRET.PRG
*-- Fecha   : 11/12/90 06:59pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE INGRESO DE
*             RETENCIONES
********************************************************************************
ulpr=PROGRAM()
uli=ulpr
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   DO kk1 WITH 10,45,'Asignaci¢n de Retenciones al Empleado'
   ON SELECTION POPUP caca1 DO iqret
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=2
   DO kk2 WITH 10,45,'Generaliza Retenciones'
   ON SELECTION POPUP caca1 DO gqret
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=3
   DO kk2 WITH 8,45,'Ingreso Global de Retenciones'
   ON SELECTION POPUP caca1 DO glret
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=5
   DEFI POPU caca1 FROM 11,50 MESS "Tipo de Correcci¢n" SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca1 PROM ' Por \<Empleado'
   DEFI BAR 2 OF caca1 PROM ' Por \<Retenci¢n '
   ON SELE POPU caca1 DO chog WITH '11','Retenciones','RET->RETENCION','ELIRET(" a Corregir")','OPRET',30
   DO opret
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=7
   DO kk1 WITH 10,45,'Borra Retenciones'
   ON SELECTION POPUP caca1 DO bqret
   ACTI POPU caca1
   RELE POPU caca1
CASE BAR()=8
   @ 24,0 SAY PADC('Borrando el Archivo de Retenciones',80,'*') COLOR SCHE 19
   SELE liq
   IF jannro=0
      A=CONFI(.T.,"Borrar Archivo de Retenciones de Todas las Empresas ?",0,0)
   ELSE
      A=CONFI(.T.,"Borrar Archivo de Retenciones de "+ALLTRIM(janname)+' ?',0,0)
   ENDIF
   IF A
      IF jannro=0
         DELE ALL FOR filtcon=30
      ELSE
         DELE ALL FOR filtcon=30 .AND. empresa=jannro
      ENDIF
      @ 24,0 SAY PADC('Compactando el Archivo de Retenciones',80,'*')
      PACK
      @ 24,0 SAY SPACE(80)
   ENDIF
CASE BAR()=10
   DEFI POPU caca2 FROM 13,50 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Una \<Retenci¢n'
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' \<Listado Control Gr fico '
   ON SELECTION POPUP caca2 DO lhori WITH 30,'RET','RET->RETENCION','Retenciones','ELIRET(" a Listar")',11
   ACTI POPU caca2
   RELE POPU caca2
CASE BAR()=11
   DEFI POPU caca2 FROM 13,50 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca2 PROM ' Una \<Retenci¢n'
   DEFI BAR 2 OF caca2 PROM ' Un \<Empleado'
   DEFI BAR 3 OF caca2 PROM ' \<Listado Completo '
   ON SELECTION POPUP caca2 DO lhorp WITH 30,'RET','RET->RETENCION','Retenciones','ELIRET(" a Listar")'
   ACTI POPU caca2
   RELE POPU caca2
ENDCASE
ulpr=PROGRAM()
RETURN

*: EOF: QRET.PRG

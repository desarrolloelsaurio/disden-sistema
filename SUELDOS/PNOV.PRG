********************************************************************************
*-- Programa: pnov.prg
*-- Fecha   : 01/15/91 09:02pm
*-- Version : G. REINER
*-- Notas   : deriva a impresion de planillas de ingreso de novedades
********************************************************************************
ulpr=PROGRAM()
dijo=BAR()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
IF jannro=0
   DO opjan
ENDIF
DO elijan
IF jannro<>0
   DO opemp
   DO opccos
   DO CASE
   CASE dijo=1
      DO opthor
      DEFI POPU caca2 FROM 11,40 MESSAGE "L¡mites de la Planilla" SHAD COLO SCHE 3
      DEFI BAR 1 OF caca2 PROM ' \<Todos los Centros de Costo '
      DEFI BAR 2 OF caca2 PROM ' \<Un Centro de Costos'
      ON SELE POPU caca2 DO pnov1 WITH 'thor.hortIPOHOR','Novedades de Horas Trabajadas',9,"THOR.HORFILTRO"
      ACTI POPU caca2
      RELE POPU caca2
   CASE dijo=2
      DO opadi
      DEFI POPU caca2 FROM 12,40 MESSAGE "L¡mites de la Planilla" SHAD COLO SCHE 3
      DEFI BAR 1 OF caca2 PROM ' \<Todos los Centros de Costo '
      DEFI BAR 2 OF caca2 PROM ' \<Un Centro de Costos'
      ON SELE POPU caca2 DO pnov1 WITH 'ADI.ADICIONAL','Novedades de Adicionales',10,"ADI.ADIEMPRESA"
      ACTI POPU caca2
      RELE POPU caca2
      RELE cha
   CASE dijo=3
      DO opret
      cha=0
      DEFI POPU caca2 FROM 13,40 MESSAGE "L¡mites de la Planilla" SHAD COLO SCHE 3
      DEFI BAR 1 OF caca2 PROM ' \<Todos los Centros de Costo '
      DEFI BAR 2 OF caca2 PROM ' \<Un Centro de Costos'
      ON SELE POPU caca2 DO pnov1 WITH 'ret.retencion','Novedades de Retenciones',11,"RET.RETEMPRESA"
      ACTI POPU caca2
      RELE POPU caca2
      RELE cha
   CASE dijo=4
      DO opsal
      cha=0
      DEFI POPU caca2 FROM 13,40 MESSAGE "L¡mites de la Planilla" SHAD COLO SCHE 3
      DEFI BAR 1 OF caca2 PROM ' \<Todos los Centros de Costo '
      DEFI BAR 2 OF caca2 PROM ' \<Un Centro de Costos'
      ON SELE POPU caca2 DO pnov1 WITH 'sal.salario','Novedades de S. Familiar',12,"cha"
      ACTI POPU caca2
      RELE POPU caca2
      RELE cha
   ENDCASE
ENDIF
RELE dijo
RETURN

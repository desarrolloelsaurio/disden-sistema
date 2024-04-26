********************************************************************************
*-- Programa: XPER.PRG
*-- Fecha   : 06/27/91
*-- Version : V.LEEGSTRA
*-- Notas   : RESTAURA BASE DE CLIENTES
********************************************************************************
ulpr=hora_ulp(PROGRAM())
stor "" TO tx
SELE PER
DO CASE
CASE BAR()=1
      @ 24,nul SAY PADC('Reindexando el Archivo de Clientes',80,'*') COLO SCHE 19
      REINDEX
      tx='REINDEX '
CASE BAR()=2
   use
   USE (PATHVEN+'\CLIENTES')
   @ 24,nul SAY PADC('Generando Nuevo Indice de Clientes',80,'*') COLO SCHE 19
   INDE ON cliente TO (PATH+"\CLIENTE")
   INDE ON codcli TO (PATH+"\CODCLI")
   USE
	=OPCLI()
   tx='CREA INDICE '
ENDCASE
IF tx#''
   DO iaud WITH tx+' CLIENTES'
ENDIF
RETURN

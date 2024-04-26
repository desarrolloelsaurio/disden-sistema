*:*********************************************************************
*-- Programa: OPREC.PRG
*-- Fecha   : 07/04/91 11:00am
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO REMITO PROVEEDORES
*-- Modificaci¢n GOYO 08/08/92
*:*********************************************************************
IF ESOPEN("Remitos de Proveedores",11,"RED")
   USE (pathcpr+'\REMITDAC') order tag remito ALIAS RED
ENDIF
IF ESOPEN("",10,"REC")
   USE (pathcpr+'\REMITOC') order tag remito ALIAS REC
ENDIF
RETURN MEN_LIN(BOTOM)

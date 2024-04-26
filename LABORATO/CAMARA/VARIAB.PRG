*********************************************************************************
*-- Programa: VARIAB.PRG
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : MENU VARIABLES DEL SISTEMA
********************************************************************************
=CABPAN1()
VB_DIJO=ALLTRIM(PROMPT())
DO CASE
case VB_DIJO='Ancho de la Impresora'
   DO ACANCHO.SPR
case VB_DIJO='Ancho de la Hoja'
   DO ACHOJA.SPR
case VB_DIJO='Popups a Utilizar'
   DO ACPOPU.SPR
case VB_DIJO='Orden de los Listados'
   DO ORDMER.SPR
case VB_DIJO='Cantidad de D¡gitos'
   DO ACDIGI
case VB_DIJO='N£mero de Paciente'
   DO ACNUMPAC.SPR
case VB_DIJO='Porc. de Participaci¢n'
   DO ACPORPAR.SPR
case VB_DIJO='Porc. de Socios'
   DO ACPARSOC.SPR
ENDCASE
RETURN MEN_LIN(BOTOM)

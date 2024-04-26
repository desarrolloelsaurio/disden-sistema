*********************************************************************************
*-- Programa: VARIOS.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************************************************************
=CABPAN1()
VR_DIJO=ALLTRIM(PROMPT())
DO CASE
case VR_DIJO='Condici¢n de I.V.A.'
	DO OPIVA
	DO IVA
case VR_DIJO='Material Radiactivo'
	DO OPRAD
	DO RAD
case VR_DIJO='Material Descartable'
	DO OPDES
	DO DES
case VR_DIJO='Medicamentos'
	DO OPREM
	DO REM
case VR_DIJO='Provincias'
	=OPPRV()
	DO PRV
case VR_DIJO='Tipos de Documento'
	DO OPDNI
	DO DNI
case VR_DIJO='Unidades de Medida'
	DO OPMDD
	DO MDD
case VR_DIJO='Ciudades'
	=OPCIU()
	DO GRL WITH 4,5,'Men£ de Ciudades'
	ON SELE POPU GRL DO CIU
	ACTI POPU GRL
	RELE POPU GRL
case VR_DIJO='Control de Impresoras'
   	DO OPCIMP
ENDCASE
RETURN MEN_LIN(BOTOM)

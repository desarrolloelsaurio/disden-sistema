********************************************************************************
*-- Programa: REMITO.PRG
*-- Fecha   : 05-26-93 02:00am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE REMITOS
*-- VERSION NOVOGAR
*Remito a Facturar
*Remito a Sucursales
*Remito de Reparto
*Listado por Pantalla
*Listado por Impresora
*Anula Remito
*Restaura el Archivo
*Transferencia de Informaci¢n
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
R_DIJO=ALLTRIM(PROMPT())
=OPCLI()
=opvia()
=OPCIU()
=OPRUB()
=OPMAR()
=OPPAG()
DO CASE
CASE R_DIJO='Remito a Facturar'
	=OPMER()
	=OPKAR()
	=OPREM()
	DO FAC.SPR WITH .F.,.T.,1
CASE R_DIJO='Remito a Sucursales'
	DO OPSUC
	=OPMER()
	=OPKAR()
	=OPREM()
	DO FAC.SPR WITH .F.,.T.,2
CASE R_DIJO='Anula Remito'
	=OPMER()
	=OPKAR()
	=OPREM()
	if !empty(elirem("a Anular"))
		if empty(rem.facturado)
			DO AREM
		else
			=ERR_REM("ANULARLO")
		endif
	endif
CASE R_DIJO='Listado por Pantalla'
	=OPMER()
	=OPKAR()
	do opREM
	DO LREM WITH .T.
CASE R_DIJO='Listado por Impresora'
	=OPMER()
	=OPKAR()
	do opREM
	DO LREM
CASE R_DIJO='Restaura el Archivo'
	DO XREM
CASE R_DIJO="Transferencia de Informaci¢n"
    r_nada="#Transferencia de Informaci¢n#3"
	respuesta='TRREM#'
	IF ESARROYO
		RESPUESTA=RESPUESTA+"12#50"+r_nada+';
#Genera Dis\<kette;
#Resumen Actualizaci¢n \<Stock;
#C\<arga Informaci¢n de Diskette'
	ELSE
		RESPUESTA=RESPUESTA+"8#50"+r_nada+';
#Genera Dis\<kette;
#\<Verifica Informaci¢n Enviada;
#-;
#Verifica Informaci¢n \<Recibida;
#Resumen Actualizaci¢n \<Stock;
#C\<arga Informaci¢n de Diskette'
	ENDIF
	=defpop()
	ON SELE POPU TRREM DO TRREM
	ACTI POPU TRREM
	RELE POPU TRREM
ENDCASE
ulpr=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)

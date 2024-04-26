*********************************************
*-- Programa: COSTOS.PRG
*-- Fecha   : 09/18/91 04:02PM
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE COSTOS
*********************************************
DO_DIJO=ALLTRIM(PROMPT())
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE DO_DIJO='Proyecci¢n de Existencia'
	=OPMER()
	=OPRUB()
	=OPTELS()
	=OPAVIS()
	=OPDES()
	DO IMER_DO.SPR WITH .F., "C lculo de Stock P/Fabricaci¢n",29,.T.
CASE DO_DIJO='Proyecci¢n Costos M. P.'
	=OPMER()
	=OPRUB()
	=OPTELS()
	=OPAVIS()
	=OPDES()
	DO IMER_DO.SPR WITH .F., "C lculo de Costos de M.P.",27,.T.
CASE DO_DIJO='Proyecci¢n Costos M. O.'
	=OPMER()
	=OPRUB()
	=OPTELS()
	=OPAVIS()
	=OPDES()
	DO IMER_DO.SPR WITH .F., "C lculo de Costos de M.O.",28,.F.,.T.
CASE DO_DIJO=='Proyecci¢n Costos por Curva'
	=OPCUR()
	=OPPRO()
	=OPMER()
	=OPTELS()
	=OPAVIS()
	=OPDES()
	DO LCCOSX
CASE DO_DIJO=='Proyecci¢n Costos por Curva-Madre'
    =OPTMA()
	=OPCUR()
	=OPPRO()
	=OPMER()
	=OPTELS()
	=OPAVIS()
	=OPDES()
	DO LCCOSX WITH .T.
CASE DO_DIJO="Co\<ntrol de Facturas"
	=OPPRC()
	SET ORDER TO TAG PRCCOD
	=OPPRO()
	SET ORDER TO TAG PROCOD
	=OPFAB()
	=OPMER()
	=OPFCO()
	SET ORDER TO TAG REMITO
	=OPCOR()
	DO ICOR_DO.SPR WITH "a Controlar",1
ENDCASE
UNLO ALL
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)

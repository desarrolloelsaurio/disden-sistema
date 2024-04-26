*****************************************************
*-- Programa: LIFAANT.PRG
*-- Fecha   : 29/12/89
*-- Version : G. REINER
*-- Notas   : LISTADO DE FACTURAS EMITIDAS EN EL MES
*--           DISCRIMINADAS DIA POR DIA
*--      VIENE DE FACTURA.PRG
****************************************************
mes=0
DEFI WIND win FROM 10,0 TO 14,79 DOUB
ACTI WIND win
@ 1,5 SAY 'MES A LISTAR (0 PARA MENU) ' GET mes PICT '99' RANGE 0,12
READ
DEAC WIND ALL
IF mes#0
	ON ERROR QUIT
	ON ESCAPE RETURN TO MASTER
	respuesta=0
	DO limerpai
	ON ESCAPE
	ON ERROR
	IF !EMPTY(RESPUESTA)
		respu=respuesta
		SELE fac1
		fisc="MONTH(FACFECHA)=MES .and. facfiltro#'RE'"
		fincli=RECCOUNT('PER')+1
		SET ORDER TO TAG facfecha
		RELE linea,pepe,texto,acla,tt
		PRIVATE linea,pepe,texto,acla,tt
		DO WHIL !PRIN()
			DO impresor
		ENDD
		SCAN FOR MONTH(FACFECHA)=MES .and. facfiltro#'RE'
			fecha=facfecha
			EXIT
		ENDS
		tt='FACTURAS EMITIDAS - FECHA '+DTOC(fecha)
		do lifaant1
		RELEASE linea,pepe,texto,acla
		SET FILTER TO
		SET INDEX TO
	ENDI
ENDI
DEAC WIND ALL
RETURN

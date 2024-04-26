********************************************************************************
*-- Programa: LIQUID.PRG
*-- Fecha   : 02-10-92 10:45am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE LIQUIDACION
********************************************************************************
ulpr=PROGRAM()
=OPCIU()
DO OPCCP
=OPMER()
=OPKAR()
=OPPRO()
DO OPREM
DO OPFAR
=OPRUB()
=OPPRO()
=cabpan1()
DO CASE
CASE BAR()=1
	DO ILIQ
CASE BAR()=2
	DO ILIQG
CASE BAR()=4
	store space(14) to factura
	=movewin(iremr,iremc,iremr+5,iremc+50,'ALGO'," Facturas ")
	SELE FAR
	@ 1,1 SAY "Nro LIQUIDACION: "
	@ 2,1 SAY "Empresa        : "
	@ 1,28 GET m.FACTURA PICT "99999999999999";
	MESS 'Ingrese Nro de Factura [ENTER] p/menu'
	READ
	IF !EMPTY(m.FACTURA)
		IF !EMPTY(eliemp(' [ESC] para Men£ ',2,53))
			m.marca = LEFT(MIX.TEXTO2,2)
			nada = mix.texto1
			ACTI WIND ALGO
			@ 2,28 GET nada
			CLEA GETS
			M.FACTURA=RIGHT(SPACE(14)+ALLTRIM(M.FACTURA),14)
			SELE FAR
			=RELEWIN('ALGO')
			IF SEEK(m.factura)
				DO MLIQ
			ENDIF
		ENDIF
	else
		=relewin("algo")
	ENDIF
CASE BAR()=6
	DO LRESP WITH .T.
CASE BAR()=7
	DO LRESP
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
UNLO ALL
RETURN

******************************************************************************
*-- Programa: LcajPX.PRG
*-- Fecha   : 05-13-92 04:41pm
*-- Version : G. REINER & R. 'EL BATA'
*-- Notas   : LISTADO DE RESUMEN DE SALDOS
********************************************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	TT='Listado de Saldos'+ttque
	=LCAJPX0()
	=WIN0()
	pag=1
	=CABPAN()
	=tit_lns(1)
	SELE caj
	STORE NUL TO GMONTOTO,MONTOTO
	PICU='99,999,999.99'
	GO TOP
	ELTEXTO=''
	ELCORTE=''
	=CORTA()
	SCAN
		IF YACORTO()
			=FLcajPX1()
		ENDIF
		IF ROW()=21
			IF TLcajPX1("SUBTOTAL")=27
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=CABPAN()
			=tit_lns(2)
		ENDIF
		MONTOTO=MONTOTO+ABS(MONTO)
	ENDSCAN
	if last()#27
		=FLcajPX1()
		=TLcajPX1("TOTAL")
	endif
	=relewin("WIN")
ELSE
	=iaudi()
ENDIF
=OPcaj(JANNRO,.F.,.T.)
RETURN men_lin(botom)

function TLcajPX1
	parameter cosa
	private cosa
	? LNS
	? PAIP
	?? PADR(COSA,IIF(FILFEC=3,8,IIF(FILGAS=3,20,30)))
	?? PAIP
	?? GMONTOTO PICT PICU
	?? PAIP
return(inkey(nul))

function FLcajPX1
	? PAIP
	?? ELTEXTO
	?? PAIP
	?? MONTOTO PICT PICU
	GMONTOTO=GMONTOTO+MONTOTO
	?? PAIP
	STORE NUL TO MONTOTO
	=CORTA()
RETURN .T.

FUNCTION YACORTO
	PRIV YA
	YA=IIF(FILFEC=3,ELCORTE=caj.FECHAOP,.F.)
	YA=IIF(FILCLI=3.OR.FILPRO=3,ELCORTE=caj.CODcli,YA)
	YA=IIF(FILGAS=3,ELCORTE=caj.GASTO,YA)
RETURN !YA

FUNCTION CORTA
	IF FILFEC=3
		ELTEXTO=caj.FECHAOP
		ELCORTE=caj.FECHAOP
	ENDIF
	IF FILPRO=3
		ELTEXTO=PRO.PROVEEDOR
		ELCORTE=CAJ.CODCLI
	ENDIF
	IF FILCLI=3
		ELTEXTO=PER.CLIENTE
		ELCORTE=CAJ.CODCLI
	ENDIF
	IF FILGAS=3
		ELTEXTO=MIX.TEXTO1
		ELCORTE=CAJ.GASTO
	ENDIF
RETURN

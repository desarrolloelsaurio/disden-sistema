*********************************************************************************
*-- Programa: ndeb.prg
*-- Fecha   : 02-17-92 00:07am
*-- Version : G. REINER
*-- Notas   : MENU DE GESTION DE NOTAS DE DEBITO
********************************************************************************
PARAMETER XREN,XCOL
ulpr=program()
=cabpan1()
INVOICE='ND'
TIT_INVO='NOTA DE DEBITO'
TIT_INVOs='Notas De D‚bito'
fil_invo='TIPO="ND"'
abr_invo="N. D‚b."
fisc='.t.'
tt='A'
DO CASE
CASE BAR()=1
	do ideb.SPR
case bar()=3
	=OPVIA()
	DO LFAC WITH .F.
CASE BAR()=4
	=OPVIA()
	DO LFAC WITH .T.
case bar()=6
	IF busdeb()
		quefac=fac.factura
		registro=str(recno())
		=flock("CCL") .or. FLOK("CCL")
		=flock("fac") .or. flok("fac")
		sele fac
		dele
		sele ccl
		scan for codcli=fac.codcli
			IF NUMERORE=FAC.FACTURA
				DELE
				sele fac
				dele
				EXIT
			ENDIF
		endscan
		unlo in fac
		UNLO IN CCL
	endif
ENDCASE
=MEN_LIN(BOTOM)
RETURN

*********************************************************************************
*-- Programa: ndeb.prg
*-- Fecha   : 02-17-92 00:07am
*-- Version : G. REINER
*-- Notas   : MENU DE GESTION DE NOTAS DE DEBITO
********************************************************************************
parameter nc_ren,nc_col
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
	do ideb.spr
case bar()=3
   respuesta='nCRE#8#40#Tipo de Nota de D‚bito a Listar#3#Tipo "\<A"#Tipo "\<B"#\<Todas'
   =DEFPOP()
   ON SELE POPU NCRE DO lDEBp
   ACTI POPU NCRE
   RELE POPU NCRE
CASE BAR()=4
	=OPVIA()
   respuesta='nCRE#8#40#Tipo de Nota de D‚bito a Listar#3#Tipo "\<A"#Tipo "\<B"#\<Todas'
   =DEFPOP()
   ON SELE POPU NCRE DO lDEBp with .t.
   ACTI POPU NCRE
   RELE POPU NCRE
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
RETURN MEN_LIN(BOTOM)

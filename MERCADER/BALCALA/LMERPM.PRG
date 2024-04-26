********************************************************************************
*-- Programa: LMERPP.PRG
*-- Fecha   : 06/13/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE MERCADERIAS POR RUBRO
******************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	=working()
	SELE RUB
	SET ORDER TO TAG CODRUB
	SELE mer
	SET RELA TO RUBRO INTO RUB
	tmp=GENTMP()
	=LMERO(TMP)
	=unwork()
	=win0()
	stor 1 TO VEZ
	stor nul TO casos,PAG
	=cabpan()
	acla=paip+padc('ARTICULO',len(mer.articulo))+paip+PADC('DETALLE',30)+paip+" FECHA  "+PAIP+PADC("USUARIO",10)+PAIP
	lns=REPL("=",LEN(acla))
	=TIT_LNS(1)
	stor nul TO RUBR
	stor '' TO XRUBR
	SCAN
		IF RUBR#MER.RUBRO
			IF VEZ=1
				VEZ=2
			ELSE
				? LEFT(LNS,LEN(LNS)-4)
				?? '\\\\'
				IF INKEY(NUL)=27
					EXIT
				ENDIF
			ENDIF
			XRUBR=RUB.RUBRO
			RUBR=MER.RUBRO
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			_WRAP=.T.
			? tt
			_WRAP=.F.
			DO LMERPP1
			=_lIn()
			SELE MER
		ENDIF
		IF ROW()=21
			? LEFT(LNS,LEN(LNS)-4)
			?? '\\\\'
			IF INKEY(NUL)=27
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			_WRAP=.T.
			? tt
			_WRAP=.F.
			DO LMERPP1
			=_LIN()
		ENDIF
		? paip
		?? articulo
		??paip
		?? merca
		=IMPUSE()
	ENDSCAN
	=fin_lns(2,casos)
	=RELEWIN("win")
	=reopmer()
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
PROCEDURE LMERPP1
	? 'RUBRO   :'+XRUBR
RETURN

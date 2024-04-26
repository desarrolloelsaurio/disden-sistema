********************************************************************************
*-- Programa: LSTOP.PRG
*-- Fecha   : 05/22/92 12:16pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE STOCKS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	acla=HAZ_ACLA()
	=working()
	TTU=TT
	lnS=repl("=",len(acla))
	tmp=GENTMP()
	SET ORDER TO TAG TODOS IN RUB
	sele mer
	SET RELA TO STR(RUBRO)+STR(SUBRUBRO) INTO RUB
	INDE ON RUB.PALISTAR+ARTICULO to (tmp) FOR EVAL(FISC) COMP
	=unwork()
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	GO TOP
	ELCORTE=MER.RUBRO
	ELRUBRO=LEFT(rub.PALISTAR,20)
	ELCORTE1=MER.SUBRUBRO
	ELsubRUBRO=RUB.RUBRO
	TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)
	TT=TT+CHR(13)+CHR(10)+"Subrubro:"+alltrim(elsubrubro)
	=TIT_LNS(1)
	SCAN
		if elcorte#mer.rubro .or. elcorte1#mer.subrubro
			=fin_lns(1,nul)
			clea
			pag=pag+1
			=cabpan()
			ELCORTE=MER.RUBRO
			ELRUBRO=LEFT(rub.PALISTAR,20)
			ELCORTE1=MER.SUBRUBRO
			ELsubRUBRO=RUB.RUBRO
			TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)
			TT=TT+CHR(13)+CHR(10)+"Subrubro:"+alltrim(elsubrubro)
			=TIT_LNS(1)
		endif
		IF ROW()>21
			IF !FIN_LNS(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LNS(2)
		ENDIF
		? PAIP
		=iif(variable[1],qout(left(ARTICULO,texto[1,2])+paip),'')
		=iif(variable[2],qout(left(mer.merca,texto[2,2])+paip),'')
		=iif(variable[3],qout(str(mer.STOCK,XACDIGI,2)+paip),'')
		=iif(variable[4],qout(str(MER.STOCKMIN,XACDIGI,2)+paip),'')
		=iif(variable[5],qout(str(MER.STOCKMAX,XACDIGI,2)+paip),'')
		=iif(variable[6],qout(str(MER.STOCKRES,XACDIGI,2)+paip),'')
		=iif(variable[7],qout(str(eval(RESTA),XACDIGI,2)+paip),'')
	ENDSCAN
	=FIN_LNS(2,CASOS)
	=RELEWIN("win")
	=reopmer()
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN

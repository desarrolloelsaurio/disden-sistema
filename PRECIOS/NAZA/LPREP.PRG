********************************************************************************
*-- Programa: LPREP
*-- Fecha   : 05-18-92 02:23pm
*-- Version : GOYO REINER
*-- Notas   : LISTA DE PRECIOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=working()
	TTU=TT
	store 1 to lacosa
	ACLA=HAZ_ACLA()
	lnS=repl("=",len(acla))
	tmp=GENTMP()
	sele mer
	set order to tag articulo
	IF UPPER(LEFT(FILART,3))='SUB'
		INDE ON &filart to (tmp) FOR EVAL(FISC) COMP
		lacosa=3
	ELSE
		INDE ON &filart to (tmp) uniq FOR EVAL(FISC) COMP
	ENDIF
	=unwork()
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	GO TOP
	ELCORTE=LEFT(MER.ARTICULO,3)
	=XSEEK(ELCORTE,'MIX','RUBCOD')
	ELRUBRO=MIX.TEXTO1
	TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)
	=TIT_LNS(1)
	SCAN
		if lacosa#3 .and. elcorte#left(mer.articulo,3)
			=fin_lns(1,nul)
			clea
			pag=pag+1
			=cabpan()
			ELCORTE=LEFT(MER.ARTICULO,3)
			=XSEEK(ELCORTE,'MIX','RUBCOD')
			ELRUBRO=MIX.TEXTO1
			TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)
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
		=iif(variable[1],qout(&FILART+paip),'')
		=iif(variable[2],qout(left(mer.merca,texto[2,2])+paip),'')
		=iif(variable[3],qout(str(mer.costoreaL,XACDIGI,2)+paip),'')
		=iif(variable[4],qout(str(mer.costo,XACDIGI,2)+paip),'')
		=iif(variable[5],qout(str(MER.precio1,XACDIGI,2)+paip),'')
		=iif(variable[6],qout(str(MER.precio2,XACDIGI,2)+paip),'')
		=iif(variable[7],qout(str(MER.precio3,XACDIGI,2)+paip),'')
		=iif(variable[8],qout(str(MER.precio4,XACDIGI,2)+paip),'')
		=iif(variable[9],qout(str(porcen(mer.costo,mer.precio1),xacdigi,2)+paip),'')
		=iif(variable[10],qout(str(porcen(Mer.costo,mer.precio2),xacdigi,2)+paip),'')
		=iif(variable[11],qout(str(porcen(mer.costo,mer.precio3),xacdigi,2)+paip),'')
		=iif(variable[12],qout(str(porcen(mer.costo,mer.precio4),xacdigi,2)+paip),'')
	ENDSCAN
	=FIN_LNS(2,CASOS)
	=RELEWIN("win")
	=REOPMER()
	=IAUD(FISC)
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN

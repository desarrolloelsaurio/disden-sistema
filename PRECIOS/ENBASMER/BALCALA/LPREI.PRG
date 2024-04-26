********************************************************************************
*-- Programa: lprei.prg
*-- Fecha   : 05-18-92 02:20pm
*-- Version : G. REINER
*-- Notas   : LISTA DE PRECIOS
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	=impresor()
	=working()
	TTU=TT
	store 1 to lacosa
	ACLA=HAZ_ACLA()
	lnS=repl("=",len(acla))
	SET ORDER TO CODRUB IN RUB
	SELE mer
	SET ORDER TO TAG ARTICULO
	SET RELA TO RUBRO INTO RUB
	=lmero(GENTMP())
	=unwork()
	stor nul TO casos
	GO TOP
	ELCORTE=MER.RUBRO
	=XSEEK(ELCORTE,'RUB','CODRUB')
	ELRUBRO=RUB.RUBRO
	TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	??? nlq
	=TIT_LNS(3)
	??? offnlq
	SCAN
		if elcorte#mer.rubro
			? LNS
			? LNS
			?
			ELCORTE=MER.RUBRO
			=XSEEK(ELCORTE,'RUB','CODRUB')
			ELRUBRO=RUB.RUBRO
			TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)
			?
			??? nlq
			?? "Rubro:"+alltrim(elrubro)
			=_LiN()
			??? offnlq
		endif
		IF _PLINENO>63
			=FIN_LNS(3,NUL)
			=cabpri1()
			??? nlq
			=TIT_LNS(4)
			??? offnlq
		ENDI
		? PAIP
		=iif(variable[1],qout(left(MER.ARTICULO,texto[1,2])+paip),'')
		=iif(variable[2],qout(left(mer.merca,texto[2,2])+paip),'')
		=iif(variable[3],qout(str(mer.costo,XACDIGI,2)+paip),'')
		=iif(variable[4],qout(str(MER.precio1,XACDIGI,2)+paip),'')
		=iif(variable[5],qout(str(MER.precio2,XACDIGI,2)+paip),'')
		=iif(variable[6],qout(str(MER.precio3,XACDIGI,2)+paip),'')
		=iif(variable[7],qout(str(MER.precio4,XACDIGI,2)+paip),'')
		=iif(variable[8],qout(str(porcen(mer.costo,mer.precio1),xacdigi,2)+paip),'')
		=iif(variable[9],qout(str(porcen(Mer.costo,mer.precio2),xacdigi,2)+paip),'')
		=iif(variable[10],qout(str(porcen(mer.costo,mer.precio3),xacdigi,2)+paip),'')
		=iif(variable[11],qout(str(porcen(mer.costo,mer.precio4),xacdigi,2)+paip),'')
	ENDSCAN
	=FIN_LNS(4,CASOS)
	ENDP
	=FINIMP()
	=iaud('LISTA DE PRECIOS')
	=REOPMER()
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN

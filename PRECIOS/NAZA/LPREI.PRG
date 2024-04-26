********************************************************************************
*-- Programa: lprei.prg
*-- Fecha   : 05-18-92 02:20pm
*-- Version : G. REINER
*-- Notas   : LISTA DE PRECIOS
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=working()
	TTU=TT
	STORE 1 TO LACOSA
	ACLA=HAZ_ACLA()
	LNS=REPL("=",LEN(ACLA))
	TMP=GENTMP()
	SELE MER
	SET ORDER TO TAG ARTICULO
	IF UPPER(LEFT(FILART,3))='SUB'
		INDE ON &filart to (tmp) FOR EVAL(FISC) COMP
		lacosa=3
	ELSE
		INDE ON &filart to (tmp) UNIQ FOR EVAL(FISC) COMP
	ENDIF
	=UNWORK()
	STOR NUL TO CASOS
	GO TOP
	ELCORTE=LEFT(MER.ARTICULO,3)
	=XSEEK(ELCORTE,'MIX','RUBCOD')
	ELRUBRO=MIX.TEXTO1
	TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)
	=cabpri()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_LNS(3)
	SCAN
		if lacosa#3 .and. elcorte#left(mer.articulo,3)
			=fin_lns(3,nul)
			ELCORTE=LEFT(MER.ARTICULO,3)
			=XSEEK(ELCORTE,'MIX','RUBCOD')
			ELRUBRO=MIX.TEXTO1
			TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)
			=cabpri1()
			=TIT_LNS(1)
		endif
		IF _PLINENO>63
			=FIN_LNS(3,NUL)
			=cabpri1()
			=TIT_LNS(4)
		ENDI
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
	=FIN_LNS(4,CASOS)
	ENDP
	=FINIMP()
	=iaud(FISC)
ELSE
	=iaudI()
ENDIF
=REOPMER()
RETURN MEN_LIN(BOTOM)

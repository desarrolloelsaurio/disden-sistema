**************************************************
*-- Programa: LIVACP.PRG
*-- Fecha   : 09/26/91
*-- Version : GOYO REINER
*-- Notas   : IVA COMPRAS POR PANTALLA
**************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=win0()
	pag=1
	=cabpan()
	nada=""
	STORE PAIP+"  FECHA |"+PADC("COMPROBANTE",17)+PAIP+ ;
	PADC("GRAVADO",XACDIGI)+PAIP+ ;
	PADC("IVA",XACDIGI)+PAIP+ ;
	PADC("EXENTO/N.G.",XACDIGI)+PAIP+ ;
	PADC("PERCEPCION",XACDIGI)+PAIP+ ;
	PADC("TOTAL",XACDIGI)+PAIP ;
	TO acla
	SELE far
	NADA=GENTMP()
	INDE ON FECHAEM TO (NADA) FOR EVAL(FISC) COMP
	STORE REPL("=",LEN(acla)) TO lns
	TT="Planilla de I.V.A. COMPRAS"+;
	CRLF+;
	TTU
	_WRAP=.T.
	_ALIGNMENT='LEFT'
	=tit_lns(1)
	STORE nul TO totbru,totiva,totng,totnet,TOTPER
	SELE far
	GO TOP
	SCAN
		IF ROW()=21
			? LEFT(lns,LEN(lns)-4)
			?? '\\\\'
			? lns
			? PAIP
			?? SPACE(8)
			?? PAIP
			?? SPACE(17)
			?? PAIP
			?? STR(totbru,XACDIGI,2)
			?? paip
			?? STR(TOTIVA,XACDIGI,2)
			?? PAIP
			?? STR(TOTNG,XACDIGI,2)
			?? PAIP
			?? STR(totPER,XACDIGI,2)
			?? PAIP
			?? STR(totnet,XACDIGI,2)
			?? PAIP
			? lns
			IF INKEY(nul )=27
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LNS(2)
		ENDIF
		? PAIP
		?? far.fechaem
		?? paip
		?? FAR.TIPO
		?? ' '
		?? FAR.FACTURA
		?? paip
		if far.tipo="NC"
			?? STR(0-FAR.MONTOBRU,XACDIGI,2)
			?? PAIP
			ELIVA=FAR.MONTOIVA+FAR.MONTOOT2+FAR.MONTOOT3
			?? STR(0-ELIVA,XACDIGI,2)
			STORE totbru-far.montobru TO totbru
			STORE TOTIVA-ELIVA TO TOTIVA
			?? PAIP
			?? STR(0-FAR.MONTOEXE,XACDIGI,2)
			?? PAIP
			STORE TOTNG-FAR.MONTOEXE TO TOTNG
			?? STR(0-FAR.MONTOPER,XACDIGI,2)
			?? PAIP
			STORE TOTPER-FAR.MONTOPER TO TOTPER
			?? STR(0-FAR.MONTONET,XACDIGI,2)
			?? PAIP
			STORE TOTNET-FAR.MONTONET TO TOTNET
		else
			?? STR(FAR.MONTOBRU,XACDIGI,2)
			?? PAIP
			ELIVA=FAR.MONTOIVA+FAR.MONTOOT2+FAR.MONTOOT3
			?? STR(ELIVA,XACDIGI,2)
			STORE totbru+far.montobru TO totbru
			STORE TOTIVA+ELIVA TO TOTIVA
			?? PAIP
			?? STR(FAR.MONTOEXE,XACDIGI,2)
			?? PAIP
			STORE TOTNG+FAR.MONTOEXE TO TOTNG
			?? STR(FAR.MONTOPER,XACDIGI,2)
			?? PAIP
			STORE TOTPER+FAR.MONTOPER TO TOTPER
			?? STR(FAR.MONTONET,XACDIGI,2)
			?? PAIP
			STORE TOTNET+FAR.MONTONET TO TOTNET
		endif
	ENDSCAN
	? lns
	? PAIP
	?? SPACE(8)
	?? PAIP
	?? SPACE(17)
	?? PAIP
	?? STR(totbru,XACDIGI,2)
	?? paip
	?? STR(TOTIVA,XACDIGI,2)
	?? PAIP
	?? STR(TOTNG,XACDIGI,2)
	?? PAIP
	?? STR(totPER,XACDIGI,2)
	?? PAIP
	?? STR(totnet,XACDIGI,2)
	?? PAIP
	? lns
	_WRAP=.F.
	=INKEY(nul,'HM')
	=RELEWIN("win")
	=IAUD(FISC)
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)

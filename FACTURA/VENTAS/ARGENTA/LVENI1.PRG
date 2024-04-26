********************************************************************************
*-- Programa: LVENI1.PRG
*-- Fecha   : 01/08/92
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE PLANILLA DE VENTAS, POR IMPRESORA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=impresor()
	SELE kar
	INDE ON articulo TO TMP UNIQ FOR &fisc
	COUNT TO cantar
	DIME TITULOS[cantar],TTLB[cantar],GTTLB[cantar],RTCL[cantar],TTLM[cantar],GTTLM[cantar]
	STOR 0 TO TTLB,GTTLB,TTLM,GTTLM,GT1,GT2
	mxrn=63
	STOR SPACE(8) TO RTCL
	T=1
	SCAN
		SELE mer
		IF(SEEK(RTRIM(kar.articulo)))
			TITULOS[T]=padc(alltrim(chrtran(mer.palpopup," ","")),22)
			RTCL[T]=rtrim(kar.articulo)
		ELSE
			TITULOS[T]=SpacE(22)
			RTCL[T]=rtrim(kar.articulo)
		ENDIF
		T=T+1
		SELE kar
	ENDSCAN
	STORE cantar*22+cantar+37 TO largo
	LNS=REPL("-",LARGO)
	STORE MIN(xacancho,xachoja) TO largoim
	@ 24,0 SAY IMPRIMIENDO COLO SCHE 19
	IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
		A=LEFT(sincosas(janname),8)+'.TXT'
		ACTI SCRE
		@ 24,0 SAY PADC("Imprimiendo Listado en Archivo "+ALLTRIM(A),80) COLO SCHE 19
		SET PRINTER TO (A)
		mxrn=iIF(largoim>80,60,50)
	ENDIF
	tt='Listado de la Planilla de Ventas'
	ON KEY DO abpr
	SET DEVICE TO PRINT
	SET CONSOLE OFF
	SET PRINTER ON
	_PEJECT="NONE"
	_PLENGTH=72
	_RMARGIN=80
	_PLINENO=0
	_PAGENO=1
	_PSCODE='{27}{64}{27}{67}{72}{18}'
	_RMARGIN=largoim
	_PLOFFSET=0
	_ALIGNMENT='LEFT'
	_PADVANCE="LINEFEEDS"
	_PCOPIES=1
	PRINTJOB
	DO CABPRI1
	IF largo>largoim
		_rmargin=iIF(largoim>80,233,132)
		??? CHR(15)
	ENDIF
	do tlveni1
	SELE kar
	INDE ON DTOS(fechaop)+articulo TO TMP FOR &fisc
	GO TOP
	artact=""
	fecact=kar.fechaop
	STOR 0 TO TTLB,TTLM
	PNTR=1
	SCAN
		IF _PLINENO>mxrn
			DO PLVENI13
			? "|SUBTOTAL|"
			do plveni12
			EJECT PAGE
			_RMARGIN=80
			_WRAP=.F.
			?
			DO CABPRI1
			IF largo>largoim
				_rmargin=iIF(largoim>80,233,132)
				??? CHR(15)
			ENDIF
			do tlveni1
		ENDI
		IF fecact#kar.fechaop
			STOR 0 TO T1,T2
			? paip
			?? fecact
			?? paip
			FOR A=1 TO cantar
				?? STR(TTLB[A],4)
				?? paip
				?? STR(TTLM[A],8,2)
				?? paip
				?? IIF(!EMPTY(TTLB[A]),STR(TTLM[A]/TTLB[A],8,2),SPACE(8))
				?? paip
				GTTLB[A]=GTTLB[A]+TTLB[A]
				GTTLM[A]=GTTLM[A]+TTLM[A]
				T1=T1+TTLB[A]
				T2=T2+TTLM[A]
			next
			GT1=GT1+T1
			GT2=GT2+T2
			?? str(T1,12)+paip+str(T2,14,2)+paip+IIF(!EMPTY(T1),STR(T2/T1,8,2),SPACE(8))+paip
			? paip+REPL("-",8)+paip
			FOR A=1 TO cantar
				?? REPL("-",22)+paip
			next
			?? REPL("-",12)+paip+REPL("-",14)+paip+REPL("-",8)+paip
			STOR 0 TO TTLB,TTLM
			STOR kar.fechaop TO fecact
		ENDIF
		IF artact#RTRIM(kar.articulo)
			FOR A=1 TO cantar
				IF RTCL[A]=RTRIM(kar.articulo)
					PNTR=A
					EXIT
				ENDIF
			next
			artact=RTRIM(kar.articulo)
		ENDIF
		IF cosa=1
			TTLB[pntr]=TTLB[pntr]+kar.salida
			TTLM[pntr]=TTLM[pntr]+kar.salida*kar.unitario
			*******  ELSE  ** VERIFICAR
			*******     COSA # 1 ???
		ENDIF
	ENDSCAN
	STOR 0 TO T1,T2
	? paip
	?? fecact
	?? paip
	FOR A=1 TO cantar
		?? STR(TTLB[A],4)
		?? paip
		?? STR(TTLM[A],8,2)
		?? paip
		?? IIF(!EMPTY(TTLB[A]),STR(TTLM[A]/TTLB[A],8,2),SPACE(8))
		?? paip
		GTTLB[A]=GTTLB[A]+TTLB[A]
		GTTLM[A]=GTTLM[A]+TTLM[A]
		T1=T1+TTLB[A]
		T2=T2+TTLM[A]
	next
	GT1=GT1+T1
	GT2=GT2+T2
	?? str(T1,12)+paip+str(T2,14,2)+paip+IIF(!EMPTY(T1),STR(T2/T1,8,2),SPACE(8))+paip
	DO TLVENI13
	? "|TOTALES |"
	do Tlveni12
	_WRAP=.F.
	EJECT PAGE
	?
	ENDP
	DO FINIMP
	USE
	=OPKAR()
	DO IAUD WITH 'LISTADO de Planilla de VENTA por IMPRESORA'
ELSE
	DO IAUD WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
procedure tlveni1
	? tt STYLE 'u'
	? ALLTRIM(janname) STYLE 'u'
	?
	DO TLVENI13
	? "|  FECHA |"
	FOR A=1 TO cantar
		?? TITULOS[A]+paip
	next
	?? "   TOTAL    |    MONTO     |PROMEDIO|"
	? paip+SPACE(8)+paip
	FOR A=1 TO cantar
		?? REPL("-",22)+paip
	next
	?? "    DE      |    TOTAL     |  POR   |"
	? paip+SPACE(8)+paip
	FOR A=1 TO cantar
		?? "CANT| PRECIO |PROMEDIO|"
	next
	?? "   BULTOS   |"+SPACE(14)+"|RENGLON |"
	DO TLVENI13
return
procedure tlveni12
	FOR A=1 TO cantar
		?? STR(GTTLB[A],4)+paip+STR(GTTLM[A],8,2)+paip
		?? IIF(!EMPTY(GTTLB[A]),STR(GTTLM[A]/GTTLB[A],8,2),SPACE(8))+paip
	next
	?? str(GT1,12)+paip+str(GT2,14,2)+paip
	?? IIF(!EMPTY(GT1),STR(GT2/GT1,8,2),SPACE(8))+paip
	DO TLVENI13
return
PROCEDURE TLVENI13
	? paip+REPL("=",8)+paip
	FOR A=1 TO cantar
		?? REPL("=",22)+paip
	next
	?? REPL("=",12)+paip+REPL("=",14)+paip+REPL("=",8)+paip
RETURN

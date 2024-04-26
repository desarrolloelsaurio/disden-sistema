********************************************************************************
*-- Programa: LRESI1.PRG
*-- Fecha   : 01/21/92
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION PLANILLA RESUMEN DE UNA REMESA DE UN PROV., POR IMPRESORA
********************************************************************************
FISC1="REM.REMESA=0 .AND. REM.PROVEEDOR='123       '"
****************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=impresor()
	SELE rem
	*inde on articulo TO TMP UNIQ FOR &fisc
	COUNT for &fisc1 TO cantar
	DIME TITULOS[cantar],TTLB[cantar],GTTLB[cantar],RTCL[cantar],TTLM[cantar],GTTLM[cantar],TMPRM[cantar]
	STOR 0 TO TTLB,GTTLB,TTLM,GTTLM,GT1,GT2,TMPRM
	mxrn=63
	STOR SPACE(8) TO RTCL
	T=1
	SCAN FOR &FISC1
		SELE mer
		TITULOS[T]=IIF(SEEK(RTRIM(rem.merca)),padc(alltrim(chrtran(mer.palpopup," ","")),22),space(22))
		RTCL[T]=rem.merca
		TMPRM[T]=rem.bultos
		T=T+1
		SELE rem
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
	tt='Listado Resumen de Venta de una Remesa, de un Proveedor'
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
	do tlresi1
	SELE kar
	inde on DTOS(fechaop)+articulo TO TMP FOR &fisc
	GO TOP
	artact=""
	fecact=kar.fechaop
	STOR 0 TO TTLB,TTLM
	PNTR=1
	SCAN
		IF _PLINENO>mxrn
			DO PLRESI13
			? "|SUBTOTAL|"
			do plresi12
			EJECT PAGE
			_RMARGIN=80
			_WRAP=.F.
			?
			DO CABPRI1
			IF largo>largoim
				_rmargin=iIF(largoim>80,233,132)
				??? CHR(15)
			ENDIF
			do tlresi1
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
			DO TLRESI14
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
			******* ELSE
			*******     COSA#1 ???
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
	DO TLRESI13
	? "|TOTALES |"
	do Tlresi12
	?
	DO TLRESI13
	? "|REMESA  |"
	FOR A=1 TO cantar
		?? STR(TMPRM[A],4)+paip+Space(8)+paip+SPACE(8)+paip
	next
	?? space(12)+paip+space(14)+paip+SPACE(8)+paip
	DO TLRESI14
	? "|RESTO   |"
	FOR A=1 TO cantar
		?? STR(TMPRM[A]-GTTLB[A],4)+paip+PADR("("+STR((1-GTTLB[A]/TMPRM[A])*100,3)+" %)",8)+paip+SPACE(8)+paip
	next
	?? space(12)+paip+space(14)+paip+SPACE(8)+paip
	DO TLRESI13
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
procedure tlresi1
	? tt STYLE 'u'
	? ALLTRIM(janname) STYLE 'u'
	?
	DO TLRESI13
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
	DO TLRESI13
return
procedure tlresi12
	FOR A=1 TO cantar
		?? STR(GTTLB[A],4)+paip+STR(GTTLM[A],8,2)+paip
		?? IIF(!EMPTY(GTTLB[A]),STR(GTTLM[A]/GTTLB[A],8,2),SPACE(8))+paip
	next
	?? str(GT1,12)+paip+str(GT2,14,2)+paip
	?? IIF(!EMPTY(GT1),STR(GT2/GT1,8,2),SPACE(8))+paip
	DO TLRESI13
return
PROCEDURE TLRESI13
	? paip+REPL("=",8)+paip
	FOR A=1 TO cantar
		?? REPL("=",22)+paip
	next
	?? REPL("=",12)+paip+REPL("=",14)+paip+REPL("=",8)+paip
RETURN
PROCEDURE TLRESI14
	? paip+REPL("-",8)+paip
	FOR A=1 TO cantar
		?? REPL("-",22)+paip
	next
	?? REPL("-",12)+paip+REPL("-",14)+paip+REPL("-",8)+paip
RETURN

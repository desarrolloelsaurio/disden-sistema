**************************************************
*-- Programa: LREMIXF.PRG
*-- Fecha   : 08-03-92 07:21pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE REMITO DE FABRICACION
*************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	ESBIF=!ISDIGIT(RIGHT(ALLTRIM(REM.REMITO),1))
	ESBIF=IIF(esbif,.T.,LEFT(REM.REMITO,1)="R")
	STORE .F. TO ESBIF1
	STORE 1 TO PAAM
	ACLA=''
	=CABPRI()
	_RMARGIN=255
	_LMARGIN=NUL
	_PCOPIES=1
	IF XSEEK(REM.NUMOT,"COR","NUMERO")
		=XSEEK(REM.NUMOT,"CO1","NUMERO")
		PRINTJOB
		?
		IF ESBIF
			STORE (LEFT(REM.REMITO,1)="R") TO M.REPRO
			?
			IF M.REPRO
				?? CHR(14)
				?? PADL("REMITO DE REPROCESO",38)
			ELSE
				?? CHR(14)
				?? PADL("REMITO N╖ "+ALLTRIM(REM.REMITO),38)
			ENDIF
			?
			?
			IF M.REPRO
				?? CHR(14)
				?? PADL("N╖ "+ALLTRIM(REM.REMITO),38)
			ELSE
				?? CHR(14)
				?? PADL("BIF DE REMITO N╖ "+SINULT(ALLTRIM(REM.REMITO)),38)
			ENDIF
			?
		ELSE
			?
			?
		ENDIF
		? REM.fechaOP AT 60
		?
		?
		?
		?
		?
		=XSEEK(REM.TALLER,'PER','TALCOD')
		? PER.CLIENTE AT 15
		? PER.domicilio at 15
		? PER.localidad  AT 15
		IF PER.CONDIVA#0
			? SAYMIX(PER.CONDIVA,"IVACOD") AT 15
			?? PER.NROIVA AT 55
		ELSE
			?
		ENDIF
		?
		?
		?
		NADA=COR.ARTICULO+'/'+CO1.COLOR
		=XSEEK(NADA,"MER","ARTICULO")
		?
		?? CHR(14)
		?? PADL(ALLTRIM(COR.ARTICULO),38)
		?
		?? chr(14)
		?? PADL(ALLTRIM(MER.MERCA),38)
		?
		?? chr(14)
		?? PADL('ORDEN DE '+KORTE+' N╖ '+ALLTRIM(STR(COR.NUMERO)),38)
		?
		_rmargin=255
		_wrap=.f.
		*
		? REPL("-",80)
		?
		?? CHR(15)
		?? "TELA          :"
		=XSEEK(mer.tela,'TEL','TELCOD')
		?? tel.tela
		?? "RUBRO         :" AT 71
		=XSEEK(mer.rubro,'MIX','RUBCOD')
		?? MIX.TEXTO1
		? "SEXO          :"
		?? qsex(mer.sexo)
		?? PADR(UPPER(mader),LEN("MATERIAL      "))+':' at 70
		=XSEEK(mer.material,'MIX','MATCOD')
		?? MIX.TEXTO1
		? REPL("-",132)
		? 'PROCESO:'
		=XSEEK(LEFT(REM.REMITO,14),'FAX','REMITO')
		=XSEEK(FAX.PRC,'PRC','PRCCOD')
		?? PRC.PROCFAB
		RTC=COR.ARTICULO+'/'+CO1.COLOR+'  '+STR(FAX.POSIC)
		=XSEEK(RTC,'EST','HOJARUT')
		IF !ESBIF
			? '        '
			?? CHRTRAN(EST.DETALLE,CHR(13)+CHR(10),"-")
		ENDIF
		SELE REX
		IF SEEK(REM.REMITO)
			? REPL("-",132)
			? "ENVIOS:"
			ARCHIVO=GENTMP()
			COPY TO (ARCHIVO) WHILE REMITO=REM.REMITO
			SELE 0
			USE (ARCHIVO) ALIAS TMP
			INDE ON TELCOD TO (GENTMP()) COMP
			vez=1
			?
			SCAN
				IF TMP.TIPO='A'
					?? TMP.AVICODPRO
					=XSEEK(TMP.AVICODPRO,'AVIS','AVICODPRO')
					?? PAIP
					?? left(AVIS.AVIO,20)
					UNN=SAYMIX(AVIS.UNIDAD,"MDDCOD")
				ELSE
					?? TMP.TELCODPRO
					=XSEEK(TMP.TELCODPRO,'TELS','TELCODPRO')
					?? PAIP
					?? left(TELS.TELA,20)
					UNN=SAYMIX(TELS.UNIDAD,"MDDCOD")
				ENDIF
				?? PAIP
				?? STR(TMP.CANTIDAD,10,2)
				?? ' '
				?? UNN
				if vez=1
					?? ' - '
					vez=2
				else
					vez=1
					?
				endif
			ENDSCAN
			SELE TMP
			USE
		ENDIF
		?
		?? CHR(18)
		IF !ESBIF
			? REPL("-",80)
			?"ESTADO DEL ENVIO:"
			?? EST.CONDICION
			? REPL("-",80)
			SELE CO1
			IF FAX.POSIC<900
				? 'DISCRIMINACION DEL ENVIO:'
				RELE KSA
				DIME KSA[3]
				PUNTERO=1
				MXTAL=XATALMAX+1
				********* EMPIEZA EL TEMA DE LOS TALLES
				SCAN WHILE NUMERO=COR.NUMERO
					PTR=ASCAN(KSA,CO1.COLOR)
					IF !EMPTY(PTR)
						PTR=PTR/MXTAL
						KSA[PTR,TALLE]=KSA[PTR,TALLE]+CANTCOR
					ELSE
						DIME KSA[PUNTERO,MXTAL]
						FOR A=1 TO XATALMAX
							KSA[PUNTERO,A]=NUL
						NEXT
						KSA[PUNTERO,MXTAL]=CO1.COLOR
						KSA[PUNTERO,TALLE]=KSA[PUNTERO,TALLE]+CANTCOR
						PUNTERO=PUNTERO+1
					ENDIF
				ENDSCAN
				IF PUNTERO#1
					*****************************************************
					*** VERIFICAR CUANTOS TALLES SE IMPRIMEN REALMENTE !!
					*****************************************************
					** TALLE MENOR
					STORE 1 TO MENTAL
					FOR TA=1 TO MXTAL
						IF !EMPTY(KSA[1,TA])
							MENTAL=TA
							EXIT
						ENDIF
					NEXT
					** TALLE MAYOR
					STORE XATALMAX TO MAYTAL
					FOR TA=MAYTAL TO MENTAL STEP -1
						IF !EMPTY(KSA[1,TA])
							MAYTAL=TA
							EXIT
						ENDIF
					NEXT
					**********
					LOSTALL=MAYTAL-MENTAL+2
					LRGR=25+7*LOSTALL
					? IIF(LRGR>79,CHR(15),CHR(18))
					?? REPL("=",LRGR)
					? PAIP
					?? PADC("TALLES",23)
					?? PAIP
					FOR A=MENTAL TO MAYTAL
						?? PADC(ALLTRIM(STR(A)),6)
						?? PAIP
					NEXT
					?? " TOTAL|"
					? REPL("=",LRGR)
					DIME TT[XATALMAX]
					STORE NUL TO TT
					FOR A=1 TO ALEN(KSA,1)
						STORE NUL TO TOTAL
						FOR B=MENTAL TO MAYTAL
							TOTAL=TOTAL+KSA[A,B]
							TT[B]=TT[B]+KSA[A,B]
						NEXT
					NEXT
					? PAIP
					?? PADR("TOTAL",23)
					?? PAIP
					STORE 0 TO TOTAL
					FOR A=MENTAL TO MAYTAL
						?? STR(TT[A],6)
						?? PAIP
						TOTAL=TOTAL+TT[A]
					NEXT
					?? STR(TOTAL,6)
					?? PAIP
				ENDIF
			ENDIF
		ENDIF
		?
		?"        здддддддддддддддддддддддддддддддддбддддддддддддддддддддддддддддддддд©"
		?"        Ё         ENTRADA A TALLER        Ё        SALIDA DE TALLER         Ё"
		?"        цдддддддддддддддддддддддддддддддддеддддддддддддддддддддддддддддддддд╢"
		?"        ЁFECHA         :                  ЁFECHA         :                  Ё"
		IF ESBIF
			IF XSEEK(REM.REMITO,"FAX","REMTRU")
				STORE !EMPTY(FAX.EEC) TO ESBIF1
			ENDIF
		ENDIF
		IF ESBIF1
			?? "                        " AT NUL
			?? FAX.EF
		ENDIF

		?"        ЁHORA          :                  ЁHORA          :                  Ё"
		?"        ЁTALLER/SECCION:                  ЁTALLER/SECCION:                  Ё"
		?"        цдддддддддддддддбдддддддддддддддддедддддддддддддддбддддддддддддддддд╢"
		?"        Ё    ENTREGA    Ё     RECIBE      Ё    ENTREGA    Ё     RECIBE      Ё"
		?"здддддддедддддддддддддддедддддддддддддддддедддддддддддддддеддддддддддддддддд╢"
		?"ЁCANTID:Ё               Ё                 Ё               Ё                 Ё"

		IF ESBIF1
			??"        " AT 0
			?? STR(FAX.EEC,10)
			?? SPACE(5)
			?? STR(FAX.ESC,10)
			?? SPACE(5)
		ENDIF
		?"цдддддддедддддддддддддддедддддддддддддддддедддддддддддддддеддддддддддддддддд╢"
		?"ЁFIRMA :Ё               Ё                 Ё               Ё                 Ё"
		?"ЁACLARA:Ё               Ё                 Ё               Ё                 Ё"
		IF ESBIF1 .AND. ;
			!REPRO
			?? "         " AT NUL
			?? PADL(FAX.EER,15)

			?? PADL(FAX.ESR,15)
		ENDIF
		?"юдддддддадддддддддддддддадддддддддддддддддадддддддддддддддаддддддддддддддддды"
		?
		? "FECHA ESTIMADA DE DEVOLUCION"
		ENDP
		EJECT PAGE
		=FINIMP()
		=IAUD(ALLTRIM(STR(REM.NUMOT)))
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

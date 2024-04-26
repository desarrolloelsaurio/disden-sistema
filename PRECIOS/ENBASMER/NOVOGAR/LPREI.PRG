*********************************************************************
*-- Programa: LPREI.prg
*-- Fecha   : 09/03/92 16:30
*-- Version : G. REINER
*-- Notas   : lista de precios por impresora por rubro-subrubro-marca
*** VERSION NOVOGAR
*-- Modificaci¢n GOYO 05-29-92 02:38pm
*-- Modificaci¢n GOYO 07-02-92 12:14pm
*-- Modificaci¢n GOYO 11-10-92 (eject page c/nuevo rubro)
********************************************************************************
PARAMETER EJECTA
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=IMPRESOR()

	#DEFINE NUL    0                              && NUL
	#DEFINE BOTOM  "  "+repl("°",78)              && BOTOM
	#DEFINE IMPRIMIENDO  PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'°') && IMPRIMIENDO
	#DEFINE CONTIX       ' - Continuaci¢n'
    STORE "" TO M.XA
	TTU=TT
	STORE 1 TO LACOSA
	ACLA=HAZ_ACLA()
	IF VARIABLE[CANT_MAX]
		lalista='precio'+alltrim(str(sobrecual))
	ENDIF
	LNS=REPL("=",LEN(ACLA))
	STORE "" TO ELCORTE,ELRUBRO,ELSUBRUBRO
	=LPRE0()
	STOR NUL TO CASOS
	=MEN_LIN(IMPRIMIENDO)
	=CABPRI(15)
	IF TYPE("PORBASE")#"U" .AND. PORBASE
		SELE MER
		COPY TO (PATH+"\"+XA)
		L_AUDI="BASE: "+ALLTRIM(XA)+" / "+ALLTRIM(FISC)
		RELE XA
	ELSE
	_PCOPIES=1
	GO TOP
	ELRUBRO=LEFT(PALISTAR,20)
	ELSUBRUBRO=RIGHT(PALISTAR,20)
	LAMARCA=MER.TEXTO1
	PRINT
	=CABPRI1()
	?
	_WRAP=.T.
	_ALIGNMENT='CENTER'
	? TT
	=IIF(!EMPTY(XANULIS),QOUT(ALLTRIM(XANULIS)),"")
	? JANNAME
	_WRAP=.F.
	?
	?
	=TLPREIP(1)
	??? CHR(15)
	=_LIN()
	SCAN
		IF _PLINENO>66
			? LNS
			EJECT PAGE
			=CABPRI1()
			?
			_WRAP=.T.
			? TT+' Continuaci¢n'
			=IIF(!EMPTY(XANULIS),QOUT(ALLTRIM(XANULIS)),"")
			? JANNAME
			_WRAP=.F.
			?
			?
			IF ELRUBRO#LEFT(PALISTAR,20)
				ELRUBRO=LEFT(PALISTAR,20)
				ELSUBRUBRO=RIGHT(PALISTAR,20)
				LAMARCA=MER.TEXTO1
				=TLPREIP(1)
			ELSE
				IF ELSUBRUBRO#RIGHT(PALISTAR,20)
					? LNS
					=TLSRUB(1)
					? LNS
					ELSUBRUBRO=RIGHT(PALISTAR,20)
					LAMARCA=MER.TEXTO1
				ELSE
					IF LAMARCA#MER.TEXTO1
						LAMARCA=MER.TEXTO1
					ELSE
						=TLPREIP(2)
					ENDIF
				ENDIF
			ENDIF
			??? CHR(15)
			=_LIN()
		ELSE
			IF ELRUBRO#LEFT(PALISTAR,20)
				? LNS
				IF _PLINENO>60 .OR. EJECTA
					? LNS
					EJECT PAGE
					=CABPRI1()
					?
					_WRAP=.T.
					? TT+' Continuaci¢n'
					_WRAP=.F.
					?
					?
				ELSE
					?
					?
				ENDIF
				ELRUBRO=LEFT(PALISTAR,20)
				ELSUBRUBRO=RIGHT(PALISTAR,20)
				LAMARCA=MER.TEXTO1
				=TLPREIP(1)
				??? CHR(15)
				? LNS
				? ACLA
				? LNS
			ELSE
				IF ELSUBRUBRO#RIGHT(PALISTAR,20)
					? LNS
					ELSUBRUBRO=RIGHT(PALISTAR,20)
					IF _PLINENO>60
						? LNS
						EJECT PAGE
						=CABPRI1()
						?
						_WRAP=.T.
						? TT+' Continuaci¢n'
						_WRAP=.F.
						?
						?
					ENDIF
					=TLSRUB(1)
					??? CHR(15)
					? LNS
					LAMARCA=MER.TEXTO1
				ELSE
					IF LAMARCA#MER.TEXTO1
						? LNS
						LAMARCA=MER.TEXTO1
					ENDIF
				ENDIF
			ENDIF
		ENDIF
		=LPRE1()
	ENDSCAN
	? LNS
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD(FISC)
	ENDIF
	=REOPMER()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION TLPREIP
	PARAMETER COSA
	PRIVATE COSA
	?
	??? CHR(18)
	??? NLQ
	?? "RUBRO   :"
	?? ELRUBRO
	? "SUBRUBRO:"
	?? ELSUBRUBRO
	?? IIF(COSA=2,contix,'')
	??? OFFNLQ
RETURN .T.

FUNCTION TLSRUB
	PARAMETER COSA
	PRIVATE COSA
	?
	??? CHR(18)
	??? NLQ
	?? "SUBRUBRO:"
	?? ELSUBRUBRO
	??? OFFNLQ
RETURN .T.

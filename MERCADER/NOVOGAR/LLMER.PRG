********************************************************************************
*-- Programa: llmer.prg
*-- Fecha   : 11-02-91 04:13pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE borrado de mercader�as
*-- Modificaci�n GOYO 07-23-92 01:11am marca -> empresa
********************************************************************************
DIJO=BAR()
L_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	IF L_DIJO='Un Producto'
		SELE MER
		SET DELE OFF
		SET FILTER TO DELETED()
		GOTO TOP
		IF !EOF()
			TMPLLMER=GENTMP()
			TMPCDX=GENTMP()
			STOR MERPOP TO LL_ANT
			STOR MERPOP1 TO LL_ANT1
			STOR .T. TO MERPOP,MERPOP1
			SELE MER
			=FLOCK("MER") .OR. FLOK("MER")
			SET ORDER TO
			SORT ON MERCA FIELD MERCA,ARTICULO ;
				FOR DELETED() TO (TMPLLMER)
				SELE MER
				USE
				USE (TMPLLMER) ALIAS MER IN 14 EXCL
				INDEX ON MERCA TAG MERCA OF (TMPCDX)
				INDEX ON ARTICULO TAG ARTICULO OF (TMPCDX)
				=DEFPOGRL(MERPOPR,MERPOPC,"MERPOP","MER.MERCA",40,"Elija la mercader�a")
				STOR NUL TO RESPUESTA
				IF !EMPTY(elimer(" a Recuperar",-1,1))
					M.ELIGIO=MER.ARTICULO
					=REOPMER()
					SET DELE OFF
					=XSEEK(M.ELIGIO,'MER','ARTICULO')
					DO LLMER1
				ENDIF
				STOR LL_ANT TO MERPOP
				STOR LL_ANT1 TO MERPOP1
			ENDIF
			SET DELE ON
			=REOPMER()
			IF FILE(TMPCDX)
				ERASE (TMPCDX)
			ENDIF
		ELSE
			STORE "" TO TT
			FISC=QWMER(DIJO)
			IF FISC#".F."
				IF CONFIRMA("RECUPERAR "+ALLTRIM(TT),.T.,10,0)
					SELE MER
					=FLOCK("MER") .OR. FLOK("MER")
					=DOTALK()
					SET DELE OFF
					SET ORDER TO
					RECA FOR &FISC
					=UNTALK()
					=IAUD(ALLTRIM(TT))
					SET DELE ON
					SET ORDER TO TAG ARTICULO
				ENDIF
			ENDIF
		ENDIF
		UNLO ALL
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)

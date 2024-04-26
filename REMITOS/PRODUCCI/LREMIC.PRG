**************************************************
*-- Programa: LREMIC.PRG
*-- Fecha   : 08-03-92 07:21pm
*-- Version : G. REINER
*-- Notas   : IMPRESION DE REMITO DE FABRICACION
*************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
FUNCTION LREMIC
PARA NUMEREM, SOLICITUD
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	IF SOLICITUD .OR. XSEEK(NUMEREM,"REM","REMITO")
	   IF REM.TALANT="NOAUTOR   "
	      =CARTEL("EL REMITO "+NUMEREM+" NO ESTA AUTORIZADO",;
	      "POR EL TIPO DE REMITO, DEBE SER AUTORIZADO POR LA SECCION COMPRAS",;
	      "AUTORICELO Y LUEGO REINTENTE",;
	      ENTERCON)
	      =IAUD("REM. "+NUMEREM+" NO AUT")
	      RETURN MEN_LIN(BOTOM)
	   ENDIF
        IF getenv("EQUIPO")="00801B00B440"
          =IMPRESOR("lpt2")
          rele lpt1,lpt2,lpt3
          publ lpt1,lpt2,lpt3
          store .f. to lpt1,lpt3
          store .t. to lpt2
        ELSE
           =IMPRESOR()
        ENDIF
        ACLA=''
		=CABPRI()
		_RMARGIN=255
		_LMARGIN=NUL
		_PCOPIES=IIF(SOLICITUD,3,1)
		PRINTJOB
		IF SOLICITUD
			=XSEEK(M.NUMREQ,"REQ","NUMERO")
**			=XSEEK(M.NUMREQ,"REQX","NUMERO")
		ELSE
			IF !EMPTY(REM.NUMOT)
				=XSEEK(REM.NUMOT,"COR","NUMERO")
				=XSEEK(REM.NUMOT,"CO1","NUMERO")
			ELSE
				=XSEEK(REM.NUMREQ,"REQ","NUMERO")
**				=XSEEK(REM.NUMREQ,"REQX","NUMERO")
			ENDIF
		ENDIF
		?
		?
		?
		?
		? IIF(SOLICITUD, "", REM.fechaOP) AT 50
		?
		?
		?
		?
		=XSEEK( IIF(SOLICITUD, M.TALLER, REM.TALLER) ,'PER','PROCOD')
		IF SOLICITUD
			=CABPRI1()
		ELSE
		    ?
			? PER.CLIENTE AT 15
			? PER.domicilio at 15
			? SAYMIX(PER.localidad,"CIUCOD")  AT 15
			? SAYMIX(PER.CONDIVA,"IVACOD") AT 15
			?? PER.NROIVA AT 55
		ENDIF
		?
		?
		IF SOLICITUD
			?
			?? chr(14)
			??"SOLICITUD DE DEVOLUCION A PROVEEDOR"
			?
			? 'ORDEN DE REQ.  N§'    AT 10
			??ALLTRIM(STR(M.NUMREQ)) AT 30
			? 'PROVEEDOR'  AT 10
			?? PER.CLIENTE AT 30
			? 'NOTA DE PEDIDO N§ ' AT 10
			??ALLTRIM(REQ.PEDIDO)  AT 30
		ELSE
			IF !EMPTY(REM.NUMOT)
				=XSEEK(COR.ARTICULO,"MER","ARTICULO", .T.)
				?"ENVIO A TALLER" AT 35
				?
				?
				?? CHR(14)
				?? PADL(ALLTRIM(COR.ARTICULO),38)
				?
				?? chr(14)
				?? PADL(ALLTRIM(MER.MERCA),38)
				?
				?? chr(14)
				?? PADL('ORDEN DE CORTE  N§ '+ALLTRIM(STR(COR.NUMERO)),38)
			ELSE
			IF ISDATE(LEFT(REM.TALANT,8),.T.)
				?"ENVIO A TALLER P/EXTERNA" AT 35
			ELSE
				?"DEVOLUCION A PROVEEDOR" AT 35
		    ENDIF
				?
				?
				?? CHR(14)
				?? PADL('ORDEN DE REQ.  N§ '+ALLTRIM(STR(REM.NUMREQ)),38)
				?
				?? chr(14)
				?? PADL('TEMPORADA '+REQ.TEMPORADA,38)
				?
				?? chr(14)
				?? PADL('PEDIDO  N§ '+ALLTRIM(REQ.PEDIDO),38)
			ENDIF
		ENDIF
		?
		_rmargin=255
		_wrap=.f.
		*
		? REPL("-",80)
		?
		IF SOLICITUD
			SELE TMP
		ELSE
			SELE REX
			ARCHIVO=GENTMP()
			IF SEEK(REM.REMITO)
				=FLOCK() .AND. FLOK()
				COPY TO (ARCHIVO) WHILE REMITO=REM.REMITO
				UNLO IN REX
			ENDIF
			SELE 0
			USE (ARCHIVO) ALIAS TMP
		ENDIF
		GO TOP
		?"  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿"
		?"  ³       CODIGO       ³     "
		DO CASE
		CASE !EMPTY(TMP.AVICODPRO)
			INDE ON AVICODPRO TAG AVICODPRO
			??PADC("AV¡O",10)
		CASE !EMPTY(TMP.TELCODPRO)
			INDE ON TELCODPRO TAG TELCODPRO
			??PADC("TELA",10)
		CASE !EMPTY(TMP.COMCODPRO)
			INDE ON COMCODPRO TAG COMCODPRO
			??PADC("COMPRA",10)
		CASE !EMPTY(TMP.OTRCODPRO)
			INDE ON OTRCODPRO TAG OTRCODPRO
			??PADC("OTRO PROD.",10)
		ENDCASE
		??"     ³ CANTIDAD ³  UNIDAD  ³ VERIFICO ³"
		?"  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄ´"
		?
		SCAN
			??"  ³"
			DO CASE
			CASE !EMPTY(TMP.AVICODPRO)
				?? TMP.AVICODPRO
				=XSEEK(TMP.AVICODPRO,'AVIS','AVICODPRO')
				??"³"
				?? left(AVIS.AVIO,20)
				UNN=SAYMIX(AVIS.UNIDAD,"MDDCOD")
			CASE !EMPTY(TMP.TELCODPRO)
				?? TMP.TELCODPRO
				=XSEEK(TMP.TELCODPRO,'TELS','TELCODPRO')
				??"³"
				?? left(TELS.TELA,20)
				UNN=SAYMIX(TELS.UNIDAD,"MDDCOD")
			CASE !EMPTY(TMP.COMCODPRO)
				?? TMP.COMCODPRO
				=XSEEK(TMP.COMCODPRO,'COMS','COMCODPRO')
				??"³"
				?? left(COMS.COMPRA,20)
				UNN=SAYMIX(COMS.UNIDAD,"MDDCOD")
			CASE !EMPTY(TMP.OTRCODPRO)
				?? TMP.OTRCODPRO
				=XSEEK(TMP.OTRCODPRO,'OTRS','OTRCODPRO')
				??"³"
				?? left(OTRS.OTRO,20)
				UNN=SAYMIX(OTRS.UNIDAD,"MDDCOD")
			ENDCASE
			??"³"
			?? STR(TMP.CANTIDAD,10,2)
			??"³"
			?? LEFT(UNN, 10)
			??"³"
			??SPACE(10)
			??"³"
			?
		ENDSCAN
		??"  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÙ"
		?
		?? CHR(18)
		?
		?
		?"            ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
		?"            ³    FECHA      ³      FIRMA      ³      ACLARACION      ³"
		?"  ÚÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
		?"  ³ PREPARO ³               ³                 ³                      ³"
		?"  ÃÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
		?"  ³ ENTREGO ³               ³                 ³                      ³"
		?"  ÃÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
		?"  ³ RECIBIO ³               ³                 ³                      ³"
		?"  ÀÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
		?
		?
		IF !SOLICITUD
			?"DETALLE:" AT 40
			??SAYGRL(REM.REMITO, "KARS", "NUMERO", "KARS.DETALLE")
		ENDIF
		?
		EJECT PAGE
		ENDP
		=FINIMP()
		=OFF_TMP()
		=IAUD(IIF(SOLICITUD, "SOLIC."+M.NUMEREM, REM.REMITO))
	ENDIF
ELSE
	=IAUDI()
ENDIF
IF getenv("EQUIPO")="00801B00B440"
rele lpt1,lpt2,lpt3
publ lpt1,lpt2,lpt3
store .T. to lpt1
STORE .F. TO lpt3,lpt2
ENDIF          
RETURN MEN_LIN(BOTOM)

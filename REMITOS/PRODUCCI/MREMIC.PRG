**************************************************
*-- Programa: MREMIC.PRG
*-- Fecha   : 19-09-95
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA DE REMITO DE FABRICACION
*************************************************
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
FUNCTION LREMIC
PARA NUMEREM
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	IF XSEEK(NUMEREM,"REM","REMITO")
		ACLA=''
		=CABPRI()
		_RMARGIN=255
		_LMARGIN=NUL
		_PCOPIES=IIF(SOLICITUD,3,1)
		PRINTJOB
		IF !EMPTY(REM.NUMOT)
			=XSEEK(REM.NUMOT,"COR","NUMERO")
			=XSEEK(REM.NUMOT,"CO1","NUMERO")
		ELSE
			=XSEEK(REM.NUMREQ,"REQ","NUMERO")
		ENDIF
		?
		?
		?
		?
		? REM.fechaOP AT 50
		?
		?
		?
		?
		=XSEEK(REM.TALLER, 'PER', 'PROCOD')
	    ?
		? PER.CLIENTE AT 15
		? PER.domicilio at 15
		? SAYMIX(PER.localidad,"CIUCOD")  AT 15
		? SAYMIX(PER.CONDIVA,"IVACOD") AT 15
		?? PER.NROIVA AT 55
		?
		?
		IF !EMPTY(REM.NUMOT)
			=XSEEK(COR.ARTICULO,"MER","ARTICULO"), .T.)
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
			?? PADL('ORDEN DE CORTE  N� '+ALLTRIM(STR(COR.NUMERO)),38)
		ELSE
			?"DEVOLUCION A PROVEEDOR" AT 35
			?
			?
			?? CHR(14)
			?? PADL('ORDEN DE REQ.  N� '+ALLTRIM(STR(REM.NUMREQ)),38)
			?
			?? chr(14)
			?? PADL('TEMPORADA '+REQ.TEMPORADA,38)
			?
			?? chr(14)
			?? PADL('PEDIDO  N� '+ALLTRIM(REQ.PEDIDO),38)
		ENDIF
		?
		_rmargin=255
		_wrap=.f.
		*
		? REPL("-",80)
		?
		SELE REX
		ARCHIVO=GENTMP()
		IF SEEK(REM.REMITO)
			=FLOCK() .AND. FLOK()
			COPY TO (ARCHIVO) WHILE REMITO=REM.REMITO
			UNLO IN REX
		ENDIF
		SELE 0
		USE (ARCHIVO) ALIAS TMP
		GO TOP
		?"  ��������������������������������������������������������������������������Ŀ"
		?"  �       CODIGO       �     "
		DO CASE
		CASE !EMPTY(TMP.AVICODPRO)
			INDE ON AVICODPRO TAG AVICODPRO
			??PADC("AV�O",10)
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
		??"     � CANTIDAD �  UNIDAD  � VERIFICO �"
		?"  ��������������������������������������������������������������������������Ĵ"
		?
		SCAN
			??"  �"
			DO CASE
			CASE !EMPTY(TMP.AVICODPRO)
				?? TMP.AVICODPRO
				=XSEEK(TMP.AVICODPRO,'AVIS','AVICODPRO')
				??"�"
				?? left(AVIS.AVIO,20)
				UNN=SAYMIX(AVIS.UNIDAD,"MDDCOD")
			CASE !EMPTY(TMP.TELCODPRO)
				?? TMP.TELCODPRO
				=XSEEK(TMP.TELCODPRO,'TELS','TELCODPRO')
				??"�"
				?? left(TELS.TELA,20)
				UNN=SAYMIX(TELS.UNIDAD,"MDDCOD")
			CASE !EMPTY(TMP.COMCODPRO)
				?? TMP.COMCODPRO
				=XSEEK(TMP.COMCODPRO,'COMS','COMCODPRO')
				??"�"
				?? left(COMS.COMPRA,20)
				UNN=SAYMIX(COMS.UNIDAD,"MDDCOD")
			CASE !EMPTY(TMP.OTRCODPRO)
				?? TMP.OTRCODPRO
				=XSEEK(TMP.OTRCODPRO,'OTRS','OTRCODPRO')
				??"�"
				?? left(OTRS.OTRS,20)
				UNN=SAYMIX(OTRS.UNIDAD,"MDDCOD")
			ENDCASE
			??"�"
			?? STR(TMP.CANTIDAD,10,2)
			??"�"
			?? LEFT(UNN, 10)
			??"�"
			??SPACE(10)
			??"�"
			?
		ENDSCAN
		??"  ����������������������������������������������������������������������������"
		?
		?? CHR(18)
		?
		?
		?"            ��������������������������������������������������������Ŀ"
		?"            �    FECHA      �      FIRMA      �      ACLARACION      �"
		?"  ������������������������������������������������������������������Ĵ"
		?"  � PREPARO �               �                 �                      �"
		?"  ������������������������������������������������������������������Ĵ"
		?"  � ENTREGO �               �                 �                      �"
		?"  ������������������������������������������������������������������Ĵ"
		?"  � RECIBIO �               �                 �                      �"
		?"  ��������������������������������������������������������������������"
		?
		?
		?
		EJECT PAGE
		ENDP
		=FINIMP()
		=OFF_TMP()
		=IAUD(REM.REMITO)
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

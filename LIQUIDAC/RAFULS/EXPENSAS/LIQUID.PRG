* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LIQUID.PRG                                               บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 02-15-94                                                    บ
* บ HORA       : 06:02:31pm                                                  บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
L_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE L_DIJO="Prepara Liquidaciขn"
	DO OPCNS
	=MOVEWIN(9,10,14,70,'WIN10','CREACION DE ARCHIVO DE LIQUIDACION')
	@ 1,5 SAY "CONSORCIO      "
	@ 2,5 SAY "MES A LIQUIDAR "
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELICNS('A LIQUIDAR',1,1))
		ACTI WIND WIN10
		@ 1, 25 SAY CNS.CONSORCIO
		=OPPRO()
		DO OPCCP
		M.MES= MONTH(DATE())
		@ 2, 25 GET M.MES ;
		PICT "99" ;
		VALID BETWEEN(M.MES,1,12) ;
		ERROR 'DEBE SER UN MES VALIDO (DE 1 A 12)'
		READ
		@ 2, 30 SAY QMES(M.MES)
		IF CONFIRMA("Un archivo Nuevo",.t.,18,10)
			DO OPRES
			M.NOMBREBASE=DBF('RES')
			ZAP
			USE
			SELE CCP
			COPY TO (M.NOMBREBASE) FOR ;
			CONCOD=CNS.CONCOD .AND. ;
			MONTH(FECHAVE)=M.MES
		ENDIF
	ENDIF
	=RELEWIN('WIN10')
CASE L_DIJO="Modifica"
	DO OPCNS
	STORE NUL TO RESPUESTA
	if !EMPTY(elicns('a Liquidar',1,1))
		=OPPRO()
		SELE PER
		SET ORDER TO TAG PROCOD
		DO OPCCP
		DO OPRES
		=movewin(4,0,22,79,'win10',' MODIFICACION DEL ARCHIVO DE LIQUIDACION ')
		SET RELATION TO PROCOD INTO PER
		BROWSE FIELDS ;
		FECHAVE:R:W=.F.:H='  FECHA ', ;
		PER.CLIENTE:R:W=.F.:H=PADC("PROVEEDOR",30), ;
		NUMERORE:R:W=.F.:H=' Nง FACTURA', ;
		MONTO:H='   IMPORTE':P='99999999.99', ;
		LINELIQ:H='    DESCRIPCION';
		PARTITION 55 IN WIN10
		=RELEWIN('WIN10')
		=REOPRES()
	ENDIF
CASE L_DIJO="Genera Liquidaciขn"
	DO OPCNS
	STORE NUL TO RESPUESTA
	IF !EMPTY(ELICNS('A LIQUIDAR',1,1))
		=OPPRO()
		DO OPTIX
		IF CONFIRMA("Un archivo Nuevo",.t.,18,10)
			DO OPLIQ
			ZAP
			DO OPRES
			SCAN
				SELE TIX
				SCAN FOR TIX.GASCOD=RES.GASCOD .AND. TIX.CONCOD=CNS.CONCOD
					SELE LIQ
					APPEND BLANK
					REPL LINEA  WITH RECNO("RES")
					REPL UNICOD WITH TIX.UNICOD
					REPL GASCOD WITH TIX.GASCOD
					REPL MONTO  WITH RES.MONTO * TIX.PORCENTAJE / 100
					SELE TIX
				ENDS
				SELE RES
			ENDS
		ENDIF
	ENDIF
CASE L_DIJO="Genera Cabecera"
	DO OPTIX
	DO OPTIP
	DO OPCNS
	DO OPCNX
	DO OPCSS
	STORE NUL TO RESPUESTA
	if !EMPTY(elicns('a Mostrar',1,1))
		DO OPLIQ
		DO OPRES
		DO LLIQI1
	ENDIF
CASE L_DIJO="Visualiza Importe por Unidad"
	DO OPCSS
	DO OPCNX
	DO OPTIX
	DO OPTIP
	DO OPCNS
	STORE NUL TO RESPUESTA
	if !EMPTY(elicns('a Mostrar',1,1))
		DO OPLIQ
		DO OPRES
		DO MLIQ2
	ENDIF
CASE L_DIJO="Visualiza Cabecera"
	DO OPCSS
	DO OPCNX
	DO OPTIX
	DO OPTIP
	DO OPCNS
	STORE NUL TO RESPUESTA
	if !EMPTY(elicns('a Mostrar',1,1))
		DO OPLIQ
		DO OPRES
		DO MLIQ1
	ENDIF
CASE L_DIJO="Imprime Cabecera"
	DO OPCNS
	STORE NUL TO RESPUESTA
	if !EMPTY(elicns('a Imprimir',1,1))
		STORE SPACE(80) TO ACLA
		=CABPRI()
		_PCOPIES=1
		STORE LEFT(SINCOSAS(CNS.CONSORCIO),8)+'.TXT' TO TMPPR
		COPY FILE (TMPPR) TO PRN
		=FINIMP()
	ENDIF
CASE L_DIJO="Imprime Liquidaciขn"
	DO OPCSS
	DO OPCNX
	DO OPTIX
	DO OPTIP
	DO OPCNS
	STORE NUL TO RESPUESTA
	if !EMPTY(elicns('a Imprimir',1,1))
		DO OPLIQ
		DO OPRES
		DO LLIQI
	ENDIF
ENDCASE
RETURN MEN_LIN(BOTOM)

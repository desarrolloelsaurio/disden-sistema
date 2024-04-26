********************************************************************************
*-- Programa: CASPYMAR.PRG
*-- Fecha   : 11-02-94 11:29am
*-- Version : g. reiner
*-- Notas   : impresion CASPIMAR POR IMPRESORA
********************************************************************************
STORE SPACE(30) TO M.ELTEX
M.AQUEMES=INTEX("MES Y A¥O DE DECLARACION",30)
IF !EMPTY(M.ELTEX)
M.AQUEMES=M.ELTEX
	ulpr=PROGRAM()
	@ 0,34 SAY TIME() COLOR I
	@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
	DO WHILE .NOT. PRIN()
		DO impresor
		IF LAST()=27
			RETURN TO MASTER
		ENDIF
	ENDDO
	@ 24,0 SAY PADC('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLOR SCHE 19
	piccher=RIGHT('999,999,999,999,999,999,999,999,999.99',acdigi)

	acla='|'+;
		PADC("APELLIDO Y",30)+"|"+;
		PADC("C.U.I.L.",20)+"|"+;
		PADC("DOCUMENTO",17)+"|"+;
		PADC("CARGAS FAM",10)+"|"+;
		PADC("T/TRABAJADO",10)+"|"+;
		PADC("REMUNER",10)+"|"

	acla1='|'+;
		PADC("NOMBRE",30)+"|"+;
		SPACE(20)+"|"+;
		PADC("Tipo y Nro",17)+"|"+;
		PADC(" S I  N O ",10)+"|"+;
		PADC("Horas",10)+"|"+;
		space(10)+"|"

	STORE 0 TO casos
	linea=REPL("=",LEN(acla))
	largo=LEN(acla)
	largoim=MIN(acancho,achoja)
	ON KEY DO abpr
	SET DEVICE TO PRINT
	SET CONSOLE OFF
	SET PRINTER ON
	_PEJECT="NONE"
	_PLENGTH=72
	_PLINENO=0
	_PAGENO=1
	_PSCODE='{27}{64}{27}{67}{72}{18}'
	_PLOFFSET=0
	_RMARGIN=largoim
	_PADVANCE="LINEFEEDS"
	_PCOPIES=1
	PRINTJOB
	_wrap=.t.
	_alignment="RIGHT"
	=CASPY()
	? acla
	? acla1
	? linea
	SELE LIQ
	SET ORDER TO
	STORE 0 TO TCH,TTH
	SELE EMP
	SET ORDER TO 3
	SCAN FOR NOLIQ
		IF _PLINENO>63
			? linea
			? PADL("TOTAL A TRANSPORTAR A PAG N§ "+ALLTRIM(STR(_PAGENO+1))+" |"+;
				STR(TCH,10,2)+"|"+;
				STR(TTH,10,2)+"|",LEN(ACLA))
			EJECT PAGE
			_wrap=.t.
			_alignment="RIGHT"
			=CASPY()
			?linea
			? acla
			? acla1
			? linea
		ENDI
		SELE LIQ
		STORE " XXX      " TO FAMILIA
		STORE 0 TO CH,TH
		SCAN FOR LEGAJO=EMP.LEGAJO .AND. ;
				ARCHIVO="THOR" .AND. ;
				IMPRIME
			STORE CH+LIQ.UNIDAD TO CH
			STORE TH+LIQ.MONTO  TO TH
			STORE TCH+LIQ.UNIDAD TO TCH
			STORE TTH+LIQ.MONTO  TO TTH
		ENDSCAN
		SELE EMP
		IF !EMPTY(CH) .OR. !EMPTY(TH)
			? "|"
			?? EMP.APYNOM
			?? "|"
			?? EMP.NUJUB
			?? "|"
			?? PADR(TDOC[EMP.TIPODOC],6)
			?? " "
			?? EMP.NRODOC
			?? "|"
			?? FAMILIA
			?? "|"
			?? STR(CH,10,2)
			?? "|"
			?? STR(TH,10,2)
			?? "|"
		ENDIF
	ENDSCAN
	? linea
	? PADL(PADC("TOTAL",10)+"|"+;
		STR(TCH,10,2)+"|"+;
		STR(TTH,10,2)+"|",LEN(ACLA))
		EJECT PAGE
		=CASPY(.T.)
	?
	_ALIGNMENT="LEFT"
	_WRAP=.F.
	? CHR(18)
 ?
 ? "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
 ? "³ ULTIMO DEPOSITO CORRESPONDIETE A ³ ³        TOTAL APORTES          ³"
 ? "³ MES...............  A¥O......... ³ ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
 ? "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ ³                               ³"
 ? "³      FECHA ULTIMO DEPOSITO       ³ ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
 ? "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
 ? "³                                  ³ ³      CANTIDAD DE PERSONAL     ³"
 ? "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ ÃÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄ´"
 ? "³   BOLETA N§   ³      BANCO       ³ ³ VARONES ³  MUJERES   ³ TOTAL  ³"
 ? "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ ÃÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄ´"
 ? "³               ³                  ³ ³         ³            ³        ³"
 ? "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ ÀÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÙ"
 ? "³    IMPORTE    ³      CONTROL     ³ ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
 ? "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ ³      TOTAL REMUNERACIONES     ³"
 ? "³               ³                  ³ ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
 ? "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ ³                               ³"
 ? "                                     ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
 ? "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
 ? "³                     F.676 A01   ³  ³           N§ DE ORDEN         ³"
 ? "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ  ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´"
 ? "                                     ³                               ³"
 ? "                                     ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
 ?
 ?
 ? "--------------------------    ----------------------  ----------------------------"
 ? "TIPO Y NUMERO DE DOCUMENTO           FIRMA               ACLARACION DE FIRMA"

	EJECT PAGE
	?
	ENDP
	SET DEVI TO SCRE
	SET CONS ON
	SET PRINT OFF
	SET MESS TO
	ON KEY LABEL shift-f1 DO hlp
	_RMARGIN=80
	_WRAP=.F.
ENDIF
RELE casos,largo,largoim
@ 24,0 SAY SPACE(80)
SELE EMP
SET ORDER TO 1
RETURN

FUNCTION CASPY
PARAMETER QUERUB	
	? 'P g N§   :'
	?? STR(_PAGENO,5)
	?
	_ALIGNMENT="LEFT"
	if getenv("EQUIPO")="MICASA"
		=COND(.T.)
	endif
	?
	IF largo>largoim
		IF largoim>80
			_RMARGIN=233
		ELSE
			_RMARGIN=132
		ENDIF
		??? CHR(15)
	ENDIF
	? CHR(14)
	?? "DD JJ DE CERTIFICACION DE SERVICIOS"
    ?
	? "CORRESPONDE AL MES DE "
	?? ALLTRIM(M.AQUEMES)
	?
	? "RUBRO I        - DATOS REFERENTES AL EMPLEADOR"
	?
	? "RAZON SOCIAL    "
	?? CHR(14)
	?? JANNAME
	? "N§ INSCRIPCION  "
	?
	? "N§ C.U.I.T.:"
	?
	? "DOMICILIO denunciado ante CASPYMAR"
	? jan.domicilio
	?
	? m.linea
	? "Domicilio de "
	?? "Lugar de pago" at 30
	?? "Distrito" at 60
	?? "Localidad" at 90
	? "Explotaci¢n"
	? m.linea
	IF !QUERUB
	? "RUBRO II       - DATOS DEL BENEFICIARIO"
ELSE
	? "RUBRO III      - CONTROL DE DEPOSITO Y APORTES"
ENDIF
	? linea
RETURN
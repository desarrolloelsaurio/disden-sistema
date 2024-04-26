*******************************************************************************
*-- Programa: LHORI9.prg
*-- Fecha   : 01/05/91 00:48am
*-- Version : G. REINER
*-- Notas   : genera planilla de sueldos y jornales
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO elijan
IF jannro<>0
	@ 0,60 SAY LEFT(janname,19) COLOR I
	DO opliq
	@ 24,0 SAY PADC("Calculando Planilla Horas y Adicionales",80) COLOR SCHE 19
	SELE liq
	GOTO TOP
	@ 24,0 SAY PADC("Calculando Planilla de Horas y Adicionales - [TECLA] Interrumpe",80,'*') COLOR SCHE 19
	RG=0
	fl=0
	STORE 0 TO cthor,ttthor
	largo=80
	largoim=MIN(acancho,achoja)
	largoim1=80
	B='|'
	ON KEY DO abpr
	SET DEVICE TO PRINT
	SET CONSOLE OFF
	IF largo>largoim1
		A=PATH+"\PL"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'N'+RIGHT(ptn[jannro],1)+LEFT(janname,1)+'.TXT'
		SET PRINTER TO FILE &a
		SET PRINTER ON
		_PSCODE='{27}{64}{27}{67}{53}'
		IF largoim=80
			_PLENGTH=53
		ELSE
			_PLENGTH=90
		ENDIF
	ELSE
		SET PRINTER ON
		_PLENGTH=72
		_PSCODE='{27}{64}{27}{67}{72}'
	ENDIF
	_PEJECT="NONE"
	_PLINENO=1
	_PAGENO=1
	_PECODE='{27}{64}{27}{67}{72}'
	_PLOFFSET=0
	_RMARGIN=255
	_PADVANCE="LINEFEEDS"
	_PCOPIES=1
	PRINTJOB
	**** EMPRESA ****                              &&
	ACLA=B+PADC("Legajo",10,' ')+;
	B+;
	PADC("Apellido y Nombre Empleado",30)+;
	B+;
	PADC("HORAS",10)+;
	B+;
	PADC("ADICIONALES",10)+;
	B+;
	PADC("TOTAL",10)+;
	B
	M.LINEA=REPL("-",LEN(ACLA))
	=LHORI92()
	GO TOP
	PL=LIQ.EMPLEADO
	STORE 0 TO TOTADI,TOTHOR
	STORE 0 TO TTOTADI,TTOTHOR
	***************************************************************
	SCAN FOR IMPRIME
	    IF _PLINENO>63
	    ? M.LINEA
	    EJECT PAGE
	    =LHORI92()
	    ENDIF
		STORE 0 TO tt,tthorp
		IF pl#liq.empleado
			=LHORI91()
		ENDIF
		IF LIQ.archivo="THOR"
			TOTHOR=TOTHOR+liq.monto
		ELSE
			IF LIQ.archivo="ADI"
				TOTadi=TOTadi+liq.monto
			ENDIF
		ENDIF
	ENDSCAN
	=LHORI91()
	? m.linea
	? B
	?? SPACE(10)
	?? B
	?? PADR("TOTAL",30)
	?? B
	?? STR(TTOTHOR,10,2)
	?? B
	?? STR(TTOTADI,10,2)
	?? B
	?? STR(TTOTADI+TTOTHOR,10,2)
	?? B
	**** IMPRIME SUBTOTALES ****
	EJECT PAGE
	?
	ENDP
	SET DEVI TO SCRE
	SET CONS ON
	SET PRINTER OFF
	SET PRINTER TO
	ON KEY LABEL shift-f1 DO hlp
	SELE liq
	indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
	SET INDEX TO &indice
	RELE hthor,cthor,tthor,hadi,cadi,tadi,hret,cret,tret,hsal,csal,tsal,hgas,cgas,tgas,red,RG,fl
	RELE ttthor,ttadi,ttret,ttsal,ttgas,ttred,veces,B,pl,tit,tt1,nada,largo,largoim,largoim1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

FUNCTION LHORI91
			GOTO PL IN emp
			? B
			?? emp.legajo
			?? B
			?? emp.apynom
			?? B
			?? STR(TOTHOR,10,2)
			?? B
			?? STR(TOTADI,10,2)
			?? B
			?? STR(TOTADI+TOTHOR,10,2)
			?? B
			PL=LIQ.EMPLEADO
			TTOTHOR=TTOTHOR+TOTHOR
			TTOTADI=TTOTADI+TOTADI
      STORE 0 TO TOTADI,TOTHOR
RETURN .T.

FUNCTION LHORI92
	? 'PROGRAMA :LHORI9'
	?? SPACE(47)
	? 'FECHA    :'
	?? DATE()
	?? SPACE(13)
	?? 'HORA     :'
	?? TIME()
	?? SPACE(13)
	?? 'P g N§   :'
	?? STR(_PAGENO,5)
	?
	? jan.empresa                                 &&
	IF .NOT. EMPTY(jan.plusuno)                   &&
		?? ' - '                                     &&
		?? ALLTRIM(jan.plusuno)                     &&
	ENDIF                                          &&
	? jan.domicilio                               &&
	IF .NOT. EMPTY(jan.plusdos)                   &&
		?? ' - '                                     &&
		?? ALLTRIM(jan.plusdos)                     &&
	ENDIF                                          &&
	? jan.localidad                               &&
	IF .NOT. EMPTY(jan.plustres)                  &&
		?? ' - '                                     &&
		?? ALLTRIM(jan.plustres)                    &&
	ENDIF                                          &&
	**** TITULO ****                               &&
	? 'PLANILLA DE HORAS TRABAJADAS Y ADICIONALES'
	?? '-'
	?? ALLTRIM(m.peraliq)
	**** LINEA ****                                &&
	IF largo>largoim
		??? CHR(15)
	ENDIF
		? M.LINEA
	? ACLA
	? M.LINEA
RETURN

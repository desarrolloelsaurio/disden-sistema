********************************************************************************
*-- Programa: GMIN3.prg
*-- Fecha   : 07/15/91 05:21pm
*-- Version : g. reiner
*-- Notas   : ANALISIS DE APORTES Y CONTRIBUCIONES PARA PISO
********************************************************************************
ulpr=PROGRAM()
tt="An lisis de Aportes y Contribuciones"
MAX=6
B='|'
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC(" Calculando la Planilla - Espere por Favor ",80,"*") COLO SCHE 19
sele ret
set order to
sele liq
set rela to registro into ret
index on ret->retencion to tmp for filtcon=30
goto top
*  DO WHILE .NOT. PRIN()
      DO impresor
      IF LAST()=27
         RETURN TO MASTER
      ENDIF
*  ENDDO
   @ 24,0 SAY PADC('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLOR SCHE 19
   acla=B
   RESTO=B
      acla=b+padc("CONCEPTO",30)+B+PADC("CONTRIBUCIONES",ACDIGI+8)+B+PADC("APORTES",ACDIGI+8)+B+PADC("TOTAL",ACDIGI)+B+PADC("TOTAL GENERAL",ACDIGI)+B
   linea=REPL("=",LEN(acla))
   largo=LEN(acla)
   largoim=MIN(acancho,achoja)
   ON KEY DO abpr
***************
SET PRINTER TO NADA.TXT
****************
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
      ? 'PROGRAMA :GMIN3'
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
      IF largo>largoim
         IF largoim>80
            _RMARGIN=233
         ELSE
            _RMARGIN=132
         ENDIF
         ??? CHR(15)
      ENDIF
      _WRAP=.T.
      _ALIGNMENT='CENTER'
      ? tt STYLE 'u'
      ? ALLTRIM(janname) STYLE 'u'
      ? ALLTRIM(m->peraliq) STYLE 'u'
      ?
      ?linea
      ? acla
      ? linea
		SELE LIQ
		GOTO TOP
		flTi=LEFT(ret->retencion,3)
		flBo=LEFT(ret->retencion,1)
		txto=ret->rettexto
		STORE 0 TO OBRERO,patron,gPATRON,gobrero,ggpatron,ggobrero
		SCAN
			IF FLBo<>LEFT(RET->RETENCION,1)
				* CAMBIO DE BOLETA
				? linea
				? gobrero+gpatron
				ggobrero=ggobrero+gobrero
				ggpatron=ggpatron+gpatron
				flbo=left(ret->retencion,1)
				txto=ret->rettexto
			else
				if flti<>left(ret->retencion,3)
					if patron<>0 .or. obrero<>0
						? b
						?? txto
						?? b
						IF OBRERO<>0
							?? STR(PCTO,6,2)
							?? B
							?? STR(OBRERO,ACDIGI,2)
							?? B
						ELSE
							?? SPACE(6)
							?? B
							?? SPACE(ACDIGI)
							?? B
						ENDIF
						IF PATRON<>0
							?? STR(PCTP,6,2)
							?? B
							?? STR(PATRON,ACDIGI,2)
							?? B
						ELSE
							?? SPACE(6)
							?? B
							?? SPACE(ACDIGI)
							?? B
						ENDIF
					endif
				endif
				flTi=LEFT(ret->retencion,3)
				txto=ret->rettexto
			endif
			IF LIQ->MONTO<>0
				IF RET->RETQUIEN='O'
					OBRERO=OBRERO+ABS(LIQ->MONTO)
					pcto=ret->RETMONTO
				ELSE
    				PATRON=PATRON+ABS(LIQ->MONTO)
					pctp=ret->RETMONTO
				ENDIF
			ENDIF
		ENDSCAN
      ? linea
      ?
      _ALIGNMENT="LEFT"
      _WRAP=.F.
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
sele ret
set order to 1
sele liq
SET RELA TO
set index to (PATH+'\'+indice)
@ 24,0 SAY SPACE(80)
RETURN


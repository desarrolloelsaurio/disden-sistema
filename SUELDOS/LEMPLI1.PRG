*:*********************************************************************
*:
*:        Program: LEMPLI1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LEMPLI.PRG                    
*:
*:          Calls: IMPRESOR.PRG
*:               : ABPR           (procedure in PROCESOS.PRG)
*:               : HLP            (procedure in PROCESOS.PRG)
*:
*:    Other Files: FILE
*:
*:      Documented 04/23/91 at 20:59               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: lempli1.prg
*-- Fecha   : 02/23/91 02:20am
*-- Version : g. reiner
*-- Notas   : impresion maestro de empleados
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO WHILE .NOT. PRIN()
   DO impresor
   IF LAST()=27
      RETURN TO MASTER
   ENDIF
ENDDO
@ 24,0 SAY PADC('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLO SCHE 19
STORE 0 TO casos
acla='|  Legajo  |      Apellido y Nombre       |          Domicilio           |     Localidad      |   Tel‚fono    |'
acla=acla+'T.Doc.|  N§ Doc. |Fecha Na|Fecha In|Fecha An|   N§  Jubilaci¢n   |Nac|Ptj|Liq|Sal|Centro de Costo'
acla=acla+'|   Categor¡a   |   Convenio    |Especialidad|'
largo=LEN(acla)
largoim=MIN(acancho,achoja)
linea=REPL("=",LEN(acla))
STORE 67 TO mxrn
ON KEY DO abpr
SET CONSOLE OFF
IF (largoim=80 .AND. largo>pds[1]) .OR. (largoim=132 .AND. largo>pds[2])
   A=PATH+"\PL"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'N'+RIGHT(ptn[jannro],1)+LEFT(janname,1)+'.TXT'
   ACTI SCRE
   @ 24,0 SAY PADC("Imprimiendo Listado en Archivo "+ALLTRIM(A),80) COLO SCHE 19
   SET PRINTER TO FILE &a
   IF largoim>80
      mxrn=85
   ELSE
      mxrn=48
   ENDIF
ENDIF
SET DEVICE TO PRINT
SET PRINTER ON
_PEJECT="NONE"
_PLENGTH=mxrn+5
_PLINENO=0
_PAGENO=1
_PSCODE='{27}{64}{27}{67}{'+ALLTRIM(STR(_PLENGTH))+'}{18}'
_PLOFFSET=0
_ALIGNMENT='LEFT'
IF largo>_RMARGIN
   IF largo<250
      _RMARGIN=largo+4
   ELSE
      _RMARGIN=255
   ENDIF
ENDIF
_PADVANCE="LINEFEEDS"
_PCOPIES=1
PRINTJOB
   ? 'PROGRAMA :LEMPLI1'
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
   _WRAP=.T.
   _ALIGNMENT='CENTER'
   ? tt STYLE 'u'
   ? ALLTRIM(janname) STYLE 'u'
   ?
   IF largo>largoim
      ??? CHR(15)
   ENDIF
   ?linea
   ? acla
   ? linea
   SELE emp
   SCAN FOR &fisc
      IF _PLINENO>mxrn
         ? linea
         EJECT PAGE
         _WRAP=.F.
         ?
         ??? CHR(18)
         ? 'PROGRAMA :LEMPLI1'
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
         _WRAP=.T.
         IF largo>largoim
            ??? CHR(15)
         ENDIF
         ? tt+' - Continuaci¢n' STYLE 'u'
         ? ALLTRIM(janname) STYLE 'u'
         ?
         ?linea
         ? acla
         ? linea
      ENDI
      ? '|'
      ?? legajo
      ?? '|'
      ?? apynom
      ?? '|'
      ?? domicilio
      ?? '|'
      ?? localidad
      ?? '|'
      ?? telefono
      ?? '|'
      ?? tdoc[TIPODOC]
      ?? '|'
      ?? nrodoc
      ?? '|'
      ?? fechanac
      ?? '|'
      ?? fechaing
      ?? '|'
      ?? fechaani
      ?? '|'
      ?? nujub
      ?? '|'
      ?? nacion
      ?? '|'
      ?? puntaje
      ?? '|'
      ?? IIF(noliq," SI"," NO")
      ?? '|'
      ?? IIF(pagsal="NO","NO","SI")
      ?? ' |'
      GOTO emp->ccos IN ccos
      ?? LEFT(ccos->cencos,15)
      ?? '|'
      GOTO emp->cat IN cat
      ?? LEFT(cat->categoria,15)
      ?? '|'
      GOTO emp->con IN con
      ?? LEFT(con->convenio,15)
      ?? '|'
      GOTO emp->esp IN esp
      ?? LEFT(esp->especiali,12)
      ?? '|'
      STORE casos+1 TO casos
      SELE emp
   ENDSCAN
   ? linea
   ?
   _WRAP=.F.
   ? 'Cantidad de Casos:'
   ?? STR(casos,10)
   EJECT PAGE
   ?
ENDP
ON KEY LABEL shift-f1 DO hlp
SET DEVI TO SCRE
SET CONS ON
SET PRINT OFF
SET PRINT TO
_RMARGIN=80
_WRAP=.F.
RELE casos,largo,largoim
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LEMPLI1.PRG

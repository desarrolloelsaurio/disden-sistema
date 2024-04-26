********************************************************************************
*-- Programa: LOBSOCI.PRG
*-- Fecha   : 06/07/91 00:13am
*-- Version : G. REINER
*-- Notas   : IMPRESION PLANILLA ESPECIAL PARA LA OBRA SOCIAL
********************************************************************************
DO WHILE .NOT. PRIN()
   DO impresor
   IF LAST()=27
      RETURN TO MASTER
   ENDIF
ENDDO
STORE 0 TO cn1,cn2
STORE 0 TO respuesta
IF eliret(" a Listar")<>0
   STORE respuesta TO cn1
   STORE 0 TO respuesta
   cn2=eliret(" a Listar")
   STORE SPACE(70) TO tt
   STORE 0 TO respuesta
   DEFINE WINDOW fic FROM 10,0 TO 15,79 DOUBLE TITL ' T¡tulo del Listado ' COLOR SCHE 8
   ACTI WINDOW fic
   @ 1,10 SAY "INGRESE TITULO DEL LISTADO" COLOR SCHE 3
   @ 2,4 GET tt MESS 'T¡tulo del Listado - [ESC] para Men£'
   READ
	rele wind fic
   IF LASTKEY()<>27 .AND. .NOT. EMPTY(tt)
      @ 24,0 SAY PADC('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLO SCHE 19
      acla='|'+PADC("Empleado",30)+'|Tipo y Nro Docum.|'+PADC("Sueldo",acdigi)+"|"
      GOTO cn1 IN ret
      acla=acla+PADC(ALLTRIM(ret->rettexto),acdigi)+"|"
      IF cn2<>0
         GOTO cn2 IN ret
         acla=acla+PADC(ALLTRIM(ret->rettexto),acdigi)+"|"
      ENDIF
      @ 24,0 SAY PADC(" Ordenando el Archivo para Imprimir ",80,"*") COLO SCHE 19
		store 0 to tt0,tt1,tt2
      SELE emp
      SET ORDER TO
      SELE liq
      SET RELA TO empleado INTO emp
      INDEX ON emp->apynom TO tmp FOR filtcon=30 .AND. liq->monto<>0 .and. (registro=cn2 .OR. registro=cn1)
      linea=REPL("=",LEN(acla))
      largo=LEN(acla)
      largoim=MIN(acancho,achoja)
      ON KEY DO abpr
      SET DEVICE TO PRINT
      SET CONSOLE OFF
      SET PRINTER ON
      _PEJECT="NONE"
      _PLENGTH=72
      _RMARGIN=80
      _PLINENO=0
      _PAGENO=1
      _PSCODE='{27}{64}{27}{67}{72}{18}'
      _RMARGIN=largoim
      _PLOFFSET=0
      _ALIGNMENT='LEFT'
      _PADVANCE="LINEFEEDS"
      _PCOPIES=1
      PRINTJOB
         ? tt STYLE 'u'
         ? ALLTRIM(janname) STYLE 'u'
         ?
               ?? 'P g N§   :'
               ?? STR(_PAGENO,5)
         ?linea
         ? acla
         ? linea
         GOTO TOP
         epl=liq->legajo
         pynom=emp->apynom
         doc=tdoc[emp->tipodoc]
         rodoc=emp->nrodoc
         sldo=emp->haberret+emp->adicret
         STORE 0 TO tn1,tn2
         SCAN
            IF _PLINENO>63
               ? linea
         ? '|Subtotal'
         ?? space(22)
         ?? '|'
         ?? space(17)
         ?? '|'
         ?? STR(tt0,acdigi,2)
         ?? '|'
         ?? STR(tt1,acdigi,2)
         ?? '|'
         IF cn2<>0
            ?? STR(tt2,acdigi,2)
            ?? '|'
         ENDIF
               EJECT PAGE
               _RMARGIN=largoim
               ?
               ??? CHR(18)
         ? tt STYLE 'u'
         ? ALLTRIM(janname) STYLE 'u'
         ?
         ?linea
         ? acla
         ? linea
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
               ? tt+' - Continuaci¢n' STYLE 'u'
               ? ALLTRIM(janname) STYLE 'u'
               ?
               ?linea
               ? acla
               ? linea
            ENDI
            IF epl<>emp->legajo
               ? '|'
               ?? pynom
               ?? '|'
               ?? doc
               ?? ' '
               ?? rodoc
               ?? '|'
               ?? STR(sldo,acdigi,2)
					store tt0+sldo to tt0
               ?? '|'
              ?? STR(tn1,acdigi,2)
               ?? '|'
               tt1=tt1+tn1
               IF cn2<>0
                  ?? STR(tn2,acdigi,2)
                  ?? '|'
                  tt2=tt2+tn2
               ENDIF
               epl=liq->legajo
               pynom=emp->apynom
               doc=tdoc[emp->tipodoc]
               rodoc=emp->nrodoc
               sldo=emp->haberret+emp->adicret
               STORE 0 TO tn1,tn2
            ENDIF
            IF registro=cn1
               tn1=ABS(liq->monto)
            ELSE
               tn2=ABS(liq->monto)
            ENDIF
         ENDSCAN
         ? '|'
         ?? pynom
         ?? '|'
         ?? doc
         ?? ' '
         ?? rodoc
         ?? '|'
         ?? STR(sldo,acdigi,2)
			store tt0+sldo to tt0
         ?? '|'
         ?? STR(tn1,acdigi,2)
         ?? '|'
         tt1=tt1+tn1
         IF cn2<>0
            ?? STR(tn2,acdigi,2)
            ?? '|'
            tt2=tt2+tn2
         ENDIF
         ? linea
         ? '|Total'
         ?? space(25)
         ?? '|'
         ?? space(17)
         ?? '|'
         ?? STR(tt0,acdigi,2)
         ?? '|'
         ?? STR(tt1,acdigi,2)
         ?? '|'
         IF cn2<>0
            ?? STR(tt2,acdigi,2)
            ?? '|'
         ENDIF
         _WRAP=.F.
         ?
         EJECT PAGE
         ?
      ENDP
      ON KEY LABEL shift-f1 DO hlp
      SET DEVI TO SCRE
      SET CONS ON
      SET PRINT OFF
      SET MESS TO
      _RMARGIN=80
      _WRAP=.F.
   ENDIF
ENDIF
SELE emp
USE
DO opemp
SELE liq
USE
DO opliq
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LOBSOCI.PRG

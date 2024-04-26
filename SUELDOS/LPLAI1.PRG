*:*********************************************************************
*:
*:        Program: LPLAI1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: PLANIL.PRG
*:
*:          Calls: IMPRESOR.PRG
*:               : ABPR           (procedure in PROCESOS.PRG)
*:               : HLP            (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:46               FoxDoc  version 2.01
*:*********************************************************************
*******************************************************************************
*-- Programa: lplai1.prg
*-- Fecha   : 01/17/91 01:30am
*-- Version : G. REINER
*-- Notas   : Imprime Planilla de Sueldos y Jornales hacia Abajo
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 10,0 TO 16,77 TITL " T¡tulo de la Planilla " SHAD COLOR SCHE 8
ACTI WIND win
STORE SPACE(60) TO tit
@ 1,1 SAY PADC('T¡tulo de la planilla de Sueldos y Jornales',78,' ') COLOR SCHE 3
@ 3,4 GET tit PICTURE REPL("X",60) MESS '[ENTER] para Anular'
READ
RELE WIND win
IF .NOT. EMPTY(tit)
   tit=ALLTRIM(UPPER(tit))
   DO WHILE .NOT. PRIN()
      DO impresor
      IF LAST()=27
         RETURN TO MASTER
      ENDIF
   ENDDO
   @ 24,0 SAY PADC(" Imprimiendo la Planilla - [TECLA] Interrumpe ",80,"*") COLOR SCHE 19
   B='|'
   acla=B+PADC("Detalle",30,' ')+'|   Horas   |    Haberes    |  Adicionales  |  Retenciones  |    Salarios   |'+PADC("Neto",23," ")+B
   c0=31
   c1=43
   c2=59
   c3=75
   c4=91
   c5=107
   c6=131
   linea=REPL("-",LEN(acla))
   ON KEY DO abpr
   SET DEVICE TO PRINT
   SET CONSOLE OFF
   SET PRINTER ON
   _PEJECT="NONE"
   _PLENGTH=72
   _PLINENO=0
   _PAGENO=1
   _PSCODE='{27}{64}{27}{67}{72}'
   _PLOFFSET=0
   _RMARGIN=255
   _PADVANCE="LINEFEEDS"
   _PCOPIES=1
   STORE 0 TO vez
   PRINTJOB
      SELE liq
      SET ORDER TO 1
      GOTO TOP
      ea=0
      STORE 0 TO ttt,thh,taa,trr,tss,tade
      ? PADC("Libro de Sueldos y Jornales",achoja,'-')
      ? PADC(tit,achoja,'-')
      ? PADL("P gina N§:"+STR(_PAGENO,5),achoja,'-')
      ? PADL(DTOC(fechaliq),achoja,'-')
      ?
      ? jan->empresa
      IF .NOT. EMPTY(jan->plusuno)
         ?? SPACE(IIF(achoja=80,10,30))
         ?? ALLTRIM(jan->plusuno)
      ENDIF
      ? jan->domicilio
      IF .NOT. EMPTY(jan->plusdos)
         ?? SPACE(IIF(achoja=80,10,30))
         ?? ALLTRIM(jan->plusdos)
      ENDIF
      ? jan->localidad
      IF .NOT. EMPTY(jan->plustres)
         ?? SPACE(IIF(achoja=80,10,30))
         ?? ALLTRIM(jan->plustres)
      ENDIF
      ? REPL("-",achoja)
      vez=0
      SCAN for liq->monto<>0
         IF imprime
            IF empleado<>ea
               ea=empleado
               GOTO liq->empleado IN emp
               GOTO emp->cat IN cat
               GOTO emp->con IN con
               ??? CHR(18)
               ? 'LEGAJO               :'
               ?? legajo
               ? 'EMPLEADO             :'
               ?? emp->apynom
               ? 'CATEGORIA            :'
               ?? cat->categoria
               ? 'CONVENIO             :'
               ?? con->convenio
               ? 'FECHA DE INGRESO     :'
               ?? emp->fechaing
               tt=LEFT(tdoc[emp->tipodoc]+SPACE(21),21)+':'
               ? tt
               ?? emp->nrodoc
               ? 'Ref. Sueldo          :'
               ?? STR(cat->sueldo,14,2)
               ?
               IF achoja=80
                  ??? CHR(15)
               ENDIF
               ?? linea
               ? acla
               ? linea
               STORE 0 TO tt,hh,aa,rr,ss
            ENDIF
            DO WHILE empleado=ea .AND. .NOT. EOF()
               IF archivo<>"XXX"
                  xa="'"+ALLTRIM(archivo)+"'"
                  SELE &xa
                  GOTO liq->registro
               ENDIF
               IF liq->filtcon=10
                  ? B
                  ?? hortexto
                  ?? B AT c0
                  IF liq->unidad>1
                     ?? STR(liq->unidad,11,2)
                  ELSE
                     ?? SPACE(11)
                  ENDIF
                  ?? B AT c1
                  ?? STR(liq->monto,15,2)
                  ?? B AT c2
                  ?? B AT c3
                  ?? B AT c4
                  ?? B AT c5
                  ?? B AT c6
                  hh=hh+liq->monto
               ELSE
                  IF liq->filtcon=20
                     ? B
                     ?? aditexto
                     ?? B AT c0
                     ?? B AT c1
                     ?? B AT c2
                     ?? STR(ABS(liq->monto),15,2)
                     ?? B AT c3
                     ?? B AT c4
                     ?? B AT c5
                     ?? B AT c6
                     aa=aa+liq->monto
                  ELSE
                     IF liq->filtcon=30
                        IF retquien='O'
                           ? B
                           ?? retencion
                           ?? B AT c0
                           ?? B AT c1
                           ?? B AT c2
                           ?? B AT c3
                           ?? STR(ABS(liq->monto),15,2)
                           ?? B AT c4
                           ?? B AT c5
                           ?? B AT c6
                           rr=rr+ABS(liq->monto)
                        ENDIF
                     ELSE
                        IF liq->filtcon=40
                           ? B
                           ?? salario
                           ?? B AT c0
                           ?? B AT c1
                           ?? B AT c2
                           ?? B AT c3
                           ?? B AT c4
                           ?? STR(liq->monto,15,2)
                           ?? B AT c5
                           ?? B AT c6
                           ss=ss+liq->monto
                        ELSE
                        ENDIF
                     ENDIF
                     IF liq->filtcon=50
                        IF liq->monto<>0
                           ? B
                           ?? 'Redondeo'
                           ?? B AT c0
                           ?? B AT c1
                           ?? STR(liq->monto,15,2)
                           ?? B AT c2
                           ?? B AT c3
                           ?? B AT c4
                           ?? B AT c5
                           ?? B AT c6
                           hh=hh+liq->monto
                        ENDIF
                     ELSE
                        IF liq->filtcon>70
                           IF adenrec
                              ? B
                              ?? gasto
                              ?? B AT c0
                              ?? B AT c1
                              ?? B AT c2
                              ?? B AT c3
                              ?? STR(ABS(liq->monto),15,2)
                              ?? B AT c4
                              ?? B AT c5
                              ?? B AT c6
									else
										tade=tade+abs(liq->monto)
                           ENDIF
                           rr=rr+ABS(liq->monto)
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF
               SELE liq
               SKIP
            ENDDO
            SKIP -1
				if .not. adenrec
               ? B
               ?? 'TOTAL ADELANTOS'
               ?? B AT c0
               ?? B AT c1
               ?? B AT c2
               ?? B AT c3
               ?? STR(tade,15,2)
               ?? B AT c4
               ?? B AT c5
               ?? B AT c6
				endif
				store 0 to tade
            ? B
            ?? 'NETO PERCIBIDO'
            ?? B AT c0
            ?? B AT c1
            ?? B AT c2
            ?? B AT c3
            ?? B AT c4
            ?? B AT c5
            ?? STR(aa+hh-rr+ss,23,2)
            ?? B AT c6
            ? linea
            ? B
            ?? 'Totales del Empleado'
            ?? B AT c0
            ?? B AT c1
            ?? STR(hh,15,2)
            ?? B
            ?? STR(aa,15,2)
            ?? B
            ?? STR(rr,15,2)
            ?? B
            ?? STR(ss,15,2)
            ?? B
            ?? STR(aa+hh-rr+ss,23,2)
            taa=taa+aa
            thh=thh+hh
            trr=trr+rr
            tss=tss+ss
            ?? B
            ? linea
            ? linea
            ? linea
            ? B
            ?? 'Transporte de P gina'
            ?? B AT c0
            ?? B AT c1
            ?? STR(thh,15,2)
            ?? B
            ?? STR(taa,15,2)
            ?? B
            ?? STR(trr,15,2)
            ?? B
            ?? STR(tss,15,2)
            ?? B
            ?? STR(taa+thh-trr+tss,23,2)
            ?? B
            ? linea
            EJECT PAGE
            ??? CHR(18)
            ? PADC("Libro de Sueldos y Jornales",achoja,'-')
            ? PADC(tit,achoja,'-')
            ? PADL("P gina N§:"+STR(_PAGENO,5),achoja,'-')
            ? PADL(DTOC(fechaliq),achoja,'-')
            ?
            ? jan->empresa
            IF .NOT. EMPTY(jan->plusuno)
               ?? SPACE(IIF(achoja=80,10,30))
               ?? ALLTRIM(jan->plusuno)
            ENDIF
            ? jan->domicilio
            IF .NOT. EMPTY(jan->plusdos)
               ?? SPACE(IIF(achoja=80,10,30))
               ?? ALLTRIM(jan->plusdos)
            ENDIF
            ? jan->localidad
            IF .NOT. EMPTY(jan->plustres)
               ?? SPACE(IIF(achoja=80,10,30))
               ?? ALLTRIM(jan->plustres)
            ENDIF
            ? REPL("-",achoja)
            vez=0
         ENDIF
      ENDSCAN
      ? REPL("-",achoja)
      ? REPL("-",achoja)
      IF achoja=80
         ??? CHR(15)
      ENDIF
      ? linea
      ? acla
      ? linea
      ? B
      ?? 'Totales del Per¡odo'
      ?? B AT c0
      ?? B AT c1
      ?? STR(thh,15,2)
      ?? B
      ?? STR(taa,15,2)
      ?? B
      ?? STR(trr,15,2)
      ?? B
      ?? STR(tss,15,2)
      ?? B
      ?? STR(taa+thh-trr+tss,23,2)
      ?? B
      ? linea
      ? linea
      EJECT PAGE
   ENDPRINT
   ?
   ON KEY LABEL shift-f1 DO hlp
   SET DEVI TO SCRE
   SET CONS ON
   SET PRINT OFF
   SET MESS TO
   _RMARGIN=80
   _WRAP=.F.
   RELE ttt,thh,taa,trr,tss,tt,hh,aa,rr,ss,vez
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LPLAI1.PRG

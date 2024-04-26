********************************************************************************
*-- Programa: gmin.prg
*-- Fecha   : 03/25/91 04:27pm
*-- Version : g. reiner
*-- Notas   : genera minuta de contabilidad del per¡odo
********************************************************************************
ulpr=PROGRAM()
tt="Minuta de Contabilidad"
MAX=6
DIME co[MAX]
B='|'
STORE 0 TO debe,haber,debep,haberp
co[1]='CANT'
co[2]=PADC("CONCEPTOS",20)
co[3]=PADC("DEBE Parcial",acdigi)
co[4]=PADC("DEBE",acdigi)
co[5]=PADC("HABER Parcial",acdigi)
co[6]=PADC("HABER",acdigi)
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC(" Calculando la Minuta Contable - Espere por Favor ",80,"*") COLO SCHE 19
mx=RECC("CCOS")
IF mx>0
   DIME had[MX],has[MX],dda[MX],ads[MX],app[MX],apo[MX]
   STORE 0 TO had,has,dda,ads,app,apo,syj,rtt,rtt1,rdt
   STORE 0 TO hadt,hast,ddat,adst,appt,apot,slt,adet
   IF RECC("SAL")>0
      DIME sl[RECC("SAL")],sln[RECC("SAL")]
      STORE 0 TO sl,sln
      STORE .T. TO slc
   ELSE
      STORE .F. TO slc
   ENDIF
   IF RECC("RET")>0
      DIME rt[RECC("RET")]
      STORE 0 TO rt
   ENDIF
   SELE emp
   SCAN FOR noliq
      STORE had[CCOS]+haberret TO had[CCOS]
      STORE has[CCOS]+habersin TO has[CCOS]
      STORE dda[CCOS]+adicret TO dda[CCOS]
      STORE ads[CCOS]+adicsin TO ads[CCOS]
      STORE hadt+haberret TO hadt
      STORE hast+habersin TO hast
      STORE ddat+adicret TO ddat
      STORE adst+adicsin TO adst
      STORE syj+emp->total TO syj
      STORE rdt+emp->redondeo TO rdt
   ENDSCAN
   SELE liq
   SCAN
      IF imprime
         IF filtcon=30
            STORE rt[REGISTRO]+ABS(monto) TO rt[REGISTRO]
            STORE rtt+ABS(monto) TO rtt
         ELSE
            IF filtcon=40
               STORE sl[REGISTRO]+monto TO sl[REGISTRO]
               STORE sln[REGISTRO]+unidad TO sln[REGISTRO]
               STORE slt+monto TO slt
            ELSE
               IF filtcon>70
                  STORE adet+ABS(monto) TO adet
               ENDIF
            ENDIF
         ENDIF
      ELSE
         IF filtcon=30 .AND. monto<0
            STORE apo[CENCOS]+ABS(monto) TO apo[CENCOS]
            STORE apot+ABS(monto) TO apot
            STORE rt[REGISTRO]+ABS(monto) TO rt[REGISTRO]
            STORE rtt1+ABS(monto) TO rtt1
         ENDIF
      ENDIF
   ENDSCAN
   DO WHILE .NOT. PRIN()
      DO impresor
      IF LAST()=27
         RETURN TO MASTER
      ENDIF
   ENDDO
   @ 24,0 SAY PADC('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLOR SCHE 19
   acla=B
   RESTO=B
   STORE 0 TO casos
   FOR cc=1 TO MAX
      acla=acla+co[CC]+B
      RESTO=RESTO+SPACE(LEN(co[CC]))+B
   NEXT
   linea=REPL("=",LEN(acla))
   largo=LEN(acla)
   largoim=MIN(acancho,achoja)
   RESTO=SUBSTR(RESTO,26)
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
   ON PAGE AT LINE 63 DO pgh3
   PRINTJOB
      ? 'PROGRAMA :GMIN'
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
      SELE ccos
      IF hadt<>0
         ? B
         ?? '    '
         ?? B
         ?? 'HABERES C/DESCUENTO'
         ?? RESTO
         STORE 0 TO ctrl
         SCAN
            IF had[RECNO()]<>0
               ? B
               ?? '    '
               ?? B+' '
               ?? LEFT(cencos,19)
               ?? B
               ?? STR(had[RECNO()],acdigi,2)
               ?? B
               STORE ctrl+had[RECNO()] TO ctrl
               STORE debep+had[RECNO()] TO debep
               IF ctrl=hadt
                  ?? STR(hadt,acdigi,2)
               ELSE
                  ?? SPACE(acdigi)
               ENDIF
               ?? B
               ?? SPACE(acdigi)
               ?? B
               ?? SPACE(acdigi)
               ?? B
            ENDIF
         ENDSCAN
         STORE debe+hadt TO debe
      ENDIF
      IF hast<>0
         ? B
         ?? '    '
         ?? B
         ?? 'HABERES S/DESCUENTO'
         ?? RESTO
         STORE 0 TO ctrl
         SCAN
            IF has[RECNO()]<>0
               ? B
               ?? '    '
               ?? B+' '
               ?? LEFT(cencos,19)
               ?? B
               ?? STR(has[RECNO()],acdigi,2)
               ?? B
               STORE ctrl+has[RECNO()] TO ctrl
               STORE debep+has[RECNO()] TO debep
               IF ctrl=hast
                  ?? STR(hast,acdigi,2)
               ELSE
                  ?? SPACE(acdigi)
               ENDIF
               ?? B
               ?? SPACE(acdigi)
               ?? B
               ?? SPACE(acdigi)
               ?? B
            ENDIF
         ENDSCAN
         STORE debe+hast TO debe
      ENDIF
      IF ddat<>0
         ? B
         ?? '    '
         ?? B
         ?? 'ADICIONALES C/DESC.'
         ?? RESTO
         STORE 0 TO ctrl
         SCAN
            IF dda[RECNO()]<>0
               ? B
               ?? '    '
               ?? B+' '
               ?? LEFT(cencos,19)
               ?? B
               ?? STR(dda[RECNO()],acdigi,2)
               ?? B
               STORE ctrl+dda[RECNO()] TO ctrl
               STORE debep+dda[RECNO()] TO debep
               IF ctrl=ddat
                  ?? STR(ddat,acdigi,2)
               ELSE
                  ?? SPACE(acdigi)
               ENDIF
               ?? B
               ?? SPACE(acdigi)
               ?? B
               ?? SPACE(acdigi)
               ?? B
            ENDIF
         ENDSCAN
         STORE debe+ddat TO debe
      ENDIF
      IF adst<>0
         ? B
         ?? '    '
         ?? B
         ?? 'ADICIONALES S/DESC.'
         ?? RESTO
         STORE 0 TO ctrl
         SCAN
            IF ads[RECNO()]<>0
               ? B
               ?? '    '
               ?? B+' '
               ?? LEFT(cencos,19)
               ?? B
               ?? STR(ads[RECNO()],acdigi,2)
               ?? B
               STORE ctrl+ads[RECNO()] TO ctrl
               STORE debep+ads[RECNO()] TO debep
               IF ctrl=adst
                  ?? STR(adst,acdigi,2)
               ELSE
                  ?? SPACE(acdigi)
               ENDIF
               ?? B
               ?? SPACE(acdigi)
               ?? B
               ?? SPACE(acdigi)
               ?? B
            ENDIF
         ENDSCAN
         STORE debe+adst TO debe
      ENDIF
      IF apot<>0
         ? B
         ?? '    '
         ?? B
         ?? 'APORTES PATRONALES '
         ?? RESTO
         STORE 0 TO ctrl
         SCAN
            IF apo[RECNO()]<>0
               ? B
               ?? '    '
               ?? B+' '
               ?? LEFT(cencos,19)
               ?? B
               ?? STR(apo[RECNO()],acdigi,2)
               ?? B
               STORE ctrl+apo[RECNO()] TO ctrl
               STORE debep+apo[RECNO()] TO debep
               IF ctrl=apot
                  ?? STR(apot,acdigi,2)
               ELSE
                  ?? SPACE(acdigi)
               ENDIF
               ?? B
               ?? SPACE(acdigi)
               ?? B
               ?? SPACE(acdigi)
               ?? B
            ENDIF
         ENDSCAN
         STORE debe+apot TO debe
      ENDIF
      IF slt<>0
         ? B
         ?? '    '
         ?? B
         ?? 'SALARIO FAMILIAR PG'
         ?? RESTO
         STORE 0 TO ctrl
         SELE sal
         SCAN
            IF sl[RECNO()]<>0
               ? B
               ?? STR(sln[RECNO()],4)
               ?? B+' '
               ?? LEFT(salario,19)
               ?? B
               ?? STR(sl[RECNO()],acdigi,2)
               ?? B
               STORE ctrl+sl[RECNO()] TO ctrl
               STORE debep+sl[RECNO()] TO debep
               IF ctrl=slt
                  ?? STR(slt,acdigi,2)
               ELSE
                  ?? SPACE(acdigi)
               ENDIF
               ?? B
               ?? SPACE(acdigi)
               ?? B
               ?? SPACE(acdigi)
               ?? B
            ENDIF
         ENDSCAN
         STORE debe+slt TO debe
      ENDIF
      IF rdt<>0
         ? B
         ?? '    '
         ?? B
         ?? 'REDONDEO            |'
         ?? STR(rdt,acdigi,2)
         ?? B
         ?? STR(rdt,acdigi,2)
         ?? B
         ?? SPACE(acdigi)
         ?? B
         ?? SPACE(acdigi)
         ?? B
         STORE debe+rdt TO debe
         STORE debep+rdt TO debep
      ENDIF
      ? linea
      ? B
      ?? '    '
      ?? B
      ?? '                    |'
      ?? STR(debep,acdigi,2)
      ?? '|'
      ?? STR(debe,acdigi,2)
      ?? '|'
      ?? STR(haberp,acdigi,2)
      ?? '|'
      ?? STR(haber,acdigi,2)
      ?? '|'
      ? linea
      RESTO=B+SPACE(acdigi)+B+SPACE(acdigi)+B
      IF syj<>0
         ? B
         ?? '    |SUELDOS Y JORN A PAG'
         ?? RESTO
         ?? STR(syj,acdigi,2)
         ?? B
         ?? STR(syj,acdigi,2)
         ?? B
         STORE syj TO haberp
         STORE syj TO haber
      ENDIF
      IF rtt<>0
         STORE 0 TO ctrl
         ? B
         ?? '    |LEYES SOC. A PAG-RET'
         ?? RESTO
         ?? SPACE(acdigi)
         ?? B
         ?? SPACE(acdigi)
         ?? B
         SELE ret
         SCAN FOR retquien='O'
            IF rt[recno()]<>0
               ? B
               ?? '    '
               ?? B+' '
               ?? LEFT(retencion,19)
               ?? RESTO
               ?? STR(rt[RECNO()],acdigi,2)
               ?? B
               STORE ctrl+rt[RECNO()] TO ctrl
               STORE rt[RECNO()]+haberp TO haberp
               IF ctrl=rtt
                  ?? STR(rtt,acdigi,2)
               ELSE
                  ?? SPACE(acdigi)
               ENDIF
               ?? B
            ENDIF
         ENDSCAN
         STORE rtt+haber TO haber
      ENDIF
      IF rtt1<>0
         STORE 0 TO ctrl
         ? B
         ?? '    |LEYES SOC. A PAG-APO'
         ?? RESTO
         ?? SPACE(acdigi)
         ?? B
         ?? SPACE(acdigi)
         ?? B
         SELE ret
         SCAN FOR retquien='P'
            IF rt[recno()]<>0
               ? B
               ?? '    '
               ?? B+' '
               ?? LEFT(retencion,19)
               ?? RESTO
               ?? STR(rt[RECNO()],acdigi,2)
               ?? B
               STORE ctrl+rt[RECNO()] TO ctrl
               STORE rt[RECNO()]+haberp TO haberp
               IF ctrl=rtt1
                  ?? STR(rtt1,acdigi,2)
               ELSE
                  ?? SPACE(acdigi)
               ENDIF
               ?? B
            ENDIF
         ENDSCAN
         STORE rtt1+haber TO haber
      ENDIF
      IF adet<>0
         ? B
         ?? '    |ADELANTOS           '
         ?? RESTO
         ?? STR(adet,acdigi,2)
         ?? B
         STORE adet+haberp TO haberp
         STORE adet+haber TO haber
         ?? STR(adet,acdigi,2)
         ?? B
      ENDIF
      ? linea
      ? B
      ?? '    '
      ?? B
      ?? 'TOTAL DE LA MINUTA  |'
      ?? STR(debep,acdigi,2)
      ?? '|'
      ?? STR(debe,acdigi,2)
      ?? '|'
      ?? STR(haberp,acdigi,2)
      ?? '|'
      ?? STR(haber,acdigi,2)
      ?? '|'
      ? linea
      ?
      _ALIGNMENT="LEFT"
      _WRAP=.F.
      ON PAGE
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
@ 24,0 SAY SPACE(80)
RETURN

********************************************************************************
*-- Programa: rhori.prg
*-- Fecha   : 01/15/91 11:36am
*-- Version : G. REINER
*-- Notas   : Resumen por impresora de Horas trabajadas en periodo
********************************************************************************
PARAMETER canhors,trofil,cosa,coteret,number,vrb
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO opjan
IF jannro<>0
   DO opliq
   DO opccos
   canccos=RECC()
   DO WHILE !PRIN()
      DO impresor
      IF LAST()=27
         RETURN TO MASTER
      ENDIF
   ENDDO
   @ 24,0 SAY PADC('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLO SCHE 19
   DIME cat[canhors],ca[canccos,canhors],ctrl[canccos]
   IF flag
      DIME cht[canhors],ch[canccos,canhors]
   ENDIF
   STORE 0 TO ch,ca,cat,cht,vez
   SELE liq
   SCAN FOR imprime .AND. filtcon=trofil
      vez=1
      IF flag
         STORE ch[LIQ.CENCOS,LIQ.REGISTRO]+ABS(liq.unidad) TO ch[LIQ.CENCOS,LIQ.REGISTRO]
      ENDIF
      STORE ca[LIQ.CENCOS,LIQ.REGISTRO]+ABS(liq.monto) TO ca[LIQ.CENCOS,LIQ.REGISTRO]
      STORE .T. TO ctrl[LIQ.CENCOS]
   ENDSCAN
   IF vez<>0
      STORE '|' TO B
      IF flag
         acla=B+PADC(cosa,20,' ')+B+PADC('Cantidad',acdigi,' ')+B+PADC('Monto',acdigi,' ')+B
      ELSE
         acla=B+PADC(cosa,20,' ')+B+PADC('Monto',acdigi,' ')+B
      ENDIF
      largo=LEN(acla)
      largoim=MIN(acancho,achoja)
      linea=REPL("=",LEN(acla))
      mxrn=67
      ON KEY DO abpr
      SET CONSOLE OFF
      IF (largoim=80 .AND. largo>pds[1]) .OR. (largoim=132 .AND. largo>pds[2])
         A="PL"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'N'+RIGHT(ptn[jannro],1)+LEFT(janname,1)+'.TXT'
         ACTI SCRE
         @ 24,0 SAY PADC("Imprimiendo Listado en Archivo "+ALLTRIM(A),80) COLO SCHE 19
         SET PRINTER TO FILE (PATH+'\'+A)
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
      _PSCODE='{27}{64}{27}{67}{'+ALLTRIM(STR(mxrn))+'}{18}'
      _PLOFFSET=0
      _ALIGNMENT='LEFT'
      _WRAP=.F.
      IF largo>_RMARGIN
         IF largo>255
            _RMARGIN=255
         ELSE
            _RMARGIN=largo+4
         ENDIF
      ENDIF
      _PADVANCE="LINEFEEDS"
      _PCOPIES=1
      PRINTJOB
         SELE ccos
         SCAN
            IF ctrl[RECNO()]
               STORE 0 TO casos
               ? CHR(18)
               ? 'PROGRAMA :RHORI'
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
               tt=coteret+' - C. Costos:'+ALLTRIM(cencos)
               ? tt STYLE 'u'
               ? ALLTRIM(m.peraliq)
               ? ALLTRIM(janname)
               ?
               IF largo>largoim
                  ??? CHR(15)
               ENDIF
               ?linea
               ? acla
               ? linea
               canccos=RECNO()
               SELE (number)
               STORE 0 TO hs,tl
               SCAN
                  IF ca[canccos,recno()]<>0
                     IF _PLINENO>mxrn
                        ? linea
                        EJECT PAGE
                        ? CHR(18)
                        ? 'PROGRAMA :RHORI'
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
                        ? tt+' - Cont.' STYLE 'u'
                        ? ALLTRIM(m.peraliq)
                        ? ALLTRIM(janname) STYLE 'u'
                        ?
                        IF largo>largoim
                           ??? CHR(15)
                        ENDIF
                        ?linea
                        ? acla
                        ? linea
                     ENDI
                     ? B
                     ?? &vrb
                     ?? B
                     IF flag
                        ?? STR(ch[canccos,recno()],acdigi,2)
                        hs=hs+ch[canccos,recno()]
                        ?? B
                     ENDIF
                     ?? STR(ca[canccos,recno()],acdigi,2)
                     tl=tl+ca[canccos,recno()]
                     ?? B
                     STORE casos+1 TO casos
                  ENDIF
               ENDSCAN
               ? linea
               ? '|Totales del Centro  |'
               IF flag
                  ?? STR(hs,acdigi,2)
                  ?? B
                  STORE cht[canccos]+hs TO cht[canccos]
               ENDIF
               ?? STR(tl,acdigi,2)
               ?? B
               STORE cat[canccos]+tl TO cat[canccos]
               EJECT PAGE
               SELE ccos
            ENDIF
         ENDSCAN
         _ALIGNMENT="LEFT"
         _WRAP=.F.
         IF flag
            acla=B+PADC('Centro de Costos',20,' ')+B+PADC('Cantidad',acdigi,' ')+B+PADC('Monto',acdigi,' ')+B
         ELSE
            acla=B+PADC('Centro de Costos',20,' ')+B+PADC('Monto',acdigi,' ')+B
         ENDIF
         tt=coteret+' - Resumen Total'
         _WRAP=.F.
         ? CHR(18)
         ? 'PROGRAMA :RHORI'
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
         ? ALLTRIM(m.peraliq)
         ? ALLTRIM(janname) STYLE 'U'
         ?
         IF largo>largoim
            ??? CHR(15)
         ENDIF
         ?linea
         ? acla
         ? linea
         SELE ccos
         STORE 0 TO casos,tl,hs
         SCAN
            IF ctrl[recno()]
               STORE casos+1 TO casos
               ? B
               ?? cencos
               IF flag
                  ?? B
                  ?? STR(cht[recno()],acdigi,2)
                  STORE hs+cht[recno()] TO hs
               ENDIF
               ?? B
               ?? STR(cat[recno()],acdigi,2)
               STORE tl+cat[recno()] TO tl
               ?? B
            ENDIF
         ENDSCAN
         ? linea
         ? "|Totales             |"
         IF flag
            ?? STR(hs,acdigi,2)
            ?? B
         ENDIF
         ?? STR(tl,acdigi,2)
         ?? B
         ?
         ?
         _ALIGNMENT="LEFT"
         _WRAP=.F.
         ? "Cantidad de Casos:"
         ?? STR(casos,10)
         EJECT PAGE
         ?
      ENDP
      ON KEY LABEL shift-f1 DO hlp
      SET DEVI TO SCRE
      SET CONS ON
      SET PRIN TO
      SET PRINT OFF
      SET MESS TO
      _RMARGIN=80
      _WRAP=.F.
   ENDIF
   RELE gt,ch,canccos,ca,B,vez,casos
   RELE cat,cht,ch,ca,ctrl
ENDIF
ON KEY LABEL shift-f1 DO hlp
@ 24,0 SAY SPACE(80)
RETURN

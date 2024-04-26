*:*********************************************************************
*:
*:        Program: RQRET.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LHORI6.PRG     (procedure in PROCESOS.PRG)
*:
*:          Calls: OPJAN          (procedure in PROCESOS.PRG)
*:               : OPLIQ          (procedure in PROCESOS.PRG)
*:               : OPCCOS         (procedure in PROCESOS.PRG)
*:               : IMPRESOR       (procedure in PROCESOS.PRG)
*:               : ABPR           (procedure in PROCESOS.PRG)
*:               : HLP            (procedure in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: RQRET.prg
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
   DO WHILE .NOT. PRIN()
      DO impresor
      IF LAST()=27
         RETURN TO MASTER
      ENDIF
   ENDDO
   @ 24,0 SAY PADC('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLO SCHE 19
   DIME cat[canhors],ca[canccos,canhors],ctrl[canccos]
   STORE 0 TO ch,ca,cat,cht,vez
   SELE liq
   SCAN FOR .NOT. imprime .AND. liq->monto<0 .AND. filtcon=30
      vez=1
      STORE ca[LIQ->CENCOS,LIQ->REGISTRO]+ABS(liq->monto) TO ca[LIQ->CENCOS,LIQ->REGISTRO]
      STORE .T. TO ctrl[LIQ->CENCOS]
   ENDSCAN
   IF vez<>0
      STORE '|' TO B
      acla=B+PADC(cosa,20,' ')+B+PADC('Monto',acdigi,' ')+B
      linea=REPL("=",LEN(acla))
      ON KEY DO abpr
      SET CONSOLE OFF
      SET DEVICE TO PRINT
      SET PRINTER ON
      _PEJECT="NONE"
      _PLENGTH=72
      _PLINENO=0
      _PAGENO=1
      _PSCODE='{27}{64}{27}{67}{72}'
      _PLOFFSET=0
      _PADVANCE="LINEFEEDS"
      _PCOPIES=1
      PRINTJOB
         SELE ccos
         SCAN
            IF ctrl[RECNO()]
               STORE 0 TO casos
               ? 'PROGRAMA :RQRET'
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
               ? ALLTRIM(janname)
               ?
               ?linea
               ? acla
               ? linea
               canccos=RECNO()
               SELE (number)
               STORE 0 TO hs,tl
               SCAN
                  IF ca[canccos,recno()]<>0
                     IF _PLINENO>63
                        ? linea
                        EJECT PAGE
                        ? CHR(18)
                        ? 'PROGRAMA :RQRET'
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
                        ? ALLTRIM(janname) STYLE 'u'
                        ?
                        ?linea
                        ? acla
                        ? linea
                     ENDI
                     ? B
                     ?? ret->rettexto
                     ?? B
                     ?? STR(ca[canccos,recno()],acdigi,2)
                     tl=tl+ca[canccos,recno()]
                     ?? B
                     STORE casos+1 TO casos
                  ENDIF
               ENDSCAN
               ? linea
               ? '|Totales del Centro  |'
               ?? STR(tl,acdigi,2)
               ?? B
               STORE cat[canccos]+tl TO cat[canccos]
               EJECT PAGE
               SELE ccos
            ENDIF
         ENDSCAN
         _ALIGNMENT="LEFT"
         _WRAP=.F.
         acla=B+PADC('Centro de Costos',20,' ')+B+PADC('Monto',acdigi,' ')+B
         tt=coteret+' - Resumen Total'
         _WRAP=.F.
         ? 'PROGRAMA :RQRET'
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
         ? ALLTRIM(janname) STYLE 'U'
         ?
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
               ?? B
               ?? STR(cat[recno()],acdigi,2)
               STORE tl+cat[recno()] TO tl
               ?? B
            ENDIF
         ENDSCAN
         ? linea
         ? "|Totales             |"
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
      SET PRINT OFF
      SET MESS TO
      _RMARGIN=80
      _WRAP=.F.
   ENDIF
   RELE gt,ch,canccos,ca,B,vez,casos
   RELE cat,cht,ch,ca,ctrl
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: RQRET.PRG

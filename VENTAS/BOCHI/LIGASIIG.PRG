***********************************************************************************
*-- Programa: LIGASIIG.PRG
*-- Fecha   : 25.04.90
*-- Version : G. REINER
*-- Notas   : IMPRIME GASTOS DETERMINADOS
********************************************************************************
PARAMETER COSA
REST FROM ..\VENTASA\DOLAR ADDI
RELE LINEA,PEPE,TEXTO,ACLA,TT
PUBLIC LINEA,PEPE,TEXTO,ACLA,TT
SELE GAS
tt='GASTOS EFECTUADOS - Rubro:'+gasto

DO WHIL !PRIN()
   DO IMPRESOR
ENDD

ON ESCAPE EXIT
SET DEVICE TO PRINT
SET CONSOLE OFF

b="|"
SET PRINTER ON
_peject="NONE"
_plength=72
_plineno=0
_pageno=1
_pscode='{27}{64}{27}{67}{0}{7}'
_ploffset=0
_padvance="LINEFEEDS"
_pcopies=1

PRIN
   _wrap=.T.
   _alignment="LEFT"
   _wrap=.F.
   DO PAGEHEAD
   ?
   ? chr(27)
   ??? "~20"
   STOR B+' Nro de Importaci¢n '+B+' Fecha  '+b+' Monto Original '+B+' $ '+B+' Monto  Equivalente '+B+' $ '+B to ACLA
   LINEA=REPL('=',LEN(ACLA))
   DO IMHORAS
   DO PAGETIT
   STOR 0 TO TOTAL
   STOR 0 TO TOTUS1
   SELE GASI
   SCAN FOR INKEY()#83 .AND. LASTKEY()#83 .AND. GASGASTO=COSA
      IF _plineno>63
         ? LINEA
         EJECT PAGE
         DO IMHORAS
         DO PAGETIT
      ENDI
      ? B
      ?? GASIMPORT
      ?? B
      ?? GASFECHA
      ?? B
      ?? STR(GASMONTO,16,2)
      ?? B
      ?? MONAV[GASMON]
      ?? B
      IF GASMON=1
         ?? STR(GASMONTO/GASCOTIZ,20,2)
         ?? B
         ?? MONAV[GASMOCOM]
         STOR TOTUS1+GASMONTO/GASCOTIZ TO TOTUS1
      ELSE
         IF GASMON=8
            ?? STR(GASMONTO,20,2)
            STOR GASMONTO+TOTUS1 TO TOTUS1
         ELSE
            XX=GASMONTO*VALMON[GASMON]/VALMON[8]
            ?? STR(XX,20,2)
            STOR XX+TOTUS1 TO TOTUS1
         ENDI
         ?? B
         ?? 'U$S'
      ENDI
      ?? B
   ENDSCAN
   ? LINEA
   ? B
   ?? 'TOTAL  '
   ?? REPL("-",46)
   ?? STR(TOTUS1,18,2)
   ?? ' U$S'
   ?? B
   ? LINEA
   EJECT PAGE

ENDP
=FINIMP()
ON ESCAPE
RELEASE LINEA,PEPE,TEXTO,ACLA
RELE ALL LIKE VAL*
RETURN

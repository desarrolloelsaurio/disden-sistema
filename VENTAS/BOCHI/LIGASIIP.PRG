***********************************************************************************
*-- Programa: LIGASIIP.PRG
*-- Fecha   : 26.04.90
*-- Version : G. REINER
*-- Notas   : IMPRIME IMPORTACION Y GASTOS
********************************************************************************
PARAMETER COSA
REST FROM ..\VENTASA\DOLAR ADDI
RELE LINEA,PEPE,TEXTO,ACLA,TT
PUBLIC LINEA,PEPE,TEXTO,ACLA,TT
DO WHIL !PRIN()
   DO IMPRESOR
ENDD

ON ESCAPE EXIT
SET DEVICE TO PRINT
SET CONSOLE OFF

b="|"
STOR B+'              Producto             '+B+'      Proveedor     '+B+'     Monto    '+B+' $ '+B+'   Monto Pesos   '+B+'Posici¢n Arancelaria'+B+'Art¡culo del Proveed'+B TO ACLA
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
   tt='RESUMEN DE IMPORTACION '+RTRIM(COSA)
   ? chr(27)
   ??? "~20"
   DO IMHORAS
   linea=REPL('=',LEN(ACLA))
   SELE IMP
   ??? CHR(27)
   ?? CHR(15)
   DO PAGETIT
   STOR 0 TO TOTAU
   STOR 0 TO TOTUS
   STOR .T. TO TOTUSL
   LOCATE FOR NROIMP=COSA
   TMON=IMPMON
   SCAN FOR INKEY()#83 .AND. LASTKEY()#83 .AND. NROIMP=COSA
      IF _plineno>63
         ? LINEA
         EJECT PAGE
         ?? CHR(18)
         DO IMHORAS
         ?? CHR(15)
         DO PAGETIT
      ENDI
      ? b
      GO IMPMER IN MER
      ?? left(MER.DETALLE,35)
      ?? B
      GO IMPPRO IN PRO
      ?? left(PRO.FIRMA,20)
      ?? B
      ?? STR(IMPFOB,14,2)
      ?? B
      ?? MONAV[IMPMON]
      ?? B
      A=IMPFOB*VALMON[IMPMON]
      STOR TOTAU+A TO TOTAU
      IF TMON#IMPMON
         TOTUSL=.F.
      ELSE
         TOTUS=TOTUS+IMPFOB
      ENDI
      ?? STR(A,17,2)
      ?? B
      ?? IMPPOS
      ?? B
      ?? IMPART
      ?? B
   ENDSCAN
   ? LINEA
   ? B
   ?? 'TOTALES        '
   IF TOTUSL
      ?? REPL("-",40)
      ?? STR(TOTUS,16,2)
      ?? ' '
      ?? MONAV[TMON]
      ?? ' '
   ELSE
      ?? REPL("-",61)
   ENDI
   ?? STR(TOTAU,17,2)
   ? LINEA
   ? CHR(18)
   ? "GASTOS EFECTUADOS"
   STOR B+' Fecha  '+b+'  Gasto  Efectuado  '+B+' Monto Original '+B+' $ '+B+' Monto  Equivalente '+B+' $ '+B to ACLA
   LINEA=REPL('=',LEN(ACLA))
   DO PAGETIT
   STOR 0 TO TOTUS1
   SELE GASI
   SCAN FOR INKEY()#83 .AND. LASTKEY()#83 .AND. GASIMPORT=COSA
      IF _plineno>63
         ? LINEA
         EJECT PAGE
         DO IMHORAS
         DO PAGETIT
      ENDI
      ? B
      ?? GASFECHA
      ?? B
      GO GASGASTO IN GAS
      ?? GAS.GASTO
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
   ? TT+' - Distribuci¢n del Gasto' STYLE 'U'
   STOR B+'      Rubro       '+B+'Monto Original'+B+' $ '+B+'Monto en d¢lares'+B+'   Monto en Pesos   '+B   TO ACLA
   linea=REPL('=',LEN(ACLA))
   ?
   ?
   ? 'Res£men de los gastos Generados'
   DO PAGETIT
   ? 'POR IMPORTACION   '
   ?? STR(TOTUS,16,2)
   ?? B
   ?? MONAV[TMON]
   ?? B
   ?? STR(TOTAU/VALDOL,16,2)
   ?? B
   ?? STR(TOTAU,20,2)
   ?? B
   ? 'POR GASTOS        '
   ?? STR(TOTUS1,16,2)
   ?? B
   ?? 'U$S'
   ?? B
   ?? STR(TOTUS1,16,2)
   ?? B
   ?? STR(TOTUS1*VALDOL,20,2)
   ?? B
   ? linea
   ? 'TOTALES:         '
   ?? SPACE(21)
   ?? b
   ?? STR(TOTUS1+TOTAU/VALDOL,16,2)
   ?? B
   STOR TOTUS1*VALDOL+TOTAU TO TOTAL
   ?? STR(TOTAL,20,2)
   ?? B
   ? linea
   ?
   ?
   SELE IMP
   STOR B+'      Producto      '+b+' Valor F.O.B. '+b+'F.O.B. + Gasto'+b+' Porc. '+b+'Valor Rel. U$S'+b TO ACLA
   LINEA=REPL('=',LEN(ACLA))
   ? 'Distribuci¢n del Gasto por Producto a Importar'
   DO PAGETIT
   SCAN FOR INKEY()#83 .AND. LASTKEY()#83 .AND. NROIMP=COSA
      ? B
      GO IMPMER IN MER
      ?? left(MER.DETALLE,20)
      ?? B
      A=IMPFOB*VALMON[IMPMON]
      PCT=A*100/TOTAU
      REL=A*TOTAL/TOTAU
      ?? STR(A,14,2)
      ?? B
      ?? STR(REL,14,2)
      ?? B
      ?? STR(PCT,6,2)
      ?? '%'
      ?? B
      ?? STR(REL/VALDOL,14,2)
      ?? b
   ENDSCAN
   ? LINEA
   EJECT PAGE
ENDP

=FINIMP()
RELEASE LINEA,PEPE,TEXTO,ACLA
RELE ALL LIKE VAL*
SET FILTER TO
RETURN

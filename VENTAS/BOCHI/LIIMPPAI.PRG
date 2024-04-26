***********************************************************************************
*-- Programa: LIIMPPAI.PRG
*-- Fecha   : 3/10/89
*-- Version : G. REINER
*-- Notas   : IMPRIME LISTA DE IMPORTACION
*--           VIENE DE IMPOR
********************************************************************************
PARAMETER COSA
REST FROM ..\VENTASA\DOLAR ADDI
RELE LINEA,PEPE,TEXTO,ACLA,TT
PUBLIC LINEA,PEPE,TEXTO,ACLA,TT
IF COSA=' '
   RESPU=1
ELSE
   IF COSA='GOYO'
      RESPU=2
   ELSE
      RESPU=3
      SET FILTER TO NROIMP=COSA
   ENDI
ENDI

DO WHIL !PRIN()
   DO IMPRESOR
ENDD

ON ESCAPE EXIT
SET DEVICE TO PRINT
SET CONSOLE OFF

b="|"
STOR b+'  Nro  Importacion  '+B+'      Producto      '+B+'   Proveedor   '+B+'     Monto    '+B+' $ '+B+'   Monto Pesos   '+B+'Posici¢n Arancelaria'+B+'Art¡culo del Proveed'+B TO ACLA
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
   tt='LISTA DE IMPORTACION'
   ? chr(27)
   ??? "~20"
   DO IMHORAS
   linea=REPL('=',LEN(ACLA))
   SELE IMP
   ??? CHR(27)
   ?? CHR(15)
   DO PAGETIT
   STOR 0 TO TOTAL
   IF RESPU=2
      GO TOP
      PP=NROIMP
      STOR 0 TO SUBTOT
   ENDI
   SCAN FOR INKEY()#83 .AND. LASTKEY()#83
      IF _plineno>63
         ? LINEA
         EJECT PAGE
         ?? CHR(18)
         DO IMHORAS
         ?? CHR(15)
         DO PAGETIT
      ENDI
      IF RESPU=2
         IF PP#NROIMP
            ? LINEA
            ? B
            ?? 'TOTAL PARTIDA '
            ?? PP
            ?? RE80
            ?? STR(SUBTOT,18,2)
            STOR 0 TO SUBTOT
            PP=NROIMP
            DO PAGETIT
         ENDI
      ENDI
      ? b
      ?? NROIMP
      ?? b
      GO IMPMER IN MER
      ?? left(MER.DETALLE,20)
      ?? B
      GO IMPPRO IN PRO
      ?? left(PRO.FIRMA,15)
      ?? B
      ?? STR(IMPFOB,14,2)
      ?? B
      ?? MONAV[IMPMON]
      ?? B
      A=IMPFOB*VALMON[IMPMON]
      STOR TOTAL+A TO TOTAL
      IF RESPU=2
         STOR SUBTOT+A TO SUBTOT
      ENDI
      ?? STR(A,17,2)
      ?? B
      ?? IMPPOS
      ?? B
      ?? IMPART
      ?? B
   ENDSCAN
   IF RESPU=2
      ? LINEA
      ? B
      ?? 'TOTAL PARTIDA '
      ?? PP
      ?? RE80
      ?? STR(SUBTOT,18,2)
   ENDI

   ? LINEA
   ? B
   ?? 'TOTAL EN PESOS '
   ?? RE80
   ?? STR(TOTAL,18,2)
   EJECT PAGE
ENDP
=FINIMP()
RELEASE LINEA,PEPE,TEXTO,ACLA
RELE ALL LIKE VAL*
SET FILTER TO
RETURN

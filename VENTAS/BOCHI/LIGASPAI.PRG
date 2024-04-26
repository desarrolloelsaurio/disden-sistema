***********************************************************************************
*-- Programa: LIGASPAI.PRG
*-- Fecha   : 3/10/89
*-- Version : G. REINER
*-- Notas   : IMPRIME LISTA DE TIPOS DE GASTO
*--           VIENE DE GASTO
********************************************************************************
RELE LINEA,PEPE,TEXTO,ACLA,TT
PUBLIC LINEA,PEPE,TEXTO,ACLA,TT

DO WHIL !PRIN()
   DO IMPRESOR
ENDD

ON ESCAPE EXIT
SET DEVICE TO PRINT
SET CONSOLE OFF

b="|"
STOR b+'FICHA'+b+'TIPO DE GASTO IMPORT'+B TO ACLA
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
   tt='LISTA DE TIPO DE GASTO DE IMPORTACION'
   ? chr(27)
   ??? "~20"
   DO IMHORAS
   linea=REPL('=',LEN(ACLA))
   SELE GAS
   DO PAGETIT

   SCAN FOR INKEY()#83 .AND. LASTKEY()#83
      IF _plineno>63
         ? LINEA
         EJECT PAGE
         DO IMHORAS
         DO PAGETIT
      ENDI

      ? b
      ?? str(RECNO(),5)
      ?? b
      ?? GASTO
      ?? b
   ENDSCAN

   ? LINEA
   EJECT PAGE
ENDP
=FINIMP()
RELEASE LINEA,PEPE,TEXTO,ACLA
RETURN

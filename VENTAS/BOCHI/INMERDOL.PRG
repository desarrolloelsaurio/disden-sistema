********************************************************************************
*-- Name....: INMERDOL.PRG
*-- Date....: 9-21-89
*-- Version.: G. REINER
*-- Notes...: INGRESO VALOR DOLAR MERCADERIAS
********************************************************************************
PARAMETER FF
GO FF
REST FROM ..\VENTASA\DOLAR ADDITIVE
 
DO TITULO WITH 1,'CORRECCION VALOR DOLAR MERCADERIAS'
DO FICHA WITH 19,1,FF
@ 4,8 TO 17,73 DOUB
 
@ 5,10 SAY "ARTICULO" COLOR w+/n
@ 5,32 GET artic PICT "@X"
@ 6,10 SAY "DENOMINACION PRODUCTO" COLOR w+/n
@ 6,32 GET detalle PICT "@XXXX"
@ 7,10 SAY "PROVEEDOR" COLOR w+/n
IF !EMPTY(PROVEEDOR)
   GO MER.PROVEEDOR in pro
   STOR PRO.FIRMA TO SS
   @ 7,32 GET SS
ENDI
@ 8,10 SAY "COSTO" COLOR w+/n
@ 8,32 GET costo PICT "9999999.99"
@ 9,10 SAY "% COSTO REAL" COLOR w+/n
@ 9,32 GET costor PICT "999.99"
CC=COSTO+COSTO*COSTOR/100
@ 9,50 SAY CC PICT '9999999.99' COLO SCHE 24
@ 10,10 SAY "% MAYORISTA" COLOR w+/n
@ 10,32 GET may PICT "999.99"
@ 10,50 SAY CC+CC*MAY/100 PICT '9999999.99' COLO SCHE 24
@ 11,10 SAY "% MAYORISTA 30 Dias" COLOR w+/n
@ 11,32 GET may30 PICT "999.99"
@ 11,50 SAY CC+CC*MAY30/100 PICT '9999999.99' COLO SCHE 24
@ 12,10 SAY "% MINORISTA" COLOR w+/n
@ 12,32 GET min PICT "999.99"
@ 12,50 SAY CC+CC*MIN/100 PICT '9999999.99' COLO SCHE 24
@ 13,10 SAY "% MINORISTA 30 Dias" COLOR w+/n
@ 13,32 GET min30 PICT "999.99"
@ 13,50 SAY CC+CC*MIN30/100 PICT '9999999.99' COLO SCHE 24
@ 14,10 SAY 'VALOR U$S' COLOR W+/N
@ 15,10 SAY "I.V.A." COLOR W+/N
IVV=IIF(IVA='S','Si','No')
@ 15,32 GET IVV PICT '@M Si,No'
@ 16,10 SAY "MARCA" COLOR w+/n
@ 16,32 GET mrk PICT "X"
CLEAR GETS
@ 14,32 GET DOLAR PICT '9999999.99'
@ 14,50 SAY VALDOL*DOLAR PICT '9999999.99' COLO SCHE 24
READ
@ 14,50 SAY VALDOL*DOLAR PICT '9999999.99' COLO SCHE 24
REPL IVA WITH IVV
@ 24,0 say SPAC(79)
@ 23,0
ACCEPT '                    Toque tecla para continuar ' to pp
SET CLOCK OFF
RETURN

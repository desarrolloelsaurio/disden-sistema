*********************************************************************************
*-- Programa: LISBLAN.PRG
*-- Fecha   : 12/18/90 01:46pm
*-- Version : G. REINER
*-- Notas   : IMPRIME MERCADERIAS EN BLANCO
*********************************************************************************
FINMER=RECCOUNT("MER")
REST FROM ..\VENTASA\DOLAR ADDITIVE
RELE LINEA,PEPE,TEXTO,ACLA,TT
PUBLIC LINEA,PEPE,TEXTO,ACLA,TT

IF !PRIN()
   DO IMPRESOR
ENDI

b="|"
STOR ' ' TO LINEA

=INIPRIN()
PRIN
   _wrap=.T.
   _alignment="LEFT"
   _wrap=.F.
   ?
   tt='LISTA DE MERCADERIAS EN BLANCO'
   ACLA=B+'FICHA'+B
   ? chr(27)
   ??? "~20"
   DO IMHOR
   LINEA=REPL('=',LEN(ACLA))
   SELE MER
   ? B
   SCAN FOR EMPTY(DETALLE)
      IF _plineno>63
         ? LINEA
         EJECT PAGE
         DO IMHOR
         DO PAGETIT
      ENDI
      ?? STR(RECNO(),5)
      ?? B
   ENDSCAN
   ? LINEA
   EJECT PAGE
ENDP
=FINIMP()
RELEASE LINEA,PEPE,TEXTO,ACLA
SELE PRO
SET ORDER TO TAG FIRMA
SELE MER
RETURN

***********************************************************************************
*-- Programa: LIPROPAI.PRG
*-- Fecha   : 7/10/89
*-- Version : G. REINER
*-- Notas   : DERIVA IMPRESION LISTA DE PROVEEDORES POR IMPRESORA
*--           VIENE DE PROVEE
********************************************************************************
RELE LINEA,PEPE,TEXTO,ACLA,TT
PUBLIC LINEA,PEPE,TEXTO,ACLA,TT

DO WHIL !PRIN()
   DO IMPRESOR
ENDD

B="|"
STOR B+'FICHA'+B+'            FIRMA             '+B+'          DOMICILIO           '+B+'  TELEFONO  '+B+'  TELEFONO  '+B+'      LOCALIDAD     '+B+' COD. '+B TO ACLA

=iniprin()

PRIN
   _wrap=.T.
   _alignment="LEFT"
   _wrap=.F.
   DO PAGEHEAD
   ?
   tt='LISTA DE PROVEEDORES'
   ? chr(27)
   ??? "~20"
   DO IMHORAS
   ??? CHR(27)
   ??? CHR(15)
   linea=REPL('=',LEN(ACLA))
   SELE PRO
   DO PAGETIT

   SCAN FOR INKEY()#83 .AND. LASTKEY()#83
      IF _plineno>63
         ? LINEA
         EJECT PAGE
         ??? CHR(18)
         DO IMHORAS
         ??? CHR(15)
         DO PAGETIT
      ENDI

      ? B
      ?? STR(RECNO(),5)
      ?? B
      ?? FIRMA
      ?? B
      ?? DOMICILIO
      ?? B
      ?? TELEFONO
      ?? B
      ?? TELEFONO1
      ?? B
      ?? LOCALIDAD
      ?? B
      ?? CODIGOPOS
      ?? B

      STOR RTRIM(APELLIDO)+' '+NOMBRE+SPACE(29) TO AA
      ? B+'     '+B
      ?? LEFT(AA,30)
      ?? B
      ?? DETALLE
      ?? B
      ?? SPACE(12)
      ?? B
      ?? SPACE(12)
      ?? B
      ?? PAIS
      ?? B
      ?? SPACE(6)
      ?? b
   ENDSCAN

   ? LINEA
   EJECT PAGE
ENDP

=FINIMP()
RELEASE LINEA,PEPE,TEXTO,ACLA
RETURN

***********************************************************************************
*-- Programa: LIAGEPAI.PRG
*-- Fecha   : 6/10/89
*-- Version : G. REINER
*-- Notas   : IMPRIME LOS DATOS DE LA AGENDA
********************************************************************************
RELE LINEA,PEPE,TEXTO,ACLA,TT
PUBLIC LINEA,PEPE,TEXTO,ACLA,TT

DO WHIL !PRIN()
   DO IMPRESOR
ENDD
b="|"
STOR b+'APELLIDO Y NOMBRE        '+b+'EMPRESA         '+b+'DOMICILIO                 '+B+'LOCALIDAD     '+b+'PAIS      '+b+'TELEFONO    '+b+'TELEFONO    '+b+'TELEFONO    '+b TO ACLA
=iniprin()
PRIN
   _wrap=.T.
   _alignment="LEFT"
   _wrap=.F.
   DO PAGEHEAD
   ?
   tt='LISTADO DE AGENDA'
   ? chr(27)
   ??? "~20"
   _wrap=.T.
   _alignment="CENTER"
   ? TT STYLE 'U'
   _wrap=.F.
   DO IMHORAS
   ??? CHR(27)
   ??? CHR(15)
   linea=REPL('=',LEN(ACLA))
   SELE AGE
   DO PAGETIT
   SCAN
      IF _plineno>63
         ? LINEA
         EJECT PAGE
         ??? CHR(18)
         _wrap=.T.
         _alignment="CENTER"
         ? TT STYLE 'U'
         _wrap=.F.
         DO IMHORAS
         ??? CHR(15)
         DO PAGETIT
      ENDI

      c=b+LEFT(APELLIDO,25)+b+LEFT(EMPRESA,16)+B+LEFT(DOMICILIO,26)+B+LEFT(LOCALIDAD,LEN(LOCALIDAD)-1)+B+PAIS+B+TELEFONO1+B+TELEFONO2+B+TELEFONO3+B
      ? c
   ENDSCAN
   ? LINEA
   EJECT PAGE
ENDP
=FINIMP()
RELEASE LINEA,PEPE,TEXTO,ACLA
RETURN

*********************************************************************************
*-- Programa: LISDOL.PRG
*-- Fecha   : 3/10/89
*-- Version : G. REINER
*-- Notas   : IMPRIME MERCADERIAS CON VALOR DOLAR
*********************************************************************************
FINMER=RECCOUNT("MER")
REST FROM ..\VENTASA\DOLAR ADDITIVE
RELE LINEA,PEPE,TEXTO,ACLA,TT
PUBLIC LINEA,PEPE,TEXTO,ACLA,TT

DEFI POPU CLI1 FROM 18,60 MESS 'DESDE DONDE EMPIEZA ?'
DEFI BAR 1 OF CLI1 PROM ' Desde el Principio '
DEFI BAR 2 OF CLI1 PROM ' Desde Ficha N§ '
ON SELE POPU CLI1 DO RESP1

RESPUESTA=0
ACTI POPU CLI1
IF RESPUESTA=2
   DO INFIC WITH FINMER,'DE PARA INICIO LISTADO '
ENDI

IF !EMPTY(RESPUESTA)
   DECLARE MOSCA[6]
   SELE PRO
   SET ORDER TO TAG PROVEEDOR
   SELE MER

   IF !PRIN()
      DO IMPRESOR
   ENDI

   b="|"
   STOR ' ' TO LINEA
=iniprin()
   PRIN
      _wrap=.T.
      _alignment="LEFT"
      _wrap=.F.
      DO PAGEHEAD
      ?
      tt='LISTA DE PRECIOS DOLARIZADA - Precios calculados sobre base dolar'
      ACLA=B+'FICHA'+B+SPACE(11)+"PRODUCTO"+SPACE(11)+B+'   PROVEEDOR   '+B+'COSTO U$S'+B+'   COSTO  '+b+'COSTO REAL'+B+'MAYORISTA '+b+'MAYOR 30 D'+B+'MINORISTA '+b+'MINOR 30 D'+B+'IVA'+B
      ? chr(27)
      ??? "~20"
      DO IMHOR
      ??? CHR(27)
      ??? CHR(15)
      LINEA=REPL('=',LEN(ACLA))
      SELE MER
      GO 1
      IF MRK="*"
         DO PAGETIT
      ENDI
      IF RESPUESTA=1
         GO TOP
      ELSE
         GO RESPUESTA
      ENDI
      DO WHIL !EOF() .AND. INKEY()#83 .AND. LASTKEY()#83
         IF LEN(RTRIM(ARTIC))=3
            IF _plineno>59
               ? LINEA
               ? 'COTIZ. FECHA:'
               ?? VALFECHA
               ?? SPACE(80)
               ?? 'U$S:'
               ?? STR(VALDOL,10,2)
               EJECT PAGE
               ??? CHR(18)
               DO IMHOR
               ??? CHR(15)
            ELSE
               ? LINEA
               ? 'COTIZ. FECHA:'
               ?? VALFECHA
               ?? SPACE(80)
               ?? 'U$S:'
               ?? STR(VALDOL,10,2)
            ENDI
            PEPE=rtrim(DETALLE)+' ('+left(artic,3)+')'
            PEPE=PADR(PEPE,40)
            DO ARTTIT
            DO PAGETIT
         ELSE
            IF _plineno>63
               ? LINEA
               ? 'COTIZ. FECHA:'
               ?? VALFECHA
               ?? SPACE(80)
               ?? 'U$S:'
               ?? STR(VALDOL,10,2)
               EJECT PAGE
               ??? CHR(18)
               DO IMHOR
               ??? CHR(15)
               PEPE=RTRIM(PEPE)+" --. Cont."
               DO ARTTIT
               DO PAGETIT
            ENDI

            c=b
            c=c+str(RECNO(),5)
            c=c+b
            c=c+LEFT(DETALLE,30)
            c=c+b
            c=c+left(pro.firma,15)
            c=c+b+STR(DOLAR,9,2)+b
            IBA=IIF(IVA='S',1.13,1)
            CX=DOLAR*VALDOL
            FF=CX+(CX*costor/100)
            c=c+str(CX,10,2)+B+STR(FF,10,2)+B
            C=C+STR(FF+FF*MAY/100,10,2)+B
            C=C+STR(FF+FF*MAY30/100,10,2)+B
            C=C+STR((FF+FF*MIN/100)*IBA,10,2)+B
            C=C+STR((FF+FF*MIN30/100)*IBA,10,2)+B+' '+IVA+" "
            c=c+b
            ?C
         ENDI
         SKIP
      ENDD
      ? LINEA
      ? 'COTIZ. FECHA:'
      ?? VALFECHA
      ?? SPACE(80)
      ?? 'U$S:'
      ?? STR(VALDOL,10,2)
      EJECT PAGE
   ENDP
	 =FINIMP()
   RELEASE LINEA,PEPE,TEXTO,ACLA
   SELE PRO
   SET ORDER TO TAG FIRMA
   SELE MER
ENDI
RETURN

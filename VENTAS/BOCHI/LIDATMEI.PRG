*********************************************************************************
*-- Programa: LIDATMEI.PRG
*-- Fecha   : 3/10/89
*-- Version : G. REINER
*-- Notas   : DERIVA IMPRESION LISTA DE PRECIOS MERCADERIAS POR IMPRESORA
*             INGRESA EL PARAMETRO II
*             1 . IMPRESION 6 TOTALES
*             2 . IMPRESION PRECIOS COSTO
*             3 . IMPRESION PRECIOS MAYORISTAS
*             4 . IMPRESION PRECIOS MINORISTAS
********************************************************************************
PARAMETER ii
finmer=RECCOUNT("MER")
REST FROM ..\VENTASA\dolar ADDITIVE
RELE LINEA,PEPE,TEXTO,ACLA,TT
PUBLIC linea,pepe,texto,acla,tt
DEFI POPU cli1 FROM 18,60 MESS 'DESDE DONDE EMPIEZA ?'
DEFI BAR 1 OF cli1 PROM ' Desde el principio '
DEFI BAR 2 OF cli1 PROM ' Desde Ficha N§'
ON SELE POPU cli1 DO resp1
respuesta=0
ACTI POPU cli1
IF respuesta=2
   DO infic WITH finmer,'DE PARA INICIO LISTADO '
ELSE
   respuesta=1
ENDI
DECLARE mosca[6]
SELE pro
SET ORDER TO
SELE mer

DO WHIL !PRIN()
   DO impresor
ENDD

B="|"
STOR ' ' TO linea
=iniprin()
PRIN
   _WRAP=.T.
   _ALIGNMENT="LEFT"
   _WRAP=.F.
   DO pagehead
   ?
   tt='LISTA DE PRECIOS '
   IF ii=1
      tt=tt+'INTERNA'
      acla=B+'FICHA'+B+SPACE(16)+"PRODUCTO"+SPACE(16)+B+'   PROVEEDOR   '+B+'Pcio COSTO'+B+'COSTO REAL'+B+'MAYORISTA '+B+'MAYOR 30 D'+B+'MINORISTA '+B+'MINOR 30 D'+B+'IVA'+B
   ELSE
      acla=B+'FICH'+B+SPACE(16)+'PRODUCTO'+SPACE(16)+B+'  PROVEEDOR '+B
      IF ii=2
         tt=tt+'DE COSTO'
         acla=acla+'Pci COSTO'+B+'COST REAL'+B
      ELSE
         IF ii=3
            tt=tt+'MAYORISTA'
            acla=acla+'MAYORISTA'+B+'MAYOR 30D'+B
         ELSE
            tt=tt+'MINORISTA'
            acla=acla+'MINORISTA'+B+'MINOR 30D'+B
         ENDI
      ENDI
   ENDI
   ? CHR(27)
   ??? "~20"
   DO imhor
   IF ii=1
      ??? CHR(27)
      ??? CHR(15)
   ENDI
   linea=IIF(ii=1,REPL('=',134),REPL('=',80))
   SELE mer
   GO 1
   IF ast="*"
      DO pagetit
   ENDI
   IF respuesta=1
      GO TOP
   ELSE
      GO respuesta
   ENDI
   DO WHIL !EOF() .AND. INKEY()#83 .AND. LASTKEY()#83
      IF LEN(LTRIM(RTRIM(detalle)))#0
         IF LEN(RTRIM(artic))=3
            IF _PLINENO>59
               ? linea
               EJECT PAGE
               IF ii=1
                  ??? CHR(18)
                  DO imhor
                  ??? CHR(15)
               ELSE
                  DO imhor
               ENDI
            ELSE
               ? linea
            ENDI
            pepe=RTRIM(detalle)+' ('+LEFT(artic,3)+')'
            pepe=PADR(pepe,40)
            DO arttit
            DO pagetit
         ELSE
            IF _PLINENO>63
               ? linea
               EJECT PAGE
               IF ii=1
                  ??? CHR(18)
                  DO imhor
                  ??? CHR(15)
               ELSE
                  DO imhor
               ENDI
               pepe=RTRIM(pepe)+" --. Cont."
               DO arttit
               DO pagetit
            ENDI

            C=B
            C=C+STR(RECNO(),IIF(ii=1,5,4))
            C=C+B
            C=C+detalle
            C=C+B
 			      C=C+LEFT(SAY_PRO(MER.PROVEEDOR),IIF(ii=1,15,12))
            C=C+B
            IF dolar=0
               cosdol=costo
            ELSE
               cosdol=dolar*valdol
            ENDI
            IF ii=1
               ff=cosdol+(cosdol*costor/100)
               C=C+STR(cosdol,10,2)+B+STR(ff,10,2)+B
               C=C+STR(ff+ff*may/100,10,2)+B
               C=C+STR(ff+ff*may30/100,10,2)+B
               C=C+STR((ff+ff*MIN/100),10,2)+B
               C=C+STR((ff+ff*min30/100),10,2)+B+' '+iva+" "
            ELSE
               IF ii=2
                  C=C+STR(cosdol,9,2)
               ELSE
                  ff=cosdol+(cosdol*costor/100)
                  IF ii=3
                     C=C+STR(ff+ff*may/100,9,2)
                  ELSE
                     C=C+STR((ff+ff*MIN/100),9,2)
                  ENDI
               ENDI
               C=C+B
               IF ii=2
                  C=C+STR(cosdol+(cosdol*costor/100),9,2)
               ELSE
                  IF ii=3
                     C=C+STR(ff+ff*may30/100,9,2)
                  ELSE
                     C=C+STR((ff+ff*min30/100),9,2)
                  ENDI
               ENDI
            ENDI
            C=C+B
            ?C
         ENDI
      ENDI
      SKIP
   ENDD
   ? linea
   EJECT PAGE
ENDP
=FINIMP()
SET ESCA OFF
RELEASE linea,pepe,texto,acla
SELE pro
SET ORDER TO TAG firma
SELE mer
RETURN

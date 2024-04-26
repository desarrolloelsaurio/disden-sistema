*********************************************************************************
*-- Programa: LISDOLUN.PRG
*-- Fecha   : 3/10/89
*-- Version : G. REINER
*-- Notas   : IMPRIME MERCADERIAS CON VALOR DOLAR - UNA COLUMNA
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
      tt='LISTA DE PRECIOS EN DOLARES '
      ACLA=B+'FICHA'+B+SPACE(16)+"PRODUCTO"+SPACE(16)+B+'   PROVEEDOR   '+B+'  COSTO U$S  '+B
      ? chr(27)
      ??? "~20"
      DO IMHOR
      LINEA=REPL('=',LEN(ACLA))
      SELE MER
      GO 1
      IF TYPE(FILTRO)='N'
         IF FILTRO#0
            DO PAGETIT
         ENDI
      ENDI
      IF RESPUESTA=1
         GO TOP
      ELSE
         GO RESPUESTA
      ENDI
      DO WHIL !EOF() .AND. INKEY()#83 .AND. LASTKEY()#83
         IF !EMPTY(DETALLE)
            IF LEN(RTRIM(ARTIC))=3
               IF _plineno>59
                  ? LINEA
                  EJECT PAGE
                  DO IMHOR
               ELSE
                  ? LINEA
               ENDI
               PEPE=rtrim(DETALLE)+' ('+left(artic,3)+')'
               PEPE=PADR(PEPE,40)
               DO ARTTIT
               DO PAGETIT
            ELSE
               IF _plineno>63
                  ? LINEA
                  EJECT PAGE
                  DO IMHOR
                  PEPE=RTRIM(PEPE)+" --. Cont."
                  DO ARTTIT
                  DO PAGETIT
               ENDI

               c=b
               c=c+str(RECNO(),5)
               c=c+b
               c=c+DETALLE+B
               c=c+left(pro.firma,15)
               c=c+b+STR(DOLAR,13,2)+b
               ?C
            ENDI
         ENDI
         SKIP
      ENDD
      ? LINEA
      EJECT PAGE
   ENDP
	 =FINIMP()
   SET ESCA OFF
   RELEASE LINEA,PEPE,TEXTO,ACLA
   SELE PRO
   SET ORDER TO TAG FIRMA
   SELE MER
ENDI
RETURN

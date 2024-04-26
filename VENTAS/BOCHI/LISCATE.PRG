*****************************************************************************
*-- Programa: LISCATE.PRG
*-- Fecha   : 3/10/89
*-- Version : G. REINER
*-- Notas   : LISTA MERCADERIAS PARA OFERTAS CATEDRAS
***************************************************************************
DEFI WIND win FROM 10,0 TO 17,79 DOUB
ACTI WIND win
filtro=' '
filtro1=SPACE(30)
DO tit2 WITH 1,'CATEDRA A MARCAR','W/N',78
@ 4,2 SAY 'INGRESE CODIGO CATEDRA ' COLOR W+/N
@ 4,35 GET filtro
READ
IF LEN(RTRIM(LTRIM(filtro)))=1 .AND. filtro#' '
   SELE mer
   SET FILTER TO RTRIM(LTRIM(filtro)) $ mrk
   @ 4,2 SAY 'INGRESE DENOMINACION CATEDRA ' COLOR W+/N
   @ 4,35 GET filtro1
   READ
   DEAC WIND win
   RELE linea,pepe,texto,acla,tt
   PUBLIC linea,pepe,texto,acla,tt
   REST FROM ..\VENTASA\dolar ADDITIVE
   DECLARE mosca[6]
   SELE mer
   DEFI POPU caca FROM 4,32 MESS 'Elige precio para listado de C tedras'
   DEFI BAR 1 OF caca PROM ' Costo absoluto '
   DEFI BAR 2 OF caca PROM ' Costo real '
   DEFI BAR 3 OF caca PROM ' Mayorista Contado '
   DEFI BAR 4 OF caca PROM ' Mayorista 30 Dias '
   DEFI BAR 5 OF caca PROM ' Minorista Contado '
   DEFI BAR 6 OF caca PROM ' Minorista 30 D¡as '
   DEFI BAR 7 OF caca PROM ' Equiv. U$S Costo absoluto '
   DEFI BAR 8 OF caca PROM ' Equiv. U$S Costo real'
   DEFI BAR 9 OF caca PROM ' Equiv. U$S Mayorista Contado'
   DEFI BAR 10 OF caca PROM ' Equiv. U$S Mayorista 30 Dias'
   DEFI BAR 11 OF caca PROM ' Equiv. U$S Minorista Contado'
   DEFI BAR 12 OF caca PROM ' Equiv. U$S Minorista 30 D¡as'
   DEFI BAR 13 OF caca PROM ' Costo absoluto U$S '
   DEFI BAR 14 OF caca PROM ' Costo real U$S '
   DEFI BAR 15 OF caca PROM ' Mayorista Contado U$S '
   DEFI BAR 16 OF caca PROM ' Mayorista 30 Dias U$S'
   DEFI BAR 17 OF caca PROM ' Minorista Contado U$S'
   DEFI BAR 18 OF caca PROM ' Minorista 30 D¡as U$S'

   ON SELE POPU caca DO resp1
   DEFI WIND win FROM 0,0 TO 24,79 NONE
   ACTI WIND win
   DO titulo WITH 1,'TIPO DE PRECIO A LISTAR PARA LISTA DE '+RTRIM(filtro1)
   respuesta=0
   ACTI POPU caca
   IF respuesta>0
      respu=respuesta
      IF !PRIN()
         DO impresor
      ENDI

      B="|"
      STOR '|       DENOMINACION DEL PRODUCTO        |  PRECIO  |  CANT.  |      TOTAL    |' TO acla
      STOR REPL('=',LEN(acla)) TO linea

=INIPRIN()
      PRIN
         _WRAP=.T.
         _ALIGNMENT="LEFT"
         _WRAP=.F.
         DO pagehead
         ?
         tt='LISTA DE PRECIOS - CATEDRA DE '+RTRIM(filtro1)
         ? CHR(27)
         ??? "~20"
         DO imhor
         SELE mer
         GO TOP
         DO pagetit
         ii=IIF(MOD(respuesta,6)=0,6,MOD(respuesta,6))
         STOR 0 TO TOTAL
         SELE mer
         SCAN
            IF LEN(LTRIM(RTRIM(detalle)))#0
               IF _PLINENO>63
                  ? linea
                  EJECT PAGE
                  DO imhor
                  DO pagetit
               ENDI
               A=cant
               A=AT(filtro,A)
               A=(A-1)*2+1
               ? B
               ?? detalle
               ?? B
               IF respuesta<7
                  ff=costo
               ELSE
                  IF respuesta<13
                     ff=valdol*mer.dolar
                  ELSE
                     ff=dolar
                  ENDI
               ENDI

               IF ii=1
                  ff=ff
               ELSE
                  ff=ff+(ff*costor/100)
                  IF ii=2
                     ff=ff
                  ELSE
                     IF ii=3
                        ff=(ff+ff*may/100)
                     ELSE
                        IF ii=4
                           ff=(ff+ff*may30/100)
                        ELSE
                           IF ii=5
                              ff=(ff+ff*MIN/100)
                           ELSE
                              ff=(ff+ff*min30/100)
                           ENDI
                        ENDI
                     ENDI
                  ENDI
               ENDI
               kant=VAL(SUBSTR(cant,A,2))
               IF ii<5 .AND. ii#1
                  ?? '^'
                  ?? STR(ff,9,2)
               ELSE
                  ?? STR(ff,10,2)
               ENDI
               ?? B
               ?? STR(kant,9,2)
               ?? B
               tt=kant*ff
               ?? STR(tt,15,2)
               STOR TOTAL+tt TO TOTAL
            ENDI
         ENDSCAN
         ? linea
         ? CHR(14)
         ?? 'TOTAL:'
         ?? STR(TOTAL,16,2)
         EJECT PAGE
      ENDP
      =FINIMP()
      ON ESCAPE
      RELEASE linea,pepe,texto,acla
   ENDI
ENDI
DEAC WIND ALL
RETURN

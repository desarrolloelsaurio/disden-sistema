*:*********************************************************************
*:
*:        Program: IDEBC2.PRG
*:
*:         System: SYSTEMA DE COMPRAS
*:         Author: GOYO REINER
*:      Copyright (c) 1992, NAZA S.R.L.
*:  Last modified: 01/10/92     13:40
*:
*:      Called by: IDEBC.PRG                     
*:
*:          Calls: LOK.PRG
*:               : LFAR.PRG
*:               : MFAR2.PRG
*:               : UNID()         (function  in ?)
*:               : REPUSE.PRG
*:               : XACIVA()       (function  in ?)
*:               : CONFIRMA()     (function  in CONFIRMA.PRG)
*:               : FLOK.PRG
*:               : IAUD.PRG
*:
*:      Documented 01/30/92 at 15:50               FoxDoc  version 2.01
*:*********************************************************************
*
*-- Programa: IDEBC2.PRG
*-- Fecha   : 12-18-91 09:11am
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : DEVOLUCION DE LINEAS DE FACTURAS PROVEEDORES
*
DECLARE produto[16]
SELE far
STORE RECNO() TO ff
registro=STR(ff)
regfar=VAL(registro)
SCAT MEMV
STORE far->monto TO montoant
STORE productiva TO tipopec
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   @ 0,rh SAY TIME() COLOR I
   @ 0,rp SAY PADC(ulpr,10) COLOR I
   STORE "99,999,999,999.99" TO picu2
   IF far->anulada
      DEFINE WINDOW win11 FROM 18,5 TO 23,45 DOUB TITL ' *** MENSAJE *** ' SHAD COLO SCHE 8
      ACTI WIND win11
      @ 1,0 SAY PADC("NOTA DE DEBITO YA ANULADA",40)
      @ 2,0 SAY PADC("EL DIA:"+DTOC(far->fecha),40)
      =INKEY(nul )
      RELE WIND win11
   ELSE
      ACTI WIND win2
      DO lok WITH 'FAR'
      SELE fad
      STORE "" TO ft,fts,ftb
      SCAN FOR factura=m->factura .AND. procod=m->procod .AND. cantidad>devuelta
         ft=ft+ALLTRIM(STR(RECNO()))+","
      ENDSCAN
      IF LEN(ft)>0
         ft=LEFT(ft,LEN(ft)-1)
         cuantos=OCCURS(",",ft)+1
         STORE nul TO cantotot
         registro = ft
         DO lok WITH 'FAD'
         STORE 17 TO COL
         DO lfar WITH .F.
         DEFINE WINDOW win10 FROM 18,5 TO 23,69 SHAD COLO SCHE 8
         ACTI WIND win10
         m->fechaem = DATE()
         m->debito=0
         @ 1,3 SAY "NRO DE NOTA DE DEBITO :"
         @ 2,3 SAY "FECHA DE EMISION      :"
         @ 1,27 GET m->debito PICT "@Z 9999999999"
         READ
         IF m->debito > 0
            @ 2,27 GET m->fechaem
            READ
            SELE far
            IF SEEK(STR(m->debito)+m->procod)
               DEFINE WINDOW win11 FROM 19,5 TO 23,25 DOUB TITL ' *** MENSAJE *** ' SHAD COLO SCHE 8
               ACTI WIND win11
               @ 1,0 SAY PADC("NOTA DE DEBITO EMITIDA",20)
               =INKEY(nul )
               RELE WIND win11
               RELE WIND win10
            ELSE
               RELE WIND win10
               desdecual = 1
               DO WHILE .T.
                  DO mfar2 WITH ft, desdecual, .F.
                  hastacual=desdecual+13
                  IF hastacual>cuantos
                     hastacual=cuantos
                  ENDIF
                  ren=10
                  ii=1
                  FOR I=desdecual TO hastacual
                     nada=IIF(I=1,1,AT(",",ft,I-1)+1)
                     nada1=IIF(I=cuantos,LEN(ft)+1,AT(",",ft,I))
                     GO VAL(SUBSTR(ft, nada, nada1-nada)) IN fad
                     produto[II]=LEFT(fad->articulo,13)
                     ren=ren+1
                     ii=ii+1
                     NEXT
                     DO WHILE .T.
                        FOR I=1 TO ii-1
                           @ I+9 ,c1 PROMPT produto[I]
                           NEXT
                           @ 24, 30 PROMPT "\<ANTERIOR"
                           @ 24, 45 PROMPT "\<SALIR"
                           @ 24, 60 PROMPT "\<POSTERIOR"
                           opcion = 0
                           MENU TO opcion
                           IF !EMPTY(opcion)
                              IF opcion = ii
                                 IF desdecual-14>=1
                                    desdecual=desdecual-14
                                 ELSE
                                    LOOP
                                 ENDIF
                              ELSE
                                 IF opcion = ii+1
                                    EXIT
                                 ELSE
                                    IF opcion = ii+2
                                       IF desdecual+14<=cuantos
                                          desdecual=desdecual+14
                                       ELSE
                                          LOOP
                                       ENDIF
                                    ELSE
                                       SELE fad
                                       I = opcion + desdecual - 1
                                       nada=IIF(I=1,1,AT(",",ft,I-1)+1)
                                       nada1=IIF(I=cuantos,LEN(ft)+1,AT(",",ft,I))
                                       GO VAL(SUBSTR(ft, nada, nada1-nada))
                                       SCAT MEMV
                                       ren = opcion + 9
                                       IF tipopec="M"
                                          SELE mer
                                          SET ORDER TO 1
                                          SEEK LEFT(m->articulo,13)
                                          nada2 = LEFT(m->articulo,13)
                                          @ ren ,d1 GET nada2
                                          nada = LEFT(mer->merca,8)
                                          @ ren ,d2 GET nada
                                       ELSE
                                          IF tipopec="T"
                                             SELE tel
                                             SET ORDER TO 1
                                             SEEK LEFT(m->articulo,10)
                                             nada2 = LEFT(m->articulo,10)
                                             @ ren ,d1 GET nada2
                                             nada = LEFT(tel->tela,8)
                                             @ ren ,d2 GET nada
                                          ELSE
                                             IF tipopec="A"
                                                SELE avi
                                                SET ORDER TO 1
                                                SEEK LEFT(m->articulo,10)
                                                nada2 = LEFT(m->articulo,10)
                                                @ ren ,d1 GET nada2
                                                nada = LEFT(avi->avios,8)
                                                @ ren ,d2 GET nada
                                             ELSE
                                                nada = LEFT(m->descripcio,8)
                                                @ ren ,d1 GET m->articulo
                                                @ ren ,d2 GET nada
                                             ENDIF
                                          ENDIF
                                       ENDIF
                                       IF m->talle>0
                                          @ ren, d3 GET m->talle        PICT "99.99"
                                       ENDIF
                                       IF m->unidad>0
                                          @ ren, d4 GET unid(m->unidad) PICT "XXXX"
                                       ENDIF
                                       nada1 = m->monto /m->cantidad
                                       nada3 = m->cantidad - m->devuelta
                                       @ ren, d5 GET m->nada3  PICT "@Z 9999999999"
                                       @ ren, d6 GET m->nada1     PICT "@Z 99999,999,999.99"
                                       @ ren, d7 GET m->monto     PICT "@Z 99999,999,999.99"
                                    ENDIF
                                    CLEA GETS
                                    DEFINE WINDOW win10 FROM 0,5 TO 4,63 SHAD COLO SCHE 8
                                    ACTI WIND win10
                                    m->cuanto = m->cantidad - m->devuelta
                                    @ 1,3 SAY "CANT. DEVUELTA :" GET m->cuanto  PICT "@Z 9999999999";
                                       VALID m->cuanto <= m->cantidad - m->devuelta
                                    READ
                                    RELE WIND win10
                                    SELE fad
                                    IF m->cuanto > 0
                                       REPL devuelta WITH m->devuelta + m->cuanto
                                       DO repuse
                                       fts=fts+ALLTRIM(STR(RECNO()))+","
                                       APPE BLANK
                                       GATH MEMV
                                       DO repuse
                                       REPL factura WITH m->debito
                                       REPL cantidad WITH m->cuanto
                                       REPL monto  WITH 0
                                       REPL devuelta WITH 0
                                       m->cantotot = m->cantotot + m->cuanto
                                       ftb=ftb+ALLTRIM(STR(RECNO()))+","
                                    ENDIF
                                 ENDIF
                              ENDIF
                           ENDIF
                           EXIT
                        ENDDO
                        IF opcion = ii+1 .OR. cuantos=0
                           EXIT
                        ENDIF
                     ENDDO
                     IF !EMPTY(m->cantotot)
                        DEFINE WINDOW win10 FROM 12,5 TO 23,56 SHAD COLO SCHE 8
                        ACTI WIND win10
                        STORE nul TO m->montotot, m->descuento, m->montoexe
                        @ 1,3 SAY "MONTO TOTAL DEBITO  : "
                        @ 2,3 SAY "MONTO DESCUENTO     : "
                        @ 3,3 SAY "MONTO NETO GRAVADO  : "
                        @ 4,3 SAY "MONTO I.V.A.        : "
                        @ 5,3 SAY "MONTO IMPUESTO 1)   : "
                        @ 6,3 SAY "MONTO IMPUESTO 2)   : "
                        @ 7,3 SAY "MONTO EXENTO        : "
                        @ 8,3 SAY "MONTO TOTAL DEBITO  : "
                        @ 1,24 GET m->montotot  PICT picu2
                        @ 2,24 GET m->descuento PICT picu2
                        READ
                        m->montobru = m->montotot - m->descuento
                        @ 3,24 SAY TRAN(m->montobru,picu2)
                        m->montoiva = m->montobru * xaciva(1,2) / 100
                        m->montoot2 = m->montobru * xaciva(1,4) / 100
                        m->montoot3 = m->montobru * xaciva(1,6) / 100
                        @ 4,24 GET m->montoiva  PICT picu2
                        @ 5,24 GET m->montoot2  PICT picu2
                        @ 6,24 GET m->montoot3  PICT picu2
                        @ 7,24 GET m->montoexe  PICT picu2
                        READ
                        m->montonet = m->montobru + m->montoiva + m->montoot2 + m->montoot3 + m->montoexe
                        @ 8,24 SAY TRAN(m->montonet,picu2)
                        STORE montonet TO monto
                        IF confirma("la nota de debito",.T.,4,10)
                           ACTI SCRE
                           @ 24,0 SAY PADC(grabando,80,'*') COLO SCHE 19
                           SELE far
                           GO regfar
                           SELE ccp
                           DO flok WITH "ccp"
                           APPE BLAN
                           m->fechaop  = m->fechaem
                           m->detalle  = "NOTA DEVOL N§"+ALLTRIM(STR(m->debito))
                           m->compr    = "F.A. "+ALLTRIM(STR(m->factura))
                           m->comprre  = "ND"
                           m->numerore = m->debito
                           m->fechave  = m->fechaem
                           m->equivale = IIF(far->moneda=xadols,m->monto/far->cotiz,m->monto)
                           m->tipo = ' '
                           GATH MEMV
                           DO repuse
                           UNLO IN ccp
                           SELE fad
                           IF SEEK(STR(far->factura)+far->procod)
                              niuno = .T.
                              SCAN FOR far->factura=fad->factura .AND. far->procod=fad->procod .AND. fad->devuelta < fad->cantidad
                                 niuno=.F.
                                 EXIT
                              ENDS
                           ENDI
                           SELE far
                           DO flok WITH "far"
                           REPL anulada WITH niuno
                           DO repuse
                           APPE BLAN
                           STORE -(m->montonet)  TO m->monto
                           STORE -(m->descuento) TO m->descuento
                           STORE -(m->montobru) TO m->montobru
                           STORE -(m->montoiva) TO m->montoiva
                           STORE -(m->montoot2) TO m->montoot2
                           STORE -(m->montoot3) TO m->montoot3
                           STORE -(m->montonet) TO m->montonet
                           STORE -(m->montoexe) TO m->montoexe
                           GATH MEMV
                           REPL tipo  WITH "ND"
                           REPL factura WITH m->debito
                           DO repuse
                           UNLO IN far
                           SELE fad
                           SCAN FOR far->factura=factura .AND. far->procod=procod
                              IF tipopec="M"
                                 SELE pre
                                 formu=LEFT(fad->articulo,13)+RIGHT("000"+ALLTRIM(STR(fad->talle*10)),3)
                                 IF SEEK(formu)
                                    REPL stock WITH stock - fad->cantidad
                                 ENDI
                                 SELE kar
                                 APPE BLAN
                                 REPL fechaop WITH m->fechaem
                                 REPL articulo WITH formu
                                 REPL opk WITH 5
                                 REPL docref WITH 'ND'
                                 REPL nrodocref WITH m->debito
                                 REPL cliente WITH procod
                                 REPL detalle WITH 'Devolucion Nø:'+ALLTRIM(STR(m->debito))
                                 REPL salida WITH fad->cantidad
                                 REPL proveedor WITH .T.
                                 DO repuse
                              ELSE
                                 IF tipopec="T"
                                    SELE tel
                                    IF SEEK (LEFT(fad->articulo,10))
                                       REPL stock WITH stock - fad->cantidad
                                       DO repuse
                                    ENDIF
                                    SELE kar
                                    APPEND BLANK
                                    REPL articulo WITH tel->telcod
                                    REPL unidad WITH tel->unidad
                                 ELSE
                                    IF tipopec="A"
                                       SELE avi
                                       IF SEEK (LEFT(fad->articulo,10))
                                          REPL stock WITH stock - fad->cantidad
                                          DO repuse
                                       ENDIF
                                       SELE kar
                                       APPEND BLANK
                                       REPL articulo WITH avi->avicod
                                       REPL unidad WITH avi->unidad
                                    ELSE
                                       SELE kar
                                       APPEND BLANK
                                       REPL articulo WITH fad->articulo
                                       REPL unidad WITH m->unidad
                                    ENDI
                                 ENDI
                                 REPL fechaop WITH m->fechaem
                                 REPL opk WITH 5
                                 REPL detalle WITH 'Devolucion Nø:'+ALLTRIM(STR(fad->factura))
                                 REPL salida WITH fad->cantidad
                                 REPL numero WITH fad->factura
                                 REPL proveedor WITH pro->procod
                                 REPL proveedor WITH .T.
                                 DO repuse
                              ENDI
                              SELE fad
                           ENDS
                           UNLO IN fad
                        ELSE
                           SELE fad
                           DO flok WITH "fad"
                           ftb=LEFT(ftb,LEN(ftb)-1)
                           fts=LEFT(fts,LEN(fts)-1)
                           DO WHILE LEN(ftb) > 0
                              nada = AT(",",ftb)-1
                              IF nada>0
                                 nada1 = SUBSTR(ftb, 1, nada)
                                 ftb  = SUBSTR(ftb, nada+2)
                              ELSE
                                 nada1 = ftb
                                 ftb = ""
                              ENDIF
                              GO VAL(nada1) IN fad
                              m->cantidad = fad->cantidad
                              DELETE
                              nada = AT(",",fts)-1
                              IF nada>0
                                 nada1 = SUBSTR(fts, 1, nada)
                                 fts  = SUBSTR(fts, nada+2)
                              ELSE
                                 nada1 = fts
                                 fts = ""
                              ENDIF
                              GO VAL(nada1) IN fad
                              REPL devuelta WITH devuelta - m->cantidad
                           ENDDO
                           UNLO IN fad
                        ENDIF
                        RELE WIND win10
                     ENDIF
                  ENDIF
               ELSE
                  RELE WIND win10
               ENDIF
            ENDIF
         ENDIF
      ELSE
         DO iaud WITH 'ING ILEGAL '+ulpr
      ENDIF
      RETURN
      * EOF - INDENT
*: EOF: IDEBC2.PRG


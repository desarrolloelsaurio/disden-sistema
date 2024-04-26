********************************************************************************
*-- Programa: ECHE.PRG
*-- Fecha   : 10/18/91
*-- Version : V.LEEGSTRA
*-- Notas   : ENTREGA DE CHEQUES
********************************************************************************
SELE seg
STORE hora_ulp(PROGRAM()) TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   =iaud('INGRESO '+ulpr)
   DEFINE WINDOW win FROM 1,0 TO 23,79 TITL "Entrega de Cheques" COLOR SCHE 8
   ACTI WIND win
   DO WHILE .T.
      SELE pro
      GO TOP
      @ 5,5 SAY "Proveedor:"
      @ 7,5 SAY "N§ de la Factura a pagar:"
      STORE nul TO respuesta
      IF !EMPTY(elipro("-[ESC] para Salir",5,12))
        nacodpro=pro.procod
        naprove =pro.proveedor
        ACTI WIND win
        @ 5,16 GET naprove
        CLEA GETS
        SELE mar
        RESPUESTA=0
          ACTI WIND win
          STORE nul TO nafac
          @ 7,31 GET nafac PICTURE "9999999999";
           MESS "N§ de la Factura a pagar - Con nul Salir"
          READ
          IF EMPTY(nafac)
             RELE WIND win
             RETURN
          ELSE
             nada=STR(nafac)
             SELE far
             IF SEEK(nada)
               IF confirma("Los datos ingresados",.T.,15,35)
                 =men_lin("Elija el Cheque / Documento a Entregar")
                 ACTI WIND win
                 EXIT
               ENDIF
             ELSE
               @ 9,5 SAY "FACTURA INEXISTENTE - CORRIJA E INTENTE NUEVAMENTE"
               =INKEY(nul,"HM")
               CLEA
               LOOP
             ENDIF
          ENDIF
      ELSE
        RELE WIND win
        RETURN
      ENDIF
   ENDDO
   ff=""
   c1=1
   c2=16
   c3=31
   c4=45
   c5=52
   c6=59
   ACTI WIND win
   CLEA
   SELE cch
   GO TOP
   STORE xacotiz TO nacotiz
   STORE DATE() TO nafec
   cuantos=0
   SCAN WHILE !EOF()
      IF EMPTY(cch.fechaac) .AND. cch.entregado=.F.
         STORE ff+ALLTRIM(STR(RECNO()))+"," TO ff
      ENDIF
   ENDSCAN
   STORE LEFT(ff,LEN(ff)-1) TO ff
   IF LEN(ff)>0
      cuantos=OCCURS(",",ff)+1
      registro=ff
      =lock(registro,"cch") .or. lok("cch")
   ELSE
      RELE WIND win
      UNLO IN cch
      RETURN
   ENDIF
   DIME cheque[cuantos]
   SELE cch
   GO TOP
   SCAT MEMVAR
   desdecual = 1
   ncheen=""
   CONTI=.T.
   DO WHILE CONTI
      DO MACR WITH ff, desdecual
      hastacual=desdecual+13
      IF hastacual>cuantos
         hastacual=cuantos
      ENDIF
      ren=1
      ii=1
      FOR I=desdecual TO hastacual
         nada=IIF(I=1,1,AT(",",ff,I-1)+1)
         nada1=IIF(I=cuantos,LEN(ff)+1,AT(",",ff,I))
         ENDIF
         GO VAL(SUBSTR(ff, nada, nada1-nada)) IN cch
         cheque[II]=LEFT(cch.nroche,15)
         ren=ren+1
         ii=ii+1
      NEXT
      DO WHILE .T.
         FOR I=1 TO ii-1
            @ I ,c1 PROMPT cheque[I]
         NEXT
         @ 20, 5 PROMPT "\<ANTERIOR"
         @ 20,20 PROMPT "\<SALIR"
         @ 20,35 PROMPT "\<POSTERIOR"
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
                  CONTI=.F.
                  EXIT
               ELSE
                  IF opcion = ii+2
                     IF desdecual+14<=cuantos
                        desdecual=desdecual+14
                     ELSE
                        LOOP
                     ENDIF
                  ELSE
                     IF opcion = ii+3
                     ELSE
                        I = opcion + desdecual - 1
                        nada=IIF(I=1,1,AT(",",ff,I-1)+1)
                        nada1=IIF(I=cuantos,LEN(ff)+1,AT(",",ff,I))
                        GO VAL(SUBSTR(ff, nada, nada1-nada))
                        SCAT MEMV
                        IF m.entregado=.T.
                           @ opcion,c2 SAY "Cheque YA entregado. De [ENTER] y contin£e."
                           =INKEY(0)
                           @ opcion,c2 CLEAR TO opcion,75
                           @ ren ,c2 GET m.banco
                           @ ren,c3 GET m.monto
                           nada=LEFT(IIF(m.moneda=LEFT(xadols,1),xadols,xauss),6)
                           @ ren, c4 GET nada
                           nadx=IIF(m.entregado,'  SI','  NO')
                           @ ren, c5 GET nadx
									SELE PER
                           NADA=PADR(IIF(SEEK(m.codcli),PER.cliente,"NO EXISTE"),18)
                              @ ren, c6 GET nada
                           CLEAR GETS
                           SELE cch
                           LOOP
                        ENDIF
                        ren = opcion
                        @ ren ,c1 GET m.nroche
                        @ ren ,c2 GET m.banco
                        @ ren,c3 GET m.monto
                        nada=LEFT(IIF(m.moneda=LEFT(xadols,1),xadols,xauss),6)
                        @ ren, c4 GET nada
                        nadx=IIF(m.entregado,'  SI','  NO')
                        @ ren, c5 GET nadx
								SELE PER
                        IF SEEK(m.codcli)
                          nada=LEFT(PER.cliente,18)
                          @ ren, c6 GET nada
                        ELSE
                          STORE PADL("NO EXISTE",18) TO nada
                          @ ren, c6 GET nada
                        ENDIF
                        SELE cch
                        CLEAR GETS
                        IF m.tipo="CH"
                           nadocu="Cheque"
                        ELSE
                           IF m.tipo="DO"
                              nadocu="Documento"
                           ENDIF
                        ENDIF
                        IF confirma("el "+nadocu,.T., 20,45)
                           ACTI SCRE
                           CLEA
                           ACTI WIND WIN
                           ncheen=ncheen+ALLTRIM(STR(RECNO()))+","
                           nadacli=m.codcli
                           SELE cch
                           REPL cch.entregado WITH .T.
                           nadx='  SI'
                           @ ren, c5 GET nadx
                           CLEA GETS
                           SELE ccp
                           APPE BLANK
                           REPL ccp.procod WITH nacodpro, ccp.fechaop WITH DATE(), ccp.fechave WITH DATE()
                           REPL ccp.detalle WITH m.banco, ccp.compr WITH "FA.N§"+alltrim(str(nafac))
                           REPL ccp.comprre WITH m.tipo, ccp.numerore WITH VAL(m.nroche)
                           REPL ccp.monto WITH m.monto, ccp.moneda WITH m.moneda, ccp.equivale WITH m.equivale
													 =repuse()
                           SELE cch
                        ELSE
                           ACTI WIND win
                           @ ren,c2 CLEAR TO ren,78
                           @ ren ,c1 SAY m.nroche
                           @ ren ,c2 SAY m.banco
                           @ ren,c3 SAY m.monto
                           @ ren, c4 SAY LEFT(IIF(m.moneda=LEFT(xadols,1),xadols,xauss),6)
                           nadx=IIF(m.entregado,'  SI','  NO')
                           @ ren, c5 SAY nadx
									SELE PER
                           @ ren, c6 SAY IIF(SEEK(m.codcli),LEFT(PER.cliente,18),PADL("NO EXISTE",18))
                           SELE cch
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
         ENDIF
         IF opcion = ii+1 .OR. cuantos=0
            UNLO IN cch
            EXIT
         ENDIF
      ENDDO
   ENDDO
   STORE LEFT(ncheen,LEN(ncheen)-1) TO ncheen
   acti scre
   IF !EMPTY(ncheen)
     DO LCHEI1 WITH ncheen
   ENDIF
ELSE
   =iaudi()
ENDIF
RELE WIND win
=men_lin(botom)
RETURN
*: EOF: ECHE.PRG

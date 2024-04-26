********************************************************************************
*-- Programa: IACRE.PRG
*-- Fecha   : 09/16/91
*-- Version : V.LEEGSTRA
*-- Notas   : INGRESO CHEQUES ACREDITADOS
********************************************************************************
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   DO iaud WITH 'INGRESO '+ulpr
   @ 0,rh SAY TIME() COLOR I
   @ 0,rp SAY PADC(ulPR,10) COLOR I
	SELE PER
   set order to 2
   CLEA
   DEFINE WINDOW win FROM 1,0 TO 24,79 TITL " Acreditacion de Cheques" SHAD COLOR SCHE 8
   ACTI WIND win
   SELE cch
   GO TOP
   ff=""
   c1=1
   c2=16
   c3=31
   c4=45
   c5=52
   c6=59
   STORE xacotiz TO nacotiz
   STORE DATE() TO nafec
   cuantos=0
   SCAN WHILE !EOF()
      IF EMPTY(cch.fechaac) .AND. !cch.entregado
         STORE ff+ALLTRIM(STR(RECNO()))+"," TO ff
      ENDIF
   ENDSCAN
   STORE LEFT(ff,LEN(ff)-1) TO ff
   IF LEN(ff)>0
      cuantos=OCCURS(",",ff)+1
      DO WHILE .T.
         IF RLOCK(ff,"cch")
            EXIT
         ELSE
            @ 24,0 SAY PADC(" Tratando de Bloquear los Registros a Actualizar",80,'*') COLO SCHE 19
         ENDIF
      ENDDO
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
   ncheacr=""
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
         GO VAL(SUBSTR(ff, nada, nada1-nada)) IN cch
         cheque[II]=LEFT(cch.nroche,15)
         ren=ren+1
         ii=ii+1
      NEXT
      DO WHILE .T.
         FOR I=1 TO ii-1
            @ I ,c1 PROMPT cheque[I]
         NEXT
         @ 21, 5 PROMPT "\<ANTERIOR"
         @ 21,20 PROMPT "\<SALIR"
         @ 21,35 PROMPT "\<POSTERIOR"
         @ 21,50 PROMPT "\<CAMBIA COTIZACION/FECHA"
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
                        DO WHILE .T.
                           @ 20,5 SAY "Cotizaci¢n: " GET nacotiz PICTURE "9999999999.99";
                              MESS "Cotizaci¢n"
                           @ 20,40 SAY "Fecha de acreditaci¢n: " GET nafec PICTURE "@D";
                              MESS "Fecha de acreditaci¢n"
                           READ
                           IF confirma("Los valores ingresados",.T.,16,30)
                              @ 20,0 SAY SPACE(80)
                              EXIT
                           ENDIF
                        ENDDO
                     ELSE
                        I = opcion + desdecual - 1
                        nada=IIF(I=1,1,AT(",",ff,I-1)+1)
                        nada1=IIF(I=cuantos,LEN(ff)+1,AT(",",ff,I))
                        GO VAL(SUBSTR(ff, nada, nada1-nada))
                        SCAT MEMV
                        IF m.fechaac#{}
                           @ opcion,c2 SAY "Cheque YA acreditado. De [ENTER] y contin£e."
                           =INKEY(0)
                           @ opcion,c2 CLEAR TO opcion,75
                           @ ren ,c2 GET m.banco
                           @ ren,c3 GET m.monto
                           IF m.moneda=LEFT(xadols,1)
                              nada=LEFT(xadols,6)
                              @ ren, c4 GET nada
                           ELSE
                              nada=LEFT(xauss,6)
                              @ ren, c4 GET nada
                           ENDIF
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
                           CLEAR GETS
                           SELE cch
                           LOOP
                        ENDIF
                        ren = opcion
                        @ ren ,c1 GET m.nroche
                        @ ren ,c2 GET m.banco
                        @ ren,c3 GET m.monto
                        IF m.moneda=LEFT(xadols,1)
                           nada=LEFT(xadols,6)
                           @ ren, c4 GET nada
                        ELSE
                           nada=LEFT(xauss,6)
                           @ ren, c4 GET nada
                        ENDIF
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
                           ncheacr=ncheacr+ALLTRIM(STR(RECNO()))+","
                           naregi=STR(RECNO())
                           nadacli=m.codcli
                           SELE ccl
                           STORE 0 TO natopa,deuest,nadacafa
                           SUM ccl.equivale TO natopa FOR (ccl.codcli=nadacli .AND. ccl.comprre="RE" .AND. ccl.pagada=.F.)
                           GO TOP
                           SCAN FOR (ccl.codcli=m.codcli .AND. (ccl.fechave=DATE() .OR. ccl.fechave<DATE()) .AND. ccl.pagada=.F. .AND. ccl.comprre="FA")
                             STORE deuest+ccl.equivale TO deuest
                             STORE nadacafa+1 TO nadacafa
                           ENDSCAN
                           IF nadacafa=0
                              EXIT
                           ENDIF
                           DIME deuda[nadacafa,4]
                           STORE 0 TO DEUDA
                           I=1
                           GO TOP
                           SCAN WHILE ccl.codcli=nadacli
                              IF !EMPTY(ccl.codcli) .AND. (ccl.fechave<DATE() .OR. ccl.fechave=DATE()).AND. ccl.comprre="FA" .AND. !ccl.pagada
                                 STORE ccl.comprre TO deuda[I,1]
                                 STORE ccl.numerore TO deuda[I,2]
                                 STORE ccl.equivale TO deuda[I,3]
                                 STORE RECNO() TO deuda[I,4]
                                 I=I+1
                              ENDIF
                           ENDSCAN
                           GO TOP
                           SCAN WHILE ccl.codcli#nadacli .OR. ccl.pagada=.T.
                           ENDSCAN
                           nadrest=''
                           SCAN WHILE ccl.codcli=nadacli
                              IF (ccl.comprre="RE" .AND. ccl.pagada=.F.)
                                 nadrest=nadrest+ALLTRIM(STR(RECNO()))+','
                              ENDIF
                           ENDSCAN
                           K=1
                           I=0
                           naresto=0
                           SELE cch
                           DO WHILE .T.
                              IF RLOCK(naregi,"cch")
                                 STORE .T. TO vez
                                 IF naresto<0 .OR. naresto=0
                                    STORE cch.equivale TO naresto
                                 ENDIF
                                 STORE .T. TO otra,sigue
                                 DO WHILE sigue
                                    SELE cch
                                    IF otra
                                       IF vez
                                          STORE deuda[k,3]-natopa TO nadeu
                                          STORE .F. TO vez
                                       ELSE
                                          STORE deuda[k,3] TO nadeu
                                       ENDIF
                                       STORE .F. TO otra
                                    ENDIF
                                    SELE fac
                                    IF SEEK(STR(deuda[k,2]))
                                       STORE fac.marca TO numarca
                                       SELE cch
                                       IF nadeu>naresto
                                          nadeu=nadeu-naresto
                                          IF cch.moneda#LEFT(xadols,1)
                                             STORE cch.monto/nacotiz TO naequi
                                          ELSE
                                             STORE cch.monto TO naequi
                                          ENDIF
                                          STORE cch.moneda TO namoneda
                                          REPL cch.compre WITH deuda[K,1], cch.numere WITH deuda[K,2]
                                          REPL cch.fechaac WITH nafec, cch.equivale WITH naequi
                                          REPL cch.fecha WITH DATE(), cch.usuario WITH usador
                                          SELE ccl
                                          GOTO deuda[k,4]
                                          STORE ccl.fechave TO nadafeve
                                          STORE LEN(cch.compr) TO nada
                                          STORE AT("§",cch.compr) TO nadanu
                                          STORE VAL(RIGHT(cch.compr,nada-nadanu)) TO nadare
                                          STORE "ACR. CHEQUE - "+ALLTRIM(ccl.comprre)+ALLTRIM(STR(ccl.numerore)) TO nadadeta
                                          STORE "FAC.N§"+STR(deuda[k,2],9) TO nadacomp
                                          APPE BLANK
                                          STORE naresto*nacotiz TO nadamont
                                          REPL ccl.codcli WITH nadacli, ccl.fechaop WITH DATE(), ccl.fechave WITH nadafeve
                                          REPL ccl.detalle WITH nadadeta, ccl.compr WITH nadacomp, ccl.comprre WITH "RE"
                                          REPL ccl.numerore WITH nadare, ccl.monto WITH nadamont, ccl.moneda WITH namoneda
                                          REPL ccl.equivale WITH naresto
                                          REPL ccl.fecha WITH DATE(), ccl.usuario WITH usador
                                          nadrest=nadrest+ALLTRIM(STR(RECNO()))+","
                                          SELE cch
                                          STORE .F. TO sigue
                                       ELSE
                                          IF m.moneda#LEFT(xadols,1)
                                             STORE m.monto/nacotiz TO m.equivale
                                          ENDIF
                                          STORE cch.moneda TO namoneda
                                          STORE LEN(cch.compr) TO nada
                                          STORE AT("§",cch.compr) TO nadanu
                                          STORE VAL(RIGHT(cch.compr,nada-nadanu)) TO nadare
                                          STORE "FAC.N§"+STR(deuda[k,2],9) TO nadacomp
                                          REPL cch.fechaac WITH nafec, cch.equivale WITH m.equivale
                                          REPL cch.fecha WITH DATE(), cch.usuario WITH m.usador
                                          SELE ccl
                                          GOTO deuda[k,4]
                                          STORE ccl.fechave TO nadafeve
                                          STORE "ACR. CHEQUE - "+ALLTRIM(ccl.comprre)+ALLTRIM(STR(ccl.numerore)) TO nadadeta
                                          REPL ccl.pagada WITH .T.
                                          APPE BLANK
                                          STORE nadeu*nacotiz TO nadamont
                                          REPL ccl.codcli WITH nadacli, ccl.fechaop WITH nafec, ccl.fechave WITH nadafeve
                                          REPL ccl.detalle WITH nadadeta, ccl.compr WITH nadacomp, ccl.comprre WITH "RE"
                                          REPL ccl.numerore WITH nadare, ccl.monto WITH nadamont, ccl.moneda WITH namoneda
                                          REPL ccl.equivale WITH nadeu, ccl.pagada WITH .T.
                                          REPL ccl.fecha WITH DATE(), ccl.usuario WITH usador
                                          STORE naresto-nadeu TO naresto
                                          IF naresto>0
                                             otra=.T.
                                             K=K+1
                                          ENDIF
                                          IF !EMPTY(nadrest)
                                             SELE ccl
                                             STORE 1 TO nada1
                                             STORE 0 TO J
                                             STORE LEFT(nadrest,LEN(nadrest)-1) TO nadrest,nada10
                                             DO WHILE !J>OCCUR(",",nada10)
                                                IF J<OCCUR(",",nada10)
                                                   STORE AT(",",nadrest) TO nada
                                                   IF !EMPTY(nada)
                                                      STORE nada-nada1 TO nada2
                                                      STORE SUBSTR(nadrest,nada1,nada2) TO nadpos
                                                      STORE SUBSTR(nadrest,nada+1,LEN(nadrest)-nada) TO nadrest
                                                      GOTO VAL(nadpos)
                                                   ELSE
                                                      GOTO VAL(nadrest)
                                                   ENDIF
                                                   REPL ccl.pagada WITH .T.
                                                   J=J+1
                                                ELSE
                                                   GOTO VAL(nadrest)
                                                   REPL ccl.pagada WITH .T.
                                                   j=j+1
                                                   STORE .F. TO sigue
                                                   EXIT
                                                ENDIF
                                             ENDDO
                                          ENDIF
                                          SELE cch
                                          IF K>nadacafa
                                             sigue=.F.
                                          ENDIF
                                       ENDIF
                                    ELSE
                                       @ 21,0 SAY PADC(' FACTURA:'+ALLTRIM(STR(deuda[K,2]))+' INEXISTENTE EN EL ARCHIVO DE FACTURAS ',80,'*') COLO SCHE 19
                                       =INKEY(0)
                                       STORE .F. TO sigue
                                       EXIT
                                    ENDIF
                                 ENDDO
                                 IF !sigue
                                    EXIT
                                 ENDIF
                              ELSE
                                 @ 21,0 SAY PADC('Tratando de lockear el registro.',80,'*') COLO SCHE 19
                              ENDIF
                           ENDDO
                           STORE 0 TO respuesta
                           IF !EMPTY(eliban("Lugar en que se acredita el "+nadocu,15,15))
                              SELE caj
                              APPE BLANK
                              m.fechaop=date()
                              m.caja=respuesta
                              gath memv
                              do repuse
                           ENDIF
                           SELE cch
                           ACTI WIND win
                        ELSE
                           ACTI WIND win
                           @ ren,c2 CLEAR TO ren,78
                           @ ren ,c1 SAY m.nroche
                           @ ren ,c2 SAY m.banco
                           @ ren,c3 SAY m.monto
                           @ ren ,c4 SAY LEFT(IIF(m.moneda=LEFT(xadols,1),xadols,xauss),6)
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
   STORE LEFT(ncheacr,LEN(ncheacr)-1) TO ncheacr
*   acti scre
   IF !EMPTY(ncheacr)
     DO LACRI WITH ncheacr
   ENDIF
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
RELE WIND win
*ACTI SCREE
@ 24,0 say "  "+repl("°",78)
RETURN
*: EOF: IACRE.PRG

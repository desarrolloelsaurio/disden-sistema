********************************************************************************
*-- Programa: CCHE.PRG
*-- Fecha   : 10/17/91
*-- Version : V.LEEGSTRA
*-- Notas   : CAMBIO DATOS DE CHEQUES
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   DO iaud WITH 'INGRESO '+ulpr
	SELE PER
   set order to 2
   CLEA
* no ****  DO win0
   DEFINE WINDOW win FROM 1,0 TO 23,79 TITL " Correcci¢n de Cheques" COLOR SCHE 8
   ACTI WIND win
   SELE cch
   GO TOP
   ff=""
   c1=1
   c2=16
   c3=31
   c4=45
   c5=52
   c6=61
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
      DO lok WITH "cch"
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
   nchemod=""
   CONTI=.T.
   DO WHILE CONTI
      DO MACR1 WITH ff, desdecual
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
         @ 20,15 PROMPT "\<ANTERIOR"
         @ 20,30 PROMPT "\<SALIR"
         @ 20,45 PROMPT "\<POSTERIOR"
**       @ 20,50 PROMPT "\<CAMBIA COTIZACION/FECHA"
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
*                    IF opcion = ii+3
*                       DO WHILE .T.
*                          @ 19,5 SAY "Cotizaci¢n: " GET nacotiz PICTURE "9999999999.99";
*                             MESS "Cotizaci¢n"
*                          @ 19,40 SAY "Fecha de acreditaci¢n: " GET nafec PICTURE "@D";
*                             MESS "Fecha de acreditaci¢n"
*                          READ
*                          IF confirma("Los valores ingresados",.T.,16,30)
*                             @ 19,0 SAY SPACE(80)
*                             EXIT
*                          ENDIF
*                       ENDDO
*                    ELSE
                        I = opcion + desdecual - 1
                        nada=IIF(I=1,1,AT(",",ff,I-1)+1)
                        nada1=IIF(I=cuantos,LEN(ff)+1,AT(",",ff,I))
                        GO VAL(SUBSTR(ff, nada, nada1-nada))
                        SCAT MEMV
                        ren = opcion
                        @ ren ,c1 GET m.nroche
                        @ ren ,c2 GET m.banco
                        @ ren,c3 GET m.monto
                        nada=LEFT(IIF(m.moneda=LEFT(xadols,1),xadols,xauss),6)
                           @ ren, c4 GET nada
                        nadx=DTOC(m.fechade)
                        @ ren, c5 GET nadx
								SELE PER
                        IF SEEK(m.codcli)
                          nada=LEFT(PER.cliente,16)
                        ELSE
                          STORE PADL("NO EXISTE",16) TO nada
                        ENDIF
                          @ ren, c6 GET nada
                        CLEA GETS
                        SELE cch
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
                           ACTI WIND win
                           nchemod=nchemod+ALLTRIM(STR(RECNO()))+","
                           naregi=STR(RECNO())
                           SELE cch
                           registro=naregi
                           DO lok WITH "cch"
                           STORE m.nroche TO nanroche
                           STORE m.banco TO nabanco
                           STORE m.monto TO namonto
                           STORE m.fechade TO nafecde
                           @ ren ,c1 GET nanroche MESS "Cambia el N§ del "+ALLTRIM(nadocu)
                           @ ren ,c2 GET nabanco MESS "Modifica y [ENTER] para cambiar el Banco"
                           READ
                           IF UPDATED() .AND. m.tipo="CH"
                             STORE nul TO respuesta
                             IF !EMPTY(eliban(" ",ren,c2))
                               STORE mix.texto1 TO m.banco
                               ACTI WIND win
                               @ ren ,c2 GET m.banco
                               CLEA GETS
                               SELE cch
                             ENDIF
                           ELSE
                             STORE nabanco TO m.banco
                           ENDIF
                           @ ren,c3 GET namonto MESS "Monto del "+ALLTRIM(nadocu)
                           namo=LEFT(IIF(m.moneda=LEFT(xadols,1),xadols,xauss),6)
                           STORE "@M "+Alltrim(xauss)+","+Alltrim(xadols) TO nn
                           @ ren, c4 GET namo PICTURE NN MESS "Moneda del "+ALLTRIM(nadocu)
                           READ
                           IF namo=LEFT(xauss,1)
                              STORE XACOTIZ TO nacotiz
                              @ 19,5 SAY "Cotizaci¢n: " GET nacotiz PICTURE "9999999999.99";
                               MESS "Cotizaci¢n"
                              READ
                              @ 19,5 SAY SPACE(25)
                           ENDIF
                           nadx=DTOC(m.fechade)
                           @ ren, c5 GET nadx PICTURE "@D" MESS "Fecha de dep¢sito"
                           READ
                           STORE m.diasac TO nadiasac
                           @ 19,5 SAY "Horas de Acreditaci¢n: " GET nadiasac PICTURE "9999999999";
                             MESS "Horas de Acreditaci¢n"
                           READ
                           @ 19,5 SAY SPACE(45)
									SELE PER
                           IF SEEK(m.codcli)
                             nada=LEFT(PER.cliente,16)
                           ELSE
                             STORE PADL("NO EXISTE",16) TO nada
                           ENDIF
                           STORE nada TO nada1
                           @ ren, c6 GET nada1 MESS "Modifica y [ENTER] para cambiar el Cliente"
                           READ
                           IF nada#nada1
                              STORE nul TO respuesta
                              IF !EMPTY(elicli("que entreg¢ el "+ALLTRIM(nadocu),ren,c6))
                                 STORE LEFT(PER.cliente,16) TO nada
                                 STORE PER.codcli TO m.codcli
                                 SELE cch
                                 ACTI WIND win
                                 @ ren, c6 GET nada
                                 CLEA GETS
                              ENDIF
                           ENDIF
                           SELE cch
                           IF m.tipo="CH"
                              nadocu="Cheque"
                           ELSE
                              IF m.tipo="DO"
                                 nadocu="Documento"
                              ENDIF
                           ENDIF
                           ACTI WIND win
                           MM="@M "+"CHEQUE   "+","+"DOCUMENTO"
                           @ 19,5 SAY "Tipo : " GET nadocu PICTURE MM;
                              MESS "Cheque o Documento"
                           READ
                           @ 19,5 SAY SPACE(20)
                           IF confirma("Los valores ingresados",.T.,16,30)
                              ACTI SCRE
                              CLEA
                              ACTI WIND win
                              STORE nanroche TO m.nroche
                              STORE namonto TO m.monto
                              STORE LEFT(namo,1) TO m.moneda
                              STORE CTOD(nadx) TO m.fechade
                              STORE LEFT(nadocu,2) TO m.tipo
                              STORE nadiasac TO m.diasac
                              STORE IIF(namo=LEFT(xauss,1),ROUND(namonto*nacotiz,2),namonto) TO m.equivale
                              GATH MEMV
                              DO repuse
                              cheque[I]=LEFT(m.nroche,15)
                           ENDIF
                           ACTI WIND win
                        ELSE
                           ACTI WIND win
                           @ ren,c2 CLEAR TO ren,78
                           @ ren ,c1 SAY m.nroche
                           @ ren ,c2 SAY m.banco
                           @ ren,c3 SAY m.monto
                           @ ren ,c4 SAY LEFT(IIF(m.moneda=LEFT(xadols,1),xadols,xauss),6)
                           nadx=DTOS(m.fechade)
                           @ ren, c5 SAY nadx
									SELE PER
                           SET ORDER TO TAG CODCLI
                           @ ren, c6 SAY IIF(SEEK(m.codcli),LEFT(PER.cliente,18),PADL("NO EXISTE",18))
                           ENDIF
                           SELE cch
                        ENDIF
*                    ENDIF
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
   STORE LEFT(nchemod,LEN(nchemod)-1) TO nchemod
   acti scre
   IF !EMPTY(nchemod)
     DO LCHEI WITH nchemod
   ENDIF
ELSE
=IAUDI()
ENDIF
RETURN RELEWIN("WIN") .AND. MEN_LIN(BOTOM)

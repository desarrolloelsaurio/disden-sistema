*:*********************************************************************
*-- Programa: CPE11.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : R. 'EL BATA'
*-- Notas   : MODIFICA UNA LINEA DE LA NOTA DE PEDIDO de proveedores
*:**********************************************************************
DECLARE produto[16]
SELE pec
STOR RECNO() TO ff
registro=STR(ff)
SCAT MEMV
STORE productiva TO tipopec
SELE seg
STOR HORA_ULP(PROGRAM()) TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   DEFI WIND win  FROM 5,10 TO 17,60 TITL " NOTA DE PEDIDO "  SHAD COLOR SCHE 8
   DO lok WITH 'PEC'
   kok=0
   STOR 19 TO COL
   SELE pe1
   ft=""
   ft2=""
   SCAN FOR pedido=m->pedido .AND. marca=m->marca
      IF entregado<cantidad
         ft=ft+ALLTRIM(STR(RECNO()))+","
      ENDI
      ft2=ft2+ALLTRIM(STR(RECNO()))+","
   ENDS
   ft2=SINULT(FT2)
   IF LEN(ft)>0
      ft=SINULT(FT)
      cuantos=OCCURS(",",ft)+1
      registro=ft
      DO lok WITH 'PE1'
   ENDI
   SELE pec
   SCAT MEMVAR
   IF EMPTY(pec->fechaent)
      desdecual=1
      DO WHIL .T.
         DO mpec WITH ft, desdecual
         hastacual=desdecual+13
         IF hastacual>cuantos
            hastacual=cuantos
         ENDI
         ren=10
         ii=1
         FOR I=desdecual TO hastacual
            nada=IIF(I=1,1,AT(",",ft,I-1)+1)
            nada1=IIF(I=cuantos,LEN(ft)+1,AT(",",ft,I))
            GO VAL(SUBSTR(ft, nada, nada1-nada)) IN pe1
            produto[II]=LEFT(pe1->articulo,13)
            ren=ren+1
            ii=ii+1
            NEXT
            DO WHIL .T.
               FOR I=1 TO ii-1
                  @ I+9 ,c1 PROMPT produto[I]
                  NEXT
                  @ 24, 30 PROMPT "\<ANTERIOR"
                  @ 24, 45 PROMPT "\<SALIR"
                  @ 24, 60 PROMPT "\<POSTERIOR"
                  opcion=0
                  MENU TO opcion
                  IF !EMPTY(opcion)
                     IF opcion=ii
                        IF desdecual-14>=1
                           desdecual=desdecual-14
                        ELSE
                           LOOP
                        ENDI
                     ELSE
                        IF opcion=ii+1
                           EXIT
                        ELSE
                           IF opcion=ii+2
                              IF desdecual+14<=cuantos
                                 desdecual=desdecual+14
                              ELSE
                                 LOOP
                              ENDI
                           ELSE
                              SELE pe1
                              I=opcion + desdecual - 1
                              nada=IIF(I=1,1,AT(",",ft,I-1)+1)
                              nada1=IIF(I=cuantos,LEN(ft)+1,AT(",",ft,I))
                              GO VAL(SUBSTR(ft, nada, nada1-nada))
                              SCAT MEMV
                              ren=opcion + 9
                              @ ren ,c1 GET m->articulo
                              @ ren ,c2 GET m->descripcio
                              @ ren, c3 GET m->talle        PICT "99.99"
                              @ ren, c4 GET unid(m->unidad) PICT "xxxxxx"
                              @ ren, c5 GET m->cantidad     PICT "@Z 9999999999"
                              CLEA GETS
                           ENDI
                           DO mpe1
                           @ 3,COL GET m->articulo
                           READ
                           IF updated()
                              IF tipopec="M"
                                 STORE nul TO respuesta
                                 IF !EMPTY(elimer("",3,COL))
                                    m->articulo   = mer->articulo
                                    m->descripcio = LEFT(mer->merca,29)
                                    ACTI WIND win
                                    @ 3,COL GET m->articulo
                                    @ 4,COL GET m->descripcio
                                    CLEAR GETS
                                    kok=kok+1
                                 ELSE
                                    m->descripcio = SPACE(29)
                                 ENDIF
                              ELSE
                                 IF tipopec = "X"
                                    ACTI WIND win2
                                    @ ren ,c1 GET m->articulo
                                    @ ren ,c2 GET m->descripcio
                                    READ
                                    kok=kok+1
                                 ELSE
                                    IF tipopec="T"
                                       STORE nul TO respuesta
                                       IF !EMPTY(elitel("",ren,c1))
                                          m->articulo   = tel->telcod
                                          m->descripcio = LEFT(tel->tela,29)
                                          ACTI WIND win
                                          @ 3,COL GET m->articulo
                                          @ 4,COL GET m->descripcio
                                          CLEAR GETS
                                          kok=kok+1
                                       ELSE
                                          m->descripcio = SPACE(29)
                                       ENDIF
                                    ELSE
                                       IF tipopec="A"
                                          STORE nul TO respuesta
                                          IF !EMPTY(eliavi("",ren,c1))
                                             m->articulo   = avi->avicod
                                             m->descripcio = LEFT(avi->avios,29)
                                             ACTI WIND win
                                             @ 3,COL GET m->articulo
                                             @ 4,COL GET m->descripcio
                                             CLEAR GETS
                                             kok=kok+1
                                          ELSE
                                             m->descripcio = SPACE(29)
                                          ENDIF
                                       ENDIF
                                    ENDIF
                                 ENDIF
                              ENDIF
                           ENDIF
                           DO WHIL .T.
                              @ 5,COL GET m->talle PICTURE "@Z 99.99"
                              READ
                              IF (m->talle<xatalmin .OR. m->talle>xatalmax) .AND. tipopec="M"
                                 DO cartel2 WITH "EL TALLE DEBE SER ENTRE "+ALLTRIM(STR(xatalmin)),""," Y "+ALLTRIM(STR(xatalmax)),""
                              ELSE
                                 kok=kok+1
                                 EXIT
                              ENDI
                           ENDDO
                           IF tipopec="X"
                              nada=unid(m->unidad)
                              @ 6,COL GET nada
                              READ
                              IF updated()
                                 m->unidad=eliuni("",6,COL)
                                 IF !EMPTY(m->unidad)
                                    kok=kok+1
                                 ENDI
                                 ACTI WIND win
                                 @ 6,COL GET unid(m->unidad)
                                 CLEAR GETS
                              ENDI
                           ENDIF
                           @ 7,COL GET m->cantidad PICT '@Z 9999999999'
                           READ
                           IF updated()
                              kok=kok+1
                              IF m->cantidad<entregado
                                 DO cartel2 WITH "NO PUEDE ENTREGAR UNA","CANTIDAD MAYOR QUE LA PEDIDA","",""
                                 LOOP
                              ENDI
                           ENDI
                           IF m->color>0
                              GO m->color IN mix
                              nada1=mix->texto1
                              @ 8,COL GET m->nada1
                              READ
                              IF updated()
                                 =elisue("",8,col)
                                 m.color=left(mix.texto2,2)
                                 kok=kok+1
                                 ACTI WIND win
                                 nada1=mix->texto1
                                 @ 8,COL GET m->nada1
                                 CLEAR GETS
                              ENDI
                           ENDI
                           IF kok>0
                              IF confirma("Modifica la nota de Pedido",.T.,20,0)
                                 IF pe1->entregado=0
                                    SELE pe1
                                    REPLACE articulo   WITH m->articulo
                                    REPLACE descripcio WITH m->descripcio
                                    REPLACE talle      WITH m->talle
                                    REPLACE unidad     WITH m->unidad
                                    REPLACE cantidad   WITH m->cantidad
                                    REPLACE COLOR      WITH m->color
                                    DO repuse
                                 ELSE
                                    DO cartel2 WITH "FUE PARCIALMENTE ENTREGADO","SE GENERARA UNA NUEVA LINEA","POR LA CANTIDAD PENDIENTE",""
                                    SELE pe1
                                    nada=cantidad-entregado
                                    REPLACE cantidad WITH entregado
                                    DO repuse
                                    m->cantidad=nada
                                    m->entregado=0
                                    SELE pe1
                                    APPEND BLANK
                                    GATH MEMV
                                    DO repuse
                                    nada=IIF(I=1,0,AT(",",ft,I-1))
                                    nada1=IIF(I=cuantos,LEN(ft)+1,AT(",",ft,I))
                                    ft=STUFF(ft, nada, nada1-nada,"")
                                    ft=ft+IIF(ft="","",",")+ALLTRIM(STR(RECNO()))
                                    UNLO IN pe1
                                    registro=ft
                                    DO lok WITH 'PE1'
                                 ENDI
                                 DEAC WIND win
                                 =iaud('REEMP. LIN PEC. '+STR(m->pedido)+mar->marca)
                                 SELE pe1
                              ENDI
                           ENDI
                        ENDI
                     ENDI
                  ENDI
                  EXIT
               ENDDO
               IF opcion=ii+1 .OR. cuantos=0
                  EXIT
               ENDI
            ENDDO
         ELSE
            DO mpec WITH ft2, 1
            DEFI WIND win10 FROM 21,5 TO 24,69 DOUB TITL ' *** MENSAJE *** ' SHAD COLO SCHE 8
            ACTI WIND win10
            @ 0,0 SAY PADC("FUE TOTALMENTE ENTREGADO",63)
            @ 1,0 SAY PADC("EL DIA "+DTOC(pec->fechaent),63)
            =INKEY(nul )
            RELE WIND win10
         ENDI
      ELSE
         =IAUDI()
      ENDI
      =RELEWIN("win")
      ACTI SCREE
=MEN_LIN(BOTOM)
      RETURN
*: EOF: CPE11.PRG


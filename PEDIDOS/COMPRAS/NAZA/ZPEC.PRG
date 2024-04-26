*:*********************************************************************
*-- Programa: ZPEC.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : INGRESA LINEAS DE NOTAS DE PEDIDO
*:**********************************************************************
SELE pec
m->unitario=busuni()
SCAT MEMV
STORE productiva TO tipopec
STORE RECNO() TO ff
registro=STR(ff)
SELE seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   @ 0,rh SAY TIME() COLOR I
   @ 0,rp SAY PADC(ulpr,10) COLOR I
   ACTI WIND win2
   CLEA
   DO lok WITH "pec"
   SELE pe1
   ft=""
   ft2=""
   SCAN FOR pedido=m->pedido .AND. procod=m->procod
      IF entregado=0
         ft=ft+ALLTRIM(STR(RECNO()))+","
      ENDIF
      ft2=ft2+ALLTRIM(STR(RECNO()))+","
   ENDSCAN
   ft2=SINULT(FT2)
   IF LEN(ft)>0
      ft=SINULT(FT)
      cuantos=OCCURS(",",ft)+1
      registro = ft
      DO lok WITH 'PE1'
      SELE pec
      STORE 17 TO COL
      SCAT MEMVAR
      IF EMPTY(pec->fechaent)
         desdecual = INT(cuantos/14)*14 + 1
         hastacual = cuantos
         DO mpec WITH ft, desdecual
         ren=11+hastacual-desdecual
         DO WHILE .T.
            nada=m->pedido
            SELE pe1
            SCAT MEMV BLANK
            STORE tipopec TO tipo
            m->pedido=nada
            m->procod = pro->procod
            m->marca = RECNO("MAR")
            STORE nul TO respuesta
            ACTI WIND win2
            IF ren>22
               DO WHILE ren>10
                  ren=ren-1
                  @ ren,c1 SAY SPACE(15)
                  @ ren,c2 SAY SPACE(29)
                  @ ren,c3 SAY SPACE(5)
                  @ ren,c4 SAY SPACE(6)
                  @ ren,c5 SAY SPACE(10)
                  @ ren,c6 SAY SPACE(7)
               ENDDO
            ENDIF
            IF tipopec="M"
               STORE nul TO respuesta
               IF !EMPTY(elimer("",ren,c1))
                  m->articulo   = mer->articulo
                  m->descripcio = mer->merca
                  ACTI WIND win2
                  @ ren ,c1 GET m->articulo
                  @ ren ,c2 GET m->descripcio
                  CLEAR GETS
               ELSE
                  m->descripcio = SPACE(29)
               ENDIF
            ELSE
               IF tipopec="T"
                  STORE nul TO respuesta
                  IF !EMPTY(elitel("",ren,c1))
                     m->articulo   = tel->telcod
                     m->descripcio = tel->tela
                     ACTI WIND win2
                     @ ren ,c1 GET m->articulo
                     @ ren ,c2 GET m->descripcio
                     CLEAR GETS
                  ELSE
                     m->descripcio = SPACE(29)
                  ENDIF
               ELSE
                  IF tipopec="A"
                     STORE nul TO respuesta
                     IF !EMPTY(eliavi("",ren,c1))
                        m->articulo   = avi->avicod
                        m->descripcio = avi->avios
                        ACTI WIND win2
                        @ ren ,c1 GET m->articulo
                        @ ren ,c2 GET m->descripcio
                        CLEAR GETS
                     ELSE
                        m->descripcio = SPACE(29)
                     ENDIF
                  ELSE
                     @ ren ,c1 GET m->articulo
                     @ ren ,c2 GET m->descripcio
                     READ
                  ENDIF
               ENDIF
            ENDIF
            IF m->descripcio#SPACE(29)
               nada = '  '
               ACTI WIND win2
               @ ren, c3 GET m->talle PICTURE "@Z 99.99"
               READ
               IF (m->talle < xatalmin .OR. m->talle > xatalmax) .AND. m->talle > 0
                  DO cartel2 WITH "EL TALLE DEBE SER ENTRE "+ALLTRIM(STR(xatalmin)),""," Y "+ALLTRIM(STR(xatalmax)),""
                  @ ren,c1 SAY SPACE(15)
                  @ ren,c2 SAY SPACE(29)
                  @ ren,c3 SAY SPACE(5)
                  LOOP
               ENDIF
               IF tipopec="X"
                  STORE nul TO respuesta
                  DO WHILE respuesta = 0
                     m->unidad = eliuni("",ren,c4)
                  ENDDO
               ELSE
                  IF tipopec = "T"
                     m->unidad = tel->unidad
                  ELSE
                     m->unidad=IIF(tipopec = "A",avi->unidad,m->unitario)
                  ENDIF
               ENDIF
               ACTI WIND win2
               @ ren, c4 GET unid(m->unidad) PICT "xxxxxx"
               CLEAR GETS
               @ ren, c5 GET m->cantidad PICT "@Z 9999999999"
               READ
               IF m->cantidad>0
                  IF tipopec = "M"
                     =xseek(SUBSTR(m->articulo,12,2),'mix','suecod')
                     m->color=IIF(EOF(),0,RECNO())
                  ELSE
                     SELE mix
                     STORE nul TO respuesta
                     m->color = elicol("", ren, c6)
                  ENDIF
                  IF m->color > 0
                     nada = LEFT(mix->texto1,7)
                     ACTI WIND win2
                     @ ren, c6 GET nada
                     CLEAR GETS
                  ENDIF
                  SELE pe1
                  ACTI SCRE
               ELSE
                  DO cartel2 WITH "DEBE TENER UNA CANTIDAD","","(NO PUEDE SER CERO)",""
                  @ ren,c1 SAY SPACE(15)
                  @ ren,c2 SAY SPACE(29)
                  @ ren,c3 SAY SPACE(11)
                  @ ren,c4 SAY SPACE(10)
               ENDIF
               IF confirma("Grabar la linea de la nota de pedido",.T.,10,10)
                  SELE pe1
                  ACTI SCRE
                  @ 24,0 SAY grabando COLO SCHE 19
                  DO flok WITH "pe1"
                  APPE BLAN
                  GATH MEMV
                  DO repuse
                  UNLO IN pe1
                  ft=ft+","+ALLTRIM(STR(RECNO()))
                  registro = ft
                  DO lok WITH 'PE1'
                  ren=ren+1
               ENDIF
            ELSE
               EXIT
            ENDIF
         ENDDO
      ELSE
         DO mpec WITH ft2, 1
         =MOVEWIN(21,5,24,69,'WIN10',' *** MENSAJE *** ')
         @ 0,0 SAY PADC("FUE TOTALMENTE ENTREGADO",63)
         @ 1,0 SAY PADC("EL DIA "+DTOC(pec->fechaent),63)
         =INKEY(nul)
         =RELEWIN("win10")
      ENDIF
   ELSE
      =IAUDI()
   ENDIF
ENDIF
=MEN_LIN(BOTOM)
RETURN
* EOF - INDENT
*: EOF: ZPEC.PRG


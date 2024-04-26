********************************************************************************
*-- Programa: ELIMER.PRG
*-- Fecha   : 05/26/91 09:26am
*-- Version : G. REINER -
*-- Notas   : ELIGE PROCESOS DE FABRICACION
********************************************************************************
FUNCTION elimer
PARA msg,r1,c1
#DEFINE NUL    0                                 && NUL
antpr=ulpr
ulpr=program()
sele mer
IF merpop
   if merpop1
      SET ORDER TO tag merca
      ACTI POPUP merpop
      STOR IIF(EMPTY(RESPUESTA),NUL,RECNO()) TO respuesta
   else
      STOR NUL TO respuesta
      if !EMPTY(elirub("del Producto",r1,c1))
         sele mer
         set order to tag articulo
         if empty(filter())
            set filter to rubro=LEFT(MIX.TEXTO2,3)
         else
            set filter to rubro=LEFT(MIX.TEXTO2,3) .and. deleted()
         endif
         GO TOP
         if !eof()
            =men_lin('Producto '+msg)
            ACTI POPUP merpop
            STOR IIF(!EMPTY(RESPUESTA),RECNO(),NUL) TO respuesta
         else
            STOR NUL TO respuesta
         endif
         set filter to
      else
         STOR NUL TO respuesta
      endif
   endif
ELSE
   SET ORDER TO TAG ARTICULO
   IF r1=-1
      DO infic1 WITH 'ARTICULO '+msg,15
   ELSE
      STORE SPACE(15) TO respuesta
      @ r1,c1 GET respuesta PICTURE '!!!!!!!!!!!!!!'
      READ
   ENDIF
   IF EMPTY(respuesta) .OR. LASTKEY()=27
      STOR NUL TO RESPUESTA
   ELSE
      RESPUESTA=AJCODMER(RESPUESTA)
     IF r1#-1
        @ r1,c1 GET RESPUESTA
        CLEAR GETS
      ENDIF
      SET ORDER TO TAG ARTICULO
      RESPUESTA=IIF(SEEK(respuesta),RECNO(),NUL)
   ENDIF
   IF !EMPTY(RESPUESTA)
      GOTO RESPUESTA
   ENDIF
ENDIF
ULPR=ANTPR
RETURN RESPUESTA

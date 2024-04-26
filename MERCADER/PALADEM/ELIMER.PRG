********************************************************************************
*-- Programa: ELIMER.PRG
*-- Fecha   : 05/26/91 09:26am
*-- Version : G. REINER -
*-- Notas   : ELIGE MERCADERIA
********************************************************************************
FUNCTION elimer
PARA msg,r1,c1
priv msg,r1,c1,ventant
SELE mer
IF merpop
      ventant=wontop()
      acti scre
   if merpop1
      if ulpr='IPEC' .or. ulpr='IREC' .or. ulpr='IREC1' .or. ulpr='IPEC1'
         SET ORDER TO TAG MERC1
      ELSE
         SET ORDER TO TAG MERCA
      ENDIF
  	  store nul to respuesta
      ACTI POPUP merpop
      STOR !EMPTY(respuesta) TO respuesta
   else
      ACTI SCRE
      sele rub
      STOR NUL TO respuesta
      IF !EMPTY(elirub("del Producto",r1,c1))
         sele mer
         set order to TAG ARTICULO
         if empty(filter())
            set filter to rubro=RUB.CODRUB
         else
            set filter to rubro=RUB.RUBRO .and. deleted()
         endif
         if !eof()
            =MEN_LIN('Producto '+msg)
            ACTI POPUP merpop
            STOR respuesta#0 TO respuesta
         else
            STOR NUL TO respuesta
         endif
         set filter to
      else
         STOR .f. TO respuesta
      endif
   endif
         if !empty(ventant)
      acti wind (ventant)
      endif
ELSE
   SET ORDER TO TAG ARTICULO
   LARGOR=IIF(LEFT(M.JANNAME,6)='GUIPER',4,6)
   IF r1=-1
      DO infic1 WITH 'INGRESE ARTICULO DE PRODUCTO '+msg,LARGOR
   ELSE
      STORE SPACE(6) TO respuesta
      @ r1,c1 GET respuesta PICTURE REPL('9',LARGOR)
      READ
   ENDIF
   respuesta=IIF(LEFT(JANNAME,4)="PALA" .OR. LEFT(JANNAME,5)="GUILL",zero(val(respuesta),6),RESPUESTA)
   IF EMPTY(respuesta) .OR. LASTKEY()=27
      STOR .f. TO respuesta
   ELSE
      SET ORDER TO TAG ARTICULO
      RESPUESTA=(SEEK(respuesta))
   ENDIF
ENDIF
RETURN respuesta

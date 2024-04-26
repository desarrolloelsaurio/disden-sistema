********************************************************************************
*-- Programa: INFIC.PRG
*-- Fecha   : 26/09/89
*-- Version : G. REINER
*-- Notas   : INGRESA NUMERO DE FICHA ELEGIDA
*       INGRESA CANTIDAD DE REGISTROS EN FICHERO ACTIVO
*      INGRESA TEXTO DEL PEDIDO DE INGRESO
*      LA RESPUESTA SALE EN RESPUESTA (PUBLICA)
********************************************************************************
PARAMETER final,texto
STOR 0 TO respuesta
STOR .T. TO sigue
 
DEFI WIND wli FROM 10,1 TO 17,78 DOUB
ACTI WIND wli
DO WHIL sigue
   DO tit1 WITH 1,"INGRESE FICHA "+texto,'I'
   @ 4,1 SAY "INGRESE FICHA ('0' PARA MENU) " GET respuesta
   READ
   IF respuesta>=0 .AND. respuesta<final
      STOR .F. TO sigue
      IF respuesta=0
         CLEAR
      ENDI
   ELSE
      DO erraste
      CLEAR
      STOR 0 TO respuesta
   ENDI
ENDD
DEAC WIND wli
RETURN

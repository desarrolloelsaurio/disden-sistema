FUNCTION SUBESTOK
* SI LA MERCADERIA NO EXISTE EN LA BASE DE STOCK, LA CREA Y LE COLOCA EL STOCK
* CORRESPONDIENTE
PARAMETER S_MER,S_CANT,SUMASIOSI
SELE 25
SET ORDER TO TAG ARTICULO
IF SEEK(S_MER)
   IF SUMASIOSI
   REPL STOCK WITH STOCK+S_CANT   
   ELSE
   REPL STOCK WITH STOCK-S_CANT
   ENDIF
ELSE
   SELE MER
   =XSEEK(S_MER,'MER','ARTICULO')
   SCAT MEMO MEMV
   SELE STOS
   =AGRABAR("STOS")
   REPL STOCK WITH S_CANT
ENDIF      
RETURN .T.

********************************************************************************
*-- Programa: LPECYI.PRG
*-- Fecha   : 02-05-93 01:55pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE PEDIDOS - RANKING POR MERCADERIA O MONTO
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

PARAMETER PORPAN,ELTIPO,PARAQUERY
EXTERNAL ARRAY TEXTO,VARIABLE,Habilitado
STORE "" TO TTQUE
STORE .T. TO HABILITADO
STORE 1 TO FILEMP,FILPEC,FILPRO,FILFEC,FILVIA,FILPAG,FILMON,FILMER,FILART,FILREC,FILFRE,FILFPR,FILFEE
STORE "" TO FISC,TT,TTQUE
CANT_MAX=10
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
DO WHILE QUERYPEC(PORPAN,.T.,PARAQUERY)
   TT="Notas de Pedido de Proveedores"+chr(13)+chr(10)+"Ranking por "+iif(eltipo=1,"Producto","Monto")+IIF(EMPTY(TTQUE),"",TTQUE)
   IF PORPAN
      DO LPECPY WITH "LPECPY","PEC"
   ELSE
      DO LPECIY WITH "LPECIY","PEC"
   ENDIF
ENDDO
store .f. to variable
RETURN acopy(habilant,habilitado)

********************************************************************************
*-- Programa: INFIC.PRG
*-- Fecha   : 26/09/89
*-- Version : G. REINER
*-- Notas   : INGRESA CANTIDAD DE REGISTROS EN FICHERO ACTIVO
*	      INGRESA TEXTO DEL PEDIDO DE INGRESO
*	      LA RESPUESTA SALE EN RESPUESTA (PUBLICA)
********************************************************************************
FUNCTION intex
PARAMETER texto,final,TEXPREV
#DEFINE NUL    0                                 && NUL

STOR IIF(EMPTY(TEXPREV),SPACE(FINAL),PADR(TEXPREV,FINAL)) TO ELTEX
=movewin(10,nul,14,77,'fic',texto)
  @ 1,2 SAY "INGRESE "+TEXTO+" " GET ELTEX
   READ
=RELEWIN("FIC")
RETURN LAST()#27 .AND. !EMPTY(ELTEX)

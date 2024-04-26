********************************************************************************
*-- Programa: INFIC.PRG
*-- Fecha   : 26/09/89
*-- Version : G. REINER
*-- Notas   : INGRESA CANTIDAD DE REGISTROS EN FICHERO ACTIVO
*	      INGRESA TEXTO DEL PEDIDO DE INGRESO
*	      LA RESPUESTA SALE EN RESPUESTA (PUBLICA)
********************************************************************************
FUNCTION INFIC
PARAMETER F_IN,T_EXT, CONEG
private F_IN,T_EXT,tpe,swp
#DEFINE NUL    0                                 && NUL

IF TYPE('F_IN')='C'
   =SWAP(@F_IN,@T_EXT)
ENDIF
STOR NUL TO respuesta
=movewin(10,nul,14,77,'fic',T_EXT)
DO WHILE .T.
   @ 1,2 SAY "INGRESE "+T_EXT+" ('0' PARA MENU) " GET respuesta
   READ
   IF IIF(CONEG, respuesta<>NUL , respuesta>=NUL ) .AND. respuesta<=F_IN
      EXIT
   ELSE
      @ 1,1 SAY SPACE(70)
      STOR NUL TO respuesta
   ENDIF
ENDDO
=RELEWIN("fic")
RETURN RESPUESTA

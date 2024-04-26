*:*********************************************************************
*-- Programa: ELIPEC.PRG
*-- Fecha   : 12-10-91 09:31am
*-- Version : R. 'EL BATA'
*-- Notas   : ELIGE LA NOTA DE PEDIDO
*-- Modificaci¢n GOYO 80/80/92
*!*********************************************************************
FUNCTION elipec
=movewin(10,10,15,70,'win'," Busca Nota de Pedido ")
SCAT MEMV BLAN
@ 1,1 SAY "Proveedor    :"
@ 2,1 SAY "N§ N. Pedido :"
SELE pro
STORE nul TO respuesta
IF EMPTY(elipro("",1,13))
   respu=.F.
ELSE
   sele pec
   nada=space(14)
   @ 1,20 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
   @ 2,20 GET nada PICT "@!";
      MESS 'Ingrese Nro de Pedido [ENTER] p/menu'
   READ
   nada=q_fac(nada)
   @ 2,20 GET nada PICT "@!"
   clea gets   
   respu=seek(nada+pro.procod)
ENDIF
=relewin("win")
RETURN respu

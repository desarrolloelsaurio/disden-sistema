****************************************************************************
*-- Programa: BUSPED.PRG
*-- Fecha   : 12-16-91 09:00pm
*-- Version : g. reiner
*-- Notas   : devuelve variables para trabajo con PEDIDOS
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
********************************************************************************
function busped
=movewin(iremr,iremc,iremr+5,iremc+50,'win'," Notas de Pedido ")
SELE PED
SET ORDER TO TAG PEDIDO
SCAT MEMV BLAN
@ 1,1 SAY "N§ N. PEDIDO: "
@ 2,1 SAY "Empresa     : "
@ 1,25 GET m.PEDIDO PICT "9999999999";
 MESS 'Ingrese N§ de NOTA DE PEDIDO [ENTER] p/menu'
READ
IF !EMPTY(m.PEDIDO)
   IF !EMPTY(eliemp(' [ESC] para Men£ ',2,53))
      m.marca = LEFT(MIX.TEXTO2,2)
      nada = mix.texto1
      ACTI WIND win
      @ 2,25 GET nada
      CLEA GETS
   ENDIF
ENDIF
=relewin("WIN")
SELE PED
RETURN (LAST()#27 .AND. !EMPTY(M.PEDIDO) .AND. SEEK(M.PEDIDO))

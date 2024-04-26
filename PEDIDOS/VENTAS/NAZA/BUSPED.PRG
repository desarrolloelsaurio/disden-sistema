*******************************************************************************
*-- Programa: busPED.prg
*-- Fecha   : 10-11-91 02:46pm
*-- Version : g. reiner
*-- Notas   : devuelve variables para trabajo con pedidos
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
********************************************************************************
function busped
=movewin(iremr,iremc,iremr+5,iremc+50,'win'," Notas de Pedido ")
SELE ped
SCAT MEMV BLAN
@ 1,1 SAY "Cliente            : "
@ 2,1 SAY "Empresa            : "
store 0 to respuesta
IF elicli("de Nota de Pedido ",1,25)
   m.codcli=PER.codcli
   m.nada=PER.cliente
   @ 1,25 get m.nada
   clea gets
   IF !EMPTY(ELIEMP(' [ESC] para Men£ ',2,53))
      m->marca = left(mix.texto2,2)
      nada = mix.texto1
      ACTI WIND win
      @ 2,25 GET nada
      CLEA GETS
      SELE ped
      set order to tag codcli
      IF SEEK(m->codcli)
         =relewin("win")
         return(.t.)
      ENDIF
   else
      =relewin("win")
      return(.f.)
   ENDIF
else
   =relewin("win")
   return(.f.)
ENDIF
=relewin("win")
return(.F.)

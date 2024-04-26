********************************************************************************
*-- Programa: MSRU.PRG
*-- Fecha   : 11-19-91 05:34pm
*-- Version : G. REINER
*-- Notas   : MUESTRA SUB-RUBROS
********************************************************************************
PARAMETER COSA
ACTI WIND win
CLEA
@ 1,2 SAY "RUBRO" COLO SCHE 3
@ 2,2 SAY "SUB-RUBRO" COLO SCHE 3
@ 3,2 SAY "CODIGO SUB-RUBRO" COLO SCHE 3
salida=''
IF COSA
   rego=recno()
   nada=rub.rubro
   @ 2,col get nada
   nada=zero(rub.codsrub,3)
   @ 3,col get nada
   set order to tag codrub
   =seek(str(rub.codrub))
   nada=alltrim(rub.rubro)+'-'+zero(rub.codrub,3)
   @ 1,col get nada
   salida=rub.rubro
   CLEAR GETS
   set order to tag subrubro
   goto rego
ENDIF
RETURN salida

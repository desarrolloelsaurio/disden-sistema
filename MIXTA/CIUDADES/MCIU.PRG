********************************************************************************
*-- Programa: MCIU.PRG
*-- Fecha   : 06/12/91 03:03pm
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA CIUDADES
********************************************************************************
function mciu
parameter cosa
private cosa
ACTI WIND win
clea
@ 1,2 SAY "CIUDAD" COLO SCHE 3
@ 2,2 SAY "CODIGO" COLO SCHE 3
@ 3,2 SAY "PROVINCIA" COLO SCHE 3
@ 4,2 SAY "CODIGO POSTAL" COLO SCHE 3
@ 5,2 SAY "CARACTERISTICA T.E." COLO SCHE 3
if cosa
     NADA=SAYMIX(RIGHT(m.TEXTO2,2),"PRVCOD")
     @ 1,COL GET m.texto1
     @ 2,COL GET M.NU1 pict '999999'
     @ 3,COL GET M.nada
     CLEAR GETS
     M.NADA=LEFT(M.texto2,5)
     @ 4,COL GET m.nu2 PICT '9999'
     @ 5,COL GET M.NADA
     CLEAR GETS
endif
RETURN .t.

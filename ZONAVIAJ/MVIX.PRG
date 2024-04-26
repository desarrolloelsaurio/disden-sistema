********************************************************************************
*-- Programa: MVIX.PRG
*-- Fecha   : 06/12/91 03:03pm
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA DATOS VIAJANTES
*-- Modificaci¢n GOYO 04-02-92 12:55pm
********************************************************************************
ACTI WIND win1
@ 1,2 SAY "CODIGO "+upper(bIAJA) COLO SCHE 3
@ 2,2 SAY "ZONA" COLO SCHE 3
@ 3,2 SAY "MARCA" COLO SCHE 3
@ 1,COL GET m.codvia
=XSEEK(m.zona,'mix','ZONCOD')
stor mix.texto1 TO nada
@ 2,COL GET nada
CLEAR GETS
=XSEEK(m.marca,'MIX','MARCOD')
stor mix.texto1 TO nada
@ 3,COL GET nada
CLEAR GETS
RETURN

*********************************
*-- Programa: MPER.PRG
*-- Fecha   : 06/27/91
*-- Version : V.LEEGSTRA
*-- Notas   : MUESTRA CLIENTES
********************************
parameter cosa
ACTI WIND win
if cosa
clea
endif
@ 1,2 SAY "CODIGO DE CLIENTE" COLO SCHE 3
@ 2,2 SAY "CLIENTE" COLO SCHE 3
@ 3,2 SAY "ENCARGADO DE COMPRAS" COLO SCHE 3
@ 4,2 SAY "DOMICILIO" COLO SCHE 3
@ 5,2 SAY "LOCALIDAD" COLO SCHE 3
@ 6,2 SAY "TELEFONOS" COLO SCHE 3
@ 7,2 SAY "FAX" COLO SCHE 3
@ 8,2 SAY "CONDICION DE IVA" COLO SCHE 3
@ 9,2 SAY "Nro. DE IVA" COLO SCHE 3
@ 10,2 SAY "MONTO MAXIMO" COLO SCHE 3
@ 11,2 SAY "DESCUENTO" COLO SCHE 3
@ 12,2 SAY "PRECIO" COLO SCHE 3
if cosa
@ 13,2 SAY "BLOQUEADO" COLO SCHE 3
@ 13,28 SAY "ZONA" COLO SCHE 3
@ 1,COL GET m.codcli
@ 2,COL GET m.cliente
@ 3,COL GET m.enccom
@ 4,COL GET m.domicilio
NADA=IIF(XSEEK(m.localidad,'mix','CIUCOD'),MIX.TEXTO1,SPACE(15))
nada1="("+LEFT(mix.texto2,5)+")"
nada2=STR(mix.nu2,4)
=XSEEK(RIGHT(mix.TEXTO2,2),'MIX','PRVCOD')
nada3=ALLTRIM(mix.texto1)
ACTI WIND win
@ 5,COL GET nada
@ 5,COL+21 SAY "Pcia.:" COLO SCHE 3
@ 5,COL+28 GET nada3
@ 6,COL+21 SAY "C.P.:" COLO SCHE 3
@ 6,COL+28 GET nada2
@ 6,13 GET nada1
@ 5,COL GET nada
@ 6,COL GET m.telefonos
@ 7,COL GET m.fax
stor xaciva[m.condiva,1] TO nada
@ 8,COL GET nada
@ 9,COL GET m.nroiva
@ 10,COL GET m.montomax PICTURE "99999999999.99"
@ 11,COL GET m.descuento
NADA='XALIS'+ALLTRIM(STR(PRECIO))
nada=&nada
@ 12,COL+3 get NADA
nada=IIF(m.bloqueo,'SI','NO')
@ 13,COL GET m.nada PICTURE "!!"
=XSEEK(m.zona,'MIX','ZONCOD')
stor mix.texto1 TO nada
@ 13,COL+10 GET m.nada PICTURE "@!"
CLEAR GETS
else
@ 13,2 SAY "ZONA" COLO SCHE 3
endif
RETURN


********************************************************************************
*-- Programa: Mvia.PRG
*-- Fecha   : 06/12/91 03:03pm
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA CIUDADES
*--           MODIFICACION GOYO 03/25/92 03:31pm
********************************************************************************
FUNCTION MVIA
PARAMETER COSA
ACTI WIND win
@ 1,2 SAY "CODIGO "+upper(bIAJA) COLO SCHE 3
@ 2,2 SAY "APELLIDO Y NOMBRE" COLO SCHE 3
@ 3,2 SAY "DOMICILIO" COLO SCHE 3
@ 4,2 SAY "LOCALIDAD" COLO SCHE 3
@ 5,2 SAY "TELEFONO" COLO SCHE 3
@ 6,2 SAY "TIPO" COLO SCHE 3
IF COSA
=XSEEK(m.localidad,'MIX','CIUCOD')
stor mix.texto1 TO nada
@ 1,COL GET m.codvia    PICT '@!'
@ 2,COL GET m.viajante  PICT '@!'
@ 3,COL GET m.domicilio PICT '@!'
@ 4,COL GET nada
@ 5,COL GET m.telefono  PICT '@!'
CLEAR GETS
nada=qvia(m.tipo)
@ 6,COL GET nada
CLEAR GETS
ENDIF
RETURN .T.

********************************************************************************
*-- Programa: MMER.PRG
*-- Fecha   : 06/11/91
*-- Version : V.LEEGSTRA
*-- Notas   : MUESTRA MERCADERIA
*-- Modificaci¢n GOYO 05-17-92 12:43pm
*-- Modificaci¢n GOYO 05-17-92 01:31pm
********************************************************************************
PARAMETER COSA
ACTI WIND win
IF !COSA
CLEA
ENDIF
@ 1,2 SAY "ARTICULO" COLO SCHE 3
@ 2,2 SAY "RUBRO" COLO SCHE 3
@ 3,2 SAY "Nro. DE PLANO" COLO SCHE 3
@ 4,2 SAY "DENOMINACION " COLO SCHE 3
@ 5,2 SAY "DESCRIPCION " COLO SCHE 3
@ 6,2 SAY "TEMPORADA " COLO SCHE 3
@ 7,2 SAY "SEXO " COLO SCHE 3
@ 8,2 SAY "LINEA" COLO SCHE 3
@ 9,2 SAY "MARCA" COLO SCHE 3
@ 10,2 SAY UPPER(mader) COLO SCHE 3
@ 11,2 SAY UPPER(zuela) COLO SCHE 3
@ 12,2 SAY UPPER(tella) COLO SCHE 3
@ 13,2 SAY 'ES JEAN ?' COLO SCHE 3
IF COSA
@ 1,COL GET m.articulo
=xseek(mer.rubro,'mix','rubcod')
nada=mix.texto1
@ 2,COL GET nada
STORE SUBSTR(m.articulo,5) TO nada
nada=LEFT(nada,AT('/',nada)-1)
@ 3,COL GET nada
@ 4,COL GET m.merca
=xseek(mer.linea,'mix','lincod')
nada=PADR(CHRTRAN(mer.merca1,CHR(13)+CHR(10),'-'),30)
@ 5,COL GET nada
m.temporada=qtem(m.temporada)
m.sexo=qsex(m.sexo)
@ 6,COL GET m.temporada
@ 7,COL GET m.sexo
nada=mix.texto1
@ 8,COL GET nada
=xseek(mer.marca,'MIX','marcod')
nada=mix.texto1
@ 9,COL GET nada
=xseek(mer.material,'mix','matcod')
nada=mix.texto1
@ 10,COL GET nada
=xseek(mer.suela,'MIX','suecod')
nada=MIX.TEXTO1
@ 11,COL GET nada
=xseek(mer.tela,'telS','telcodPRO')
nada=telS.tela
@ 12,COL GET nada
nada=IIF(m.jean,'SI','NO')
@ 13,COL GET nada
CLEAR GETS
ENDIF
RETURN

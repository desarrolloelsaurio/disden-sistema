******************************************
*-- Programa: ELITEM.PRG
*-- Fecha   : 07/03/91 11:13am
*-- Version : g. reiner
*-- Notas   : ELIGE LA TEMPORADA
****************************************
FUNCTION eliTEM
PARA msg,n1,n2
=men_lin('Temporada '+msg)
respuesta=algun(20,' Temporada ',;
	"\<Primavera;\<Verano;\<Oto¤o;\<Invierno;\<Todas")
IF respuesta<1
   stor nul TO respuesta
ENDIF
=MEN_LIN(BOTOM)
RETURN respuesta

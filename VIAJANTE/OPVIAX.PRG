* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : OPVIAX.PRG                                               �
* � COMENTARIO    : ABRE ARCHIVO DE VIAJANTES (EXCLUSIVO)                    �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 07-25-93                                                    �
* � HORA       : 02:06:02pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
PARAMETER SHIT
IF SSTM1#"HOGAR"
	=GETDBF('VIAJADAT',.F.,'VIX',20,.T.)
ENDIF
RETURN GETDBF('VIAJANTE',.F.,'VIA',19,.T.)

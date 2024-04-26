* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPVIAX.PRG                                               บ
* บ COMENTARIO    : ABRE ARCHIVO DE VIAJANTES (EXCLUSIVO)                    บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 07-25-93                                                    บ
* บ HORA       : 02:06:02pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER SHIT
IF SSTM1#"HOGAR"
	=GETDBF('VIAJADAT',.F.,'VIX',20,.T.)
ENDIF
RETURN GETDBF('VIAJANTE',.F.,'VIA',19,.T.)

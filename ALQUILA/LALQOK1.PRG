* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : LALQOK1.PRG                               �
* � COMENTARIO    : MAIN IMPRESION INMUEBLES OK PARA ALQUILER �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                                  �
* � FECHA      : 08-20-93                                     �
* � HORA       : 12:10:13pm                                   �
* � COPYRIGHT  : 1993 by GREGORIO REINER                      �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
FUNCTION LALQOK1
#DEFINE PAIP     "|"                             && PAIP
	? PAIP
	?? PADR(CLIENTE,IIF(PORPAN,20,30))
	?? PAIP
	?? CODINM
	?? PAIP
	?? PADR(DOMICILIO,IIF(PORPAN,20,40))
	?? PAIP
	?? FECHAVENC
	?? PAIP
	?? STR(FECHASEG,2)
	?? PAIP
	STORE arma_fec(DIAVENC,MONTH(DATE()),YEAR(DATE())%100) TO M.FECHAVE
	STORE MONEDA TO M.MONEDA
	indice=gen_ind(fechaalq,m.fechave,codact)
	IF moneda=left(xadols,1)
		STORE MONTOBASE*INDICE TO M.EQUIVALE
		STORE M.EQUIVALE*XACOTIZ TO M.MONTO
	ELSE
		STORE MONTOBASE*INDICE TO M.MONTO
		STORE M.MONTO/XACOTIZ TO M.EQUIVALE
	ENDIF
	?? STR(MONTO,XACDIGI,2)
	?? PAIP
	STORE CASOS+1 TO CASOS
RETURN MONTO

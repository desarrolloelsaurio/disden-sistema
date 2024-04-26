* ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LALQOK1.PRG                               บ
* บ COMENTARIO    : MAIN IMPRESION INMUEBLES OK PARA ALQUILER บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                  บ
* บ FECHA      : 08-20-93                                     บ
* บ HORA       : 12:10:13pm                                   บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                      บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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

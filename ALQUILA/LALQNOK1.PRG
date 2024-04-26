* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LALQNOK1.PRG                                             บ
* บ COMENTARIO    : MAIN IMPRESION INMUEBLES OK PARA ALQUILER                บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-20-93                                                    บ
* บ HORA       : 12:10:13pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LALQNOK1
	#DEFINE PAIP     "|"                           && PAIP
	STORE ARMA_FEC(ALQ.DIAVENC,MONTH(DATE()),YEAR(DATE())%100) TO M.FECHAVE
	STORE ALQ.MONEDA TO M.MONEDA
	INDICE=GEN_IND(ALQ.FECHAALQ,M.FECHAVE,ALQ.CODACT)
	ELPROB="NO DETECTO PROBLEMAS"
	DO CASE
	CASE EMPTY(PER.CODCLI)
		ELPROB="NO EXISTE INQUILINO O CONTRATO !"
	CASE ALQ.FECHAVENC<M.FECHAVE
		ELPROB="CT VENC AL"+DTOC(M.FECHAVE)
		IF SIGUEALQ(PER.CODCLI,INM.CODINM)
			ELPROB=ELPROB+"-RENO"
		ENDIF
	CASE !ALQ.EMITE
		ELPROB="ALQUILER NO AUTORIZADO"
	CASE EMPTY(INDICE)
		ELPROB="INDICE DE ACTUALIZACION=0"
	CASE EMPTY(ALQ.MONTOBASE)
		ELPROB="MONTO BASE DEL CONTRATO=0"
	CASE ALQ.MONEDA=LEFT(XADOLS,1)
		IF EMPTY(XACOTIZ)
			ELPROB="ALQUILER EN "+UPPER(XADOLS)+" Y COTIZ=0"
		ENDIF
	ENDCASE
	IF ELPROB#"NO DETECTO PROBLEMAS"
	? PAIP
	?? CODINM
	?? PAIP
	?? PADR(INM.DOMICILIO,IIF(PORPAN,25,40))
	IF !PORPAN
		?? PAIP
		?? PADR(PER.CLIENTE,IIF(PORPAN,20,30))
	ENDIF
	?? PAIP
	?? PADR(ELPROB,30)
	?? PAIP
	STORE CASOS+1 TO CASOS
	ENDIF
RETURN .T.

* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �    ARCHIVO: LFACPC0.PRG                                                  �
* �       AUTOR: G. REINER                                                   �
* � Date created: 11-26-92                                                   �
* � Time created: 02:30:05pm                                                 �
* �    Make File: DEMO.RMK                                                   �
* �    Exec File: INICIO.EXE                                                 �
* �    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION LFACPC0
	=WORKING()
	=TTLCHEQ(6)
	SELE faC
	set order to tag factura
	set order to tag CODCLI IN PER
	set relation to faC.CODCLI INTO PER
	set order to tag CODVIA in VIA
	set relation to faC.CODVIA INTO VIA ADDI
	TMP=GENTMP()
	inde on FAC.FACTURA TO (TMP) FOR EVAL(FISC) COMP
	acla=HAZ_ACLA()
	linea=REPL("=",LEN(acla))
	tt='Listado de Costos '+PROP(TIT_INVOS)+chr(13)+chr(10)+"(Costos de Reposici줻)"+TTQUE
	=UNWORK()
RETURN .T.

* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �  APLICACION: SISTEMAS VARIOS                                             �
* �    ARCHIVO: LRECPY1.PRG                                                  �
* �       AUTOR: G. REINER                                                   �
* � Date created: 11-11-92                                                   �
* � Time created: 03:44:18pm                                                 �
* �    Make File: DEMO.RMK                                                   �
* �    Exec File: INICIO.EXE                                                 �
* �    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION LRECPY1
	? PAIP
	?? LIS.MERCA
	?? PAIP
	?? LEFT(MER.MERCA,30)
	?? PAIP
	?? STR(LIS.CANTIDAD,XACDIGI)
	?? PAIP
	IF HAYDISC
	?? STR(LIS.PESO,XACDIGI,2)
	?? PAIP
	ENDIF
	?? STR(LIS.MONTO,XACDIGI,2)
	?? PAIP
	TCAN=TCAN+LIS.CANTIDAD
	TPES=TPES+LIS.PESO
	TMON=TMON+LIS.MONTO
RETURN .T.

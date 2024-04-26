* ษอออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : YAGRL.PRG                         บ
* บ               : CARGA VALORES A MEMVAR Y RESPALDO บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                          บ
* บ FECHA      : 10-27-93                             บ
* บ HORA       : 06:44:43pm                           บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER              บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออออออผ
* YA_ALIAS : ALIAS DE LA BASE A CARGAR
* YA_TIT   : ANUNCIA LA CARGA ?
* YA_BLAN  : CARGA LOS DATOS VACIOS ?
* YA_WIN   : NOMBRE DE LA VENTANA - DE NO EXISTIR SE ASUME IGUAL AL ALIAS
FUNCTION YAGRL
	PARAMETER YA_ALIAS,YA_TIT,YA_BLAN,YA_WIN
	YA_WIN=IIF(EMPTY(YA_WIN),YA_ALIAS,YA_WIN)
	IF !EMPTY(YA_TIT)
		WAIT YA_TIT+"EXISTE" WIND NOWA
	ENDIF
	SELE (YA_ALIAS)
	IF YA_BLAN
		SCAT MEMO MEMV BLAN
		SCAT MEMO TO RESPALDO BLAN
		STORE .T. TO INGRESO
	ELSE
		FF=RECNO()
		REGISTRO=STR(FF)
		UNLO ALL
		=LOCK(YA_ALIAS) .OR. LOK(YA_ALIAS)
		SCAT MEMO MEMV
		SCAT MEMO TO RESPALDO
		STORE .F. TO INGRESO
	ENDIF
RETURN WCL() .AND. SGETX(YA_WIN)

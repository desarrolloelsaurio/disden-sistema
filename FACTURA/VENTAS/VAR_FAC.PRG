* зд FUNCTION дддддддддддддддддддддддд©
* Ё    ARCHIVO: VAR_FAC.PRG           Ё
* Ё       AUTOR: G. REINER            Ё
* Ё Date created: 12-31-92            Ё
* Ё Time created: 11:46:28am          Ё
* Ё    Copyright: 1992 by GOYO REINER Ё
* юддддддддддддддддддддддддддддддддддды
FUNCTION VAR_FAC
	TEXTO[1,2] =IIF(TYPE("FAC.FACTURA")="C",LEN(FAC.FACTURA),10)
	TEXTO[2,2] =8
	TEXTO[3,2] =2
	TEXTO[4,2] =20
	TEXTO[5,2] =20
	TEXTO[6,2] =XACDIGI
	TEXTO[7,2] =XACDIGI
	TEXTO[8,2] =XACDIGI
	TEXTO[1,1] =TIT_INVO
	TEXTO[2,1] ='FECHA EMISION'
	TEXTO[3,1] ='TIPO COMPROBANTE'
	TEXTO[4,1] ='CLIENTE'
	TEXTO[5,1] =UPPER(BIAJA)
	TEXTO[6,1]='MONTO COSTO'
	TEXTO[7,1]='NETO GRAV.'
	TEXTO[8,1]='DIFERENCIA'
RETURN .T.


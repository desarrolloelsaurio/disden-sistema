* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : XCAJ.PRG              บ
* บ COMENTARIO    : RESTAURA BASE DE CAJA บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 02-09-94                 บ
* บ HORA       : 12:35:54pm               บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
PROCEDURE XCAJ
	PARAMETER COMPACTA
	ULPR=HORA_ULP(PROGRAM())
	IF CHEQSEG()
	   IF FUERARED()#27
	    DO OPCAJ
		SELE CAJ
		=MEN_LIN('Reindexando el Archivo de Caja')
		=FLOCK("CAJ") .OR. FLOK("CAJ")
		=DOTALK()
		=OPCAJ(JANNRO,.T.)
		SELE CAJ
		IF COMPACTA
			SET ORDER TO
			PACK
		ENDIF
		INDEX ON CAJA TAG CAJA
		INDEX ON GASTO TAG GASTO
		INDEX ON CODCLI TAG CODCLI
		INDEX ON FECHAOP TAG FECHAOP
	    #IF "RAFUL" $ CURDIR()
	       INDEX ON COMPR TAG COMPR FOR PROVEEDOR
	    #ENDIF
		=OPCAJ(JANNRO,.F.,.T.)
		=UNTALK()
		=IAUD('CAJA')
		ENDIF
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)

* ษออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : XINM.PRG                   บ
* บ COMENTARIO    : REINDEXA BASE DE INMUEBLES บ
* ฬออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                   บ
* บ FECHA      : 11-17-93                      บ
* บ HORA       : 07:45:31pm                    บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER       บ
* ศออออออออออออออออออออออออออออออออออออออออออออผ
PROCEDURE XINM
	ULPR=HORA_ULP(PROGRAM())
	IF CHEQSEG()
		SELE INM
		=MEN_LIN('Generando Nuevo Indice de Inmuebles')
		=FLOCK("INM") .OR. FLOK("INM")
		=DOTALK()
		=OPINMX()
		SELE INM
		INDE ON DOMICILIO TAG DOMICILIO
		INDE ON CODINM TAG CODINM
		INDE ON PROCOD TAG PROCOD
		INDE ON MUNICIPAL TAG MUNICIPAL
		INDE ON INMOBILIAR TAG INMOBILIAR
		INDE ON DIPOS TAG DIPOS
		=REOPINM()
		=UNTALK()
		=IAUD('REINDEX')
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)

* 浜様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : XINM.PRG                   �
* � COMENTARIO    : REINDEXA BASE DE INMUEBLES �
* 麺様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                   �
* � FECHA      : 11-17-93                      �
* � HORA       : 07:45:31pm                    �
* � COPYRIGHT  : 1993 by GREGORIO REINER       �
* 藩様様様様様様様様様様様様様様様様様様様様様夕
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

* 浜様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : BCNS.PRG               �
* � COMENTARIO    : BORRA CONSORCIOS       �
* 麺様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER               �
* � FECHA      : 12-29-93                  �
* � HORA       : 07:58:45pm                �
* � COPYRIGHT  : 1993 by GREGORIO REINER   �
* 藩様様様様様様様様様様様様様様様様様様様夕
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
STORE RECNO() TO FF
REGISTRO=STR(FF)
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	=MOVEWIN(MCNSR,MCNSC,MCNSR+MCNSLA,MCNSC+MCNSAN,'WIN'," Borra Consorcios ")
	SELE CNS
	=LOCK("CNS") .OR. LOK("CNS")
	STORE 17 TO COL
	SCAT MEMVAR
	DO MCNS WITH .T.
	IF CONFIRMA("Borrar el Consorcio",.T.,12,0)
		DELE RECO FF
		=IAUD(CNS.CONSORCIO)
	ENDIF
	UNLO IN CNS
	=RELEWIN('WIN')
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

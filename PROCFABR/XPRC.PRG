* 浜様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : XPRC.PRG      �
* � COMENTARIO    : REINDEXA BASE �
* 藩様様様様様様様様様様様様様様様�
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	=MEN_LIN('Reconstruyendo Indice del Archivo de Procesos Fabricaci�n')
	SELE PRC
	=WORKING()
	=DOTALK()
	=FLOCK("PRC") .OR. FLOK("PRC")
	USE
	=OPPRCX()
	INDE ON PRCCOD TAG PRCCOD
	INDE ON PROCFAB TAG PROCFAB
	=UNTALK()
	=UNWORK()
	=REOPPRC()
	=IAUD("REINDEXA")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

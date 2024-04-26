* ษอออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : XPRC.PRG      บ
* บ COMENTARIO    : REINDEXA BASE บ
* ศอออออออออออออออออออออออออออออออผ
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	=MEN_LIN('Reconstruyendo Indice del Archivo de Procesos Fabricaciขn')
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

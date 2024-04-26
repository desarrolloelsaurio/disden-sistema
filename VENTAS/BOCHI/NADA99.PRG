susp
SELE temp
GO TOP
DO WHILE .T.
	SELE temp
	SCATT MEMV
	?m.codcli
	IF EOF()
		exit
	endif
	SELE cccli
	DELE FOR CODCLI=M.CODCLI AND COMPRRE="S"
	sele temp
	skip
ENDD


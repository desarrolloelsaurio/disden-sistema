
?"CLIENTE", "CODIGO" AT 50, "CODIGO" AT 80

M.cliente=cliente
m.codcli=""
SCAN
	IF cliente=M.cliente
		?cliente, codcli AT 50, m.codcli AT 80
		*dele
	ENDIF
	SCATT MEMV
ENDS
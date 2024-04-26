FUNCTION LFCDP0
	=WORKING()
	=TTLCHEQ(8)
	picu=RIGHT("99,999,999,999.99",XACDIGI)
	set order to tag concod in cns
	set order to tag procod in PER
	SELE far
	set relation to far.concod into cns
	SET RELA TO far.procod into pER ADDI
	pag=1
	acla=HAZ_ACLA()
	store acla+iif(variable[CANT_MAX]," USUARIO  |  FECHA "+paip,'') to acla
	linea=REPL("=",LEN(acla))
	tt='Listado de Facturas'+TTQUE
	IF ".T."=FISC
		SET ORDER TO TAG FECHAEM
	ELSE
		INDEX ON DTOS(FECHAEM) TO (GENTMP()) FOR EVAL(FISC)
	ENDIF
    STORE NUL TO CASOS
RETURN UNWORK()

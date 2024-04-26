on error do erp
scan FOR EMPTY(GY_DEBE) .AND. CODCLI<>"C000000001"
	a=abs(comision)
ends 


proc erp
repl comision with monto/10
?codcli,fechaop
susp
retur
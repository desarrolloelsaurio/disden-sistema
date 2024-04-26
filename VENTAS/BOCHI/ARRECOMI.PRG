on error do ele
SELE 1
USE F:\SISTEMAS\VENTAS\VENTASA\CCCLIH.DBF ORDER CODCLI
REPL GY_debe WITH 0 all
REPL GY_DEBE WITH comision FOR COMPRRE="FA" .OR. ;   
	COMPRRE="ND" .OR. ;   
	COMPRRE="SD" 
scan FOR EMPTY(GY_DEBE) .AND. CODCLI<>"C000000001"
	REPL GY_HABER WITH ABS(comision) 
ends
TOTAL ON CODCLI TO C:\TOT FIELD GY_HABER, GY_DEBE
SELE 2
USE C:\TOT 
inde on codcli tag codcli
set orde to codcli
SELE 1
USE F:\SISTEMAS\VENTAS\VENTASA\CCCLI.DBF 
set rela to CODCLI into TOT 
brow FOR DETALLE = "Saldo al" FIEL monto, a=TOT.GY_HABER - TOT.GY_DEBE, comision


proced ele
?gy_debe, gy_haber, codcli, fechaop, comision
?erro(), mess()
susp
retu
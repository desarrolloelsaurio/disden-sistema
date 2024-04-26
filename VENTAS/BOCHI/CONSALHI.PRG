SALE = FCREATE('C:\SALE.txt')

CLEAR
SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
SET TALK OFF
USE F:\SISTEMAS\VENTAS\VENTASA\PERSONAS ALIAS PER  IN 0
USE F:\SISTEMAS\VENTAS\VENTASA\CCCLIH   ALIAS CCLH IN 0
USE F:\SISTEMAS\VENTAS\VENTASA\CCCLI    ALIAS CCL  IN 0 
tmp=gentmp()
SELE per
SET ORDE TO CODCLI
SCAN
	SCATTER MEMVAR
	elcli=per.codcli
	SELE cclh
	SORT ON fechaop TO (tmp) FOR codcli=m.codcli
	SELE 0
	USE (tmp) ALIAS TMP
	REPL ALL gy_debe WITH 0,gy_haber WITH 0
	REPL gy_debe WITH monto ;
		FOR comprre="FA" .OR. ;
		comprre="ND" .OR. ;
		comprre="SD"
	REPL gy_haber WITH ABS(monto) FOR EMPTY(gy_debe)
	CALC SUM(gy_debe), SUM(gy_haber) TO tgy_debe, tgy_haber
	STORE ROUND(tgy_debe-tgy_haber,0) TO tgy_saldo
	IF !EMPTY(tgy_saldo)
		sele CCL
		locate for codcli=m.codcli and detalle="Saldo al"
		if !found() or abs(tgy_saldo-ccl.monto)>1
			=FWRITE(SALE, PER.CODCLI+" - "+PER.CLIENTE+" - "+STR(tgy_saldo,10,2)+CHR(13)+CHR(10))
			?PER.CODCLI+" - "+PER.CLIENTE+" - "+STR(tgy_saldo,10,2)+CHR(13)+CHR(10)
		endif
		sele per
	ENDIF
	USE IN TMP
ENDSCAN
=FCLOSE(SALE)

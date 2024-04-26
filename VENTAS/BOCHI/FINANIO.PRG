ya = SECO()
CLOSE DATABASES
ON ERROR
SET EXCLUSIVE OFF
SET SAFETY OFF
CAMINAN = "\\BOCHI\ZIP\"
*CAMINAN = "F:\SISTEMAS\VENTAS\"
SET TALK ON
CLEAR
SELECT 0
USE C:\finde\cccli  ALIAS ncccli  EXCLUSIVE
ZAP
SELECT 0
USE C:\finde\ccclih ALIAS nccclih EXCLUSIVE
ZAP
APPEND FROM (caminan+"VENTASA\CCCLIH") FOR !DELETED()
viejos = RECCOUNT()
APPEND FROM (caminan+"VENTASA\CCCLI")  FOR comprre<>"SA" AND comprre<>"SD" AND !DELETED()
SCATTER MEMVAR BLANK

SET EXCLUSIVE OFF
SET SAFETY OFF
SET DELETE ON
SET TALK OFF
SELE 0
USE F:\sistemas\ventas\ventasa\personas ALIAS per ORDER codcli
COUNT TO i
DIMENSION loscl(i-1)
A=1
GO TOP
SKIP
SCAN REST
	loscl(A)=codcli
	A=A+1
ENDSCAN
**COPY TO ARRAY LOSCL FIEL CODCLI FOR FILTRO="C" AND !DELE()
USE
**ON ERROR DO elerror WITH ERROR( )
FOR i=2 TO ALEN(loscl)
	m.cli = loscl(i)
	DO calcusal WITH m.cli
NEXT
WAIT STR(SECO()-ya) WIND
RETURN

FUNCTION calcusal
PARAMETER elcli
SELECT nccclih

m.monto    = calculin(1,"MONTO",    elcli, 1)
m.comision = calculin(2,"COMISION", elcli, viejos)
m.comisip  = calculin(3,"COMISIP" , elcli, viejos)

IF ABS(m.monto)>0.10
	? elcli
	??" ----> "
	??m.monto
	STORE elcli TO codcli
	STORE IIF(m.monto>0, "SD", "SA") TO m.comprre
	STORE DATE() TO fechaop, fechave, fecha
	STORE "Saldo al "+DTOC(DATE()) TO detalle
	STORE ABS(m.monto) TO m.cuota, m.monto
	INSERT INTO ncccli FROM MEMVAR
ENDIF
RETURN

PROCEDURE elerror
PARA elnu
IF elnu=39
	IF m.q=1
		REPLACE monto WITH 0 FOR monto>1000000
	ENDIF
	IF m.q=2
		REPLACE comision WITH 0 FOR comision >1000000
	ENDIF
	IF m.q=3
		REPLACE comisip WITH 0 FOR comisip >1000000
	ENDIF
	RETRY
ELSE
	ON ERROR
	RETRY
ENDIF
RETURN

FUNCTION calculin
PARAMETER nq, lava, cualcli, desde
elresu = 0
m.q = nq
CALC SUM(EVAL(lava)) TO z_debe  FOR (comprre ="FA" .OR.  comprre ="ND" ) .AND. codcli=cualcli .AND. RECN()>desde
CALC SUM(EVAL(lava)) TO z_haber FOR (comprre<>"FA" .AND. comprre<>"ND" ) .AND. codcli=cualcli .AND. RECN()>desde
STORE z_debe-z_haber TO elresu
RETURN elresu

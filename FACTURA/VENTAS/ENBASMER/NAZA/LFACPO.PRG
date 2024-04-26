********************************************************************************
*-- Programa: LFACPO.PRG
*-- Fecha   : 06-12-92 03:45pm
*-- Version : GOYO REINER
*-- Notas   : GENERA ARCHIVO PARA LISTADO DE MERCADERIA VENDIDA
********************************************************************************
PARAMETER ARCHIVO
=MEN_LIN("ESPERE POR FAVOR")
=working()
=DOTALK()
SELE faC
set order to tag factura
IF FILCLI=2
	set order to tag CODCLI IN PER
	set relation to faC.CODCLI INTO PER
ENDIF
IF FILVIA=2
	set order to tag CODVIA in VIA
	set relation to faC.CODVIA INTO VIA ADDI
ENDIF
IF FILPAG=2
	set order to tag PAGCOD in MIX
	set relation to faC.CONDPAGO INTO MIX ADDI
ENDIF
SELE FAX
SET RELA TO FACTURA INTO FAC ADDI
SET ORDER TO TAG ARTICULO IN MER
SET RELA TO LEFT(FAX.ARTICULO,13) INTO MER ADDI
tmp=GENTMP()
IF ".T."=FISC
	inde on ARTICULO to (tmp) COMPACT
ELSE
	inde on ARTICULO to (tmp) COMPACT for eval(fisc)
ENDIF
CREATE TABLE (ARCHIVO) (MERCA C(16), CANTIDAD N(8), MONTO N(12,2))
USE
SELE 25
USE (ARCHIVO) ALIAS LIS EXCL
SELE FAX
GO TOP
XERCA=LAMER(FAX.ARTICULO)
M.MERCA=FAX.ARTICULO
STORE 0 TO M.MONTO,M.CANTIDAD
SCAN
	? RECNO()
	IF lamer(FAX.ARTICULO)#XERCA
		INSERT INTO LIS FROM MEMV
		XERCA=LAMER(FAX.ARTICULO)
		M.MERCA=FAX.ARTICULO
		STORE NUL TO M.MONTO,M.CANTIDAD
	ENDIF
	M.CANTIDAD=M.CANTIDAD+FAX.CANTIDAD
	M.MONTO=M.MONTO+FAX.MONTO1*FAX.CANTIDAD
ENDSCAN
INSERT INTO LIS FROM MEMV
SELE LIS
if filmer=2
	inde on CANTIDAD tag merca of nada.tmp desc comp
else
	inde on monto tag merca of nada.tmp desc comp
endif
set order to tag merca
=untalk()
RETURN .T.

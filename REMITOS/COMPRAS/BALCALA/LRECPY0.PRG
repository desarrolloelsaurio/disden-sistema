* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  APLICACION: SISTEMAS VARIOS                                             ³
* ³    ARCHIVO: LRECPY0.PRG                                                  ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 11-11-92                                                   ³
* ³ Time created: 03:30:17pm                                                 ³
* ³    Make File: DEMO.RMK                                                   ³
* ³    Exec File: INICIO.EXE                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
* GENERA INDICE PARA LISTADO DE MERCADERIAS DE REMITOS DE COMPRAS
FUNCTION LRECPY0
	PARAMETER ARCHIVO
	=WORKING()
	=DOTALK()
	set order to PROCOD in PRO
	set order to articulo in mer
	sele re1
	set rela to articulo into mer
	set rela to numero+procod into rec addi
	sele rec
	set rela to procod into pro addi
	sele re1
	INDE ON MER.ARTICULO to (GENTMP()) COMPACT for EVAL(fisc)
	CREATE TABLE (ARCHIVO) (MERCA C(6), CANTIDAD N(8), PESO N(10,2), MONTO N(12,2))
	USE
	SELE 25
	USE (ARCHIVO) ALIAS LIS EXCL
	SELE re1
	GO TOP
	XERCA=re1.ARTICULO
	M.MERCA=re1.ARTICULO
	STORE 0 TO M.MONTO,M.CANTIDAD,M.PESO
	SCAN
		? RECNO()
		IF re1.ARTICULO#XERCA
			INSERT INTO LIS FROM MEMV
			XERCA=re1.ARTICULO
			M.MERCA=re1.ARTICULO
			STORE NUL TO M.MONTO,M.CANTIDAD,M.PESO
		ENDIF
		IF HAYDISC .AND. MER.DISCRIM
			M.PESO=M.PESO+RE1.CANTIDAD
			M.CANTIDAD=M.CANTIDAD+re1.PESO
		ELSE
			M.MONTO=M.MONTO+re1.MONTO*re1.CANTIDAD
			M.CANTIDAD=M.CANTIDAD+re1.CANTIDAD
		ENDIF
		M.MONTO=M.MONTO+re1.MONTO*re1.CANTIDAD
	ENDSCAN
	INSERT INTO LIS FROM MEMV
	SELE LIS
	if filmer=4
		INDE ON PESO TAG MERCA OF NADA.TMP DESC COMP
	ELSE
		IF FILMER=3
			INDE ON CANTIDAD tag merca of nada.tmp desc COMP
		else
			INDE ON monto tag merca of nada.tmp desc COMP
		endif
	ENDIF
	=REOPREC()
	SELE LIS
	set order to tag merca
	SET RELA TO MERCA INTO MER
	store paip+PADC('ARTIC.',6)+paip+PADC('DENOMINACION',30)+paip to acla
	acla=acla+padc("UNIDADES",XACDIGI)+PAIP
	IF HAYDISC
	   ACLA=ACLA+padc("PESO",XACDIGI)+PAIP
	ENDIF
	ACLA=ACLA+PADC("MONTO",XACDIGI)+PAIP
	STORE REPL("=",LEN(acla)) TO lns
	tt='Listado de Remitos - Mercader¡as '+iif(!empty(ttque),ttque,'')
	=UNTALK()
	=unwork()
RETURN .T.

* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: LFACPU0.PRG                                                ³
* ³       Author: G. REINER                                                  ³
* ³ Date created: 12-25-92                                                   ³
* ³ Time created: 10:31:22am                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION LFACPU0
	=WORKING()
	SELE FAC
	TMP=GENTMP()
	SET ORDER TO TAG CODCLI IN PER
	SET RELA TO CODCLI INTO PER
	IF TYPE("ORDCLI")#'L' .OR. ORDCLI
		INDE ON CODCLI+DTOS(FECHAEM) TO (TMP) for empty(tipo) .or. tipo="FA" COMP
	ELSE
		INDE ON PER.CLIENTE+DTOS(FECHAEM) TO (TMP) FOR empty(tipo) .or. tipo="FA" COMP
	ENDIF
	GO TOP
	STOR NUL TO CASOS
	ACLA=PAIP+"  CODIGO  "+PAIP+PADC("CLIENTE",30)+PAIP+" FECHA  "+PAIP+PADC("FACTURA",10)+PAIP
	LINEA=REPL("=",LEN(ACLA))
	TT='Ultima Operaci¢n de los Clientes'
	=UNWORK()
RETURN .T.

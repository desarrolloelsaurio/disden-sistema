* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �    ARCHIVO: LCAJPX0.PRG                                                  �
* �       AUTOR: G. REINER                                                   �
* � Date created: 01-27-93                                                   �
* � Time created: 02:31:47pm                                                 �
* �    Copyright: 1993 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
* GENERA INDICES PARA LISTADO DE SALDOS DE CAJA
FUNCTION LCAJPX0
	=working()
	NADA=GENTMP()
	=OPGAS()
	SELE caj
	SET ORDER TO CODCLI IN PER
	SET RELA TO CODCLI INTO PER
	SET ORDER TO PROCOD IN PRO
	SET RELA TO CODCLI INTO PRO ADDI
	SET ORDER TO GASCOD IN MIX
	SET RELA TO GASTO INTO MIX ADDI
	IF FILCLI=3
		IF ".T."=FISC
			INDE ON codcli TO (NADA) COMP
		ELSE
			INDE ON codcli TO (NADA) FOR EVAL(FISC) COMP
		ENDIF
		ACLA=PAIP+PADC("CLIENTE",30)+PAIP+PADC("MONTO",13)+PAIP
	ENDIF
	IF FILpro=3
		IF ".T."=FISC
			INDE ON codcli TO (NADA) COMP
		ELSE
			INDE ON codcli TO (NADA) FOR EVAL(FISC) COMP
		ENDIF
		ACLA=PAIP+PADC("PROVEEDOR",30)+PAIP+PADC("MONTO",13)+PAIP
	ENDIF
	if filfec=3
		IF ".T."=FISC
			INDE ON DTOS(FECHAOP) TO (NADA) COMP
		ELSE
			INDE ON DTOS(FECHAOP) TO (NADA) FOR EVAL(FISC) COMP
		ENDIF
		ACLA=PAIP+PADC("FECHA",8)+PAIP+PADC("MONTO",13)+PAIP
	ENDIF
	IF FILGAS=3
		IF ".T."=FISC
			INDE ON gasto TO (NADA) COMP
		ELSE
			INDE ON gasto TO (NADA) FOR EVAL(FISC) COMP
		ENDIF
		ACLA=PAIP+PADC("TIPO DE GASTO",20)+PAIP+PADC("MONTO",13)+PAIP
	ENDIF
	LNS=REPL("=",LEN(ACLA))
	=unwork()
RETURN .T.

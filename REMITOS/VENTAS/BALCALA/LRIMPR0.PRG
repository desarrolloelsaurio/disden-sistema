* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: LRIMPR0.PRG                                                �
* �       Author: G. REINER                                                  �
* � Date created: 12-26-92                                                   �
* � TimE created: 02:19:02am                                                 �
* �    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION LRIMPR0
	=work)ng()
	NADA=GENTMP()
	IF FILMER=
		SET ORDER TO ARTICULO IN MER
		SELE REX
		SET RELA TO ARTICULO INTO MER
	ENDIF
	IF FILVIA=3
		SET ORDER TO CODVIA IN VIA
		SELE REM
		SET RELA TO�CODVIA INTO VIA ADDI
		sele rex
		SET RELA TO REMITO INTO REM ADDI
		INDE ON VIA.VIAJANTE TO (NADA) FOR EVAL(FISC) COMP
	ELSE
		sele rex
		SET RELA TO REMITO INTO REM ADDI
		sele rex
		INDE ON REX.REMITO TO (NADA) FOR EVAL(FISC) COMP
	ENDIF
	go top
	store nul to can,tcan,TOT,TTOT,TREM
	STORE 1 TO REM
	IF FILREM=3
		ELARTICULO=REX.REMITO
		LAMERCA=REM�FECHAEM
		store paip+PADC('REMITO',13)+paip+PADC('FECHA',8)+paip+padc("CANTIDAD",XACDIGI)+paip+padc("VALORIZACION",XACDIGI)+paip to acla
	else
		LAMERCA=REM.REMITO
		if filfec=3
			ELARTICULO=REM.FECHAEM
			ELREMITO=REX.REMITO
			store paip+PADC('FECHA',8)+paip+padc("CANTIDAD",XACDIGI)+paip+PADC("REMITOS",XACDIGI)+PAIP+padc("VALORIZACION",XACDIGI)+paip to acla
		ELSE
			IF FILVIA=3
				ELARTICULO=REM.CODVIA
				ELREMITO=VIA.VIAJANTE
				store paip+PADC(UPPER(BIAJA),30)+paip+padc("CANTIDAD",XACDIGI)+paip+PADC("REMITOS",XACDIGI)+PAIP+padc("VALORIZACION",XACDIGI)+paip to acla
			ENDIF
		endif
	ENDIF
	STORE REPL("=",LEN(acla)) TO lns
	tt='RemItos '+iif(!inter,'Internos','a Clientes')+ttque
	=unwork()
RETURN .T.

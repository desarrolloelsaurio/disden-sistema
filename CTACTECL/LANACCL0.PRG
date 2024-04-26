* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LANACCL0.PRG                                             บ
* บ COMENTARIO    : GENERA CABECERA PARA LISTADO DE ANALISIS                 บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LANACCL0
	=WORKING()
	=DOTALK()
	ELCOD=IIF(USED('PER'),PER.CODCLI,PER.CODCLI)
	SELE CCL
	SET ORDER TO
	TMP=GENTMP()
	TMP1=GENTMP()
	COPY TO (TMP) FOR CODCLI=M.ELCOD
	SELE 0
	USE (TMP) EXCL
	SORT ON COMPR,FECHAOP,FECHAVE,COMPRRE TO (TMP1)
	USE (TMP1) EXCL
	COPY TO (TMP)
	USE (TMP) ALIAS TMP EXCL
 	SELE TMP
	=UNTALK()
RETURN .T.

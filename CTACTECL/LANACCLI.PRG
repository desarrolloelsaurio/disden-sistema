* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LANACPER.PRG                                             บ
* บ COMENTARIO    : GENERA BASE PARA LISTADO DE ANALISIS Cta Cte             บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
ULPR=HORA_ULP(PROGRAM())
if !pideclav(1)
	return
endif
IF CHEQSEG()
	IF USED('PER')
		SELE PER
	ELSE
		=OPCCL()
		=OPCLI()
		SELE PER
	ENDIF
	STORE NUL TO RESPUESTA
	IF ELICLI("a Listar",-1,1)
		=LANACCL0()
		ACTI SCRE
		IF _WINDOWS .OR. ;
				CARTEL("COLOQUE PAPEL ANCHO EN LA IMPRESORA","Y TOQUE [ENTER] PARA CONTINUAR","O [ESC] PARA INTERRUMPIR","EL LISTADO")#27
			REPO FORM LANACCLI TO PRIN PROMPT NOCONSOLE NOEJECT
		ENDIF
		=UNWORK()
		SELE TMP
		TMP=DBF()
		USE
		=OFF_TMP()
		=OPCCL()
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPVIA.PRG                                                บ
* บ COMENTARIO    : ABRE BASE DE VIAJANTES Y ZONAS DE VIAJANTES              บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 07-25-93                                                    บ
* บ HORA       : 01:46:02pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ MODIFICACIONES: 07-25-93 07:24pm AGREGO ORDPOP1 QUE DECIDE EL POPUP      บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER SHIT
IF SSTM1#"HOGAR"
	IF !USED("VIX")
		=MEN_LIN(ABA+BIAJAS)
		=GETDBF('VIAJADAT','CODVIA','VIX',20)
	ENDIF
ENDIF
IF USED("VIA")
	SELE VIA
ELSE
	=MEN_LIN(ABA+BIAJAS)
	=PRXAREA(.T.)
    =GETDBF('VIAJANTE',.F.,'VIA')
ENDIF
IF VIAPOP
    SELE VIA
	IF TYPE("ORDPOP1")="U" .OR. !ORDPOP1
		=DEFPOGRL(VIAPOPR,VIAPOPC,"VIAPOP","VIA.VIAJANTE",30,"ELIJA "+BIAJA)
	ELSE
		=DEFPOGRL(VIAPOPR,VIAPOPC,"VIAPOP","VIA.CODVIA",10,"ELIJA "+BIAJA)
	ENDIF
ELSE
	RELE POPU VIAPOP
ENDIF
RETURN MEN_LIN(BOTOM)

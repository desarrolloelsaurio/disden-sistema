* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : BALANCE5.PRG                                             บ
* บ COMENTARIO    : BALANCE GENERAL POR PANTALLA                             บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-16-93                                                    บ
* บ HORA       : 07:55:52pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
IF HAYCUE()
	STORE 0 TO MNIV,MES,MES2,INICIO,FINAL,PERINI,PERFIN,ARRASANIO,ARRASMES,MLIM
	STORE " " TO AP,TR,FISC,FISC1
	IF LISBAL("BALANCE POR PANTALLA",.F.,.T.,.T.)
		RELEASE PAR, TTL, TTR
		DECLARE PAR[5], TTL[5] , TTR[5]
		STORE 0 TO TTL,TTR
		STORE .F. TO PORFEC
		=LISTADO3(.T.)
		=WIN0()
		TIT="BALANCE POR PANTALLA "+QUEAP()
		STORE 1 TO C,NPAG
		STORE 0 TO DPAR,HPAR,DFIN,HFIN,T1,T2,T3,T4
		DO TIT5
		SELE BAL1
		GO TOP
		MILES=INT(INICIO/10^7)
		MILTEX=NOMBRE
		SCAN
			IF BALANC51(.F.,.F.,.F.,17)
				EXIT
			ENDIF
		ENDSCAN
		IF C<70
		    STORE .F. TO IMPRESORA
			=BALANC52(.T.)
		ENDIF
		RELE WIND WIN0
		SELE BAL1
		=OFF_TMP()
	ENDIF
ENDIF
RELE WIND WIN0
RELE WIND WIN
=MEN_LIN(SYSNOMBRE)
RETURN

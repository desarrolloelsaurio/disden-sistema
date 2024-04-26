* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : BALANCE7.PRG                                             บ
* บ COMENTARIO    : BALANCE AฅO ANTERIOR POR PANTALLA E IMPRESORA            บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-16-93                                                    บ
* บ HORA       : 04:39:41pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER POREPSON
IF HAYCUE()
	=MEN_LIN(SYSNOMBRE)
	STORE 0 TO MNIV,MES,MES2,INICIO,FINAL,PERINI,PERFIN,ARRASANIO,ARRASMES,MLIM
	STORE " " TO AP,TR,FISC,FISC1
	RELEASE PAR, TTL, TTR
	DECLARE PAR[5], TTL[5] , TTR[5]
	STORE 0 TO TTL,TTR
	STORE .F. TO PORFEC
	IF CONFIRM1("Emisiขn Listado Balance Aคo Anterior por "+IIF(POREPSON,"Impresora","Pantalla"))
		FISC="!EMPTY(DEBE0) .OR. !EMPTY(HABER0)"
		=LISTADO3(.T.)
		IF POREPSON
			SET CONSOLE OFF
			DO TEST_IMP
			do cabpri
			STORE 1 TO C
		ELSE
			=WIN0()
		ENDIF
		TIT="BALANCE AฅO ANTERIOR"
		STORE 1 TO C,NPAG
		STORE 0 TO DPAR,HPAR,DFIN,HFIN,T1,T2,T3,T4
		IF POREPSON
			DO TIT4
		ELSE
			DO TIT5
		ENDIF
		SELE BAL1
		GO TOP
		MILES=INT(BAL1.CODIGO/10^7)
		MILTEX=BAL1.NOMBRE
		SCAN
			IF BALANC51(.T.,POREPSON,IIF(POREPSON,4,0),IIF(POREPSON,60,17)) .AND. !POREPSON
				EXIT
			ENDIF
		ENDSCAN
		IF C<70 .OR. POREPSON
			STORE POREPSON TO IMPRESORA
			=BALANC52(.T.)
		ENDIF
		RELE WIND WIN0
	ENDIF
	SELE BAL1
	=OFF_TMP()
ENDIF
RELE WIND WIN0
RELE WIND WIN
=MEN_LIN(SYSNOMBRE)
RETURN

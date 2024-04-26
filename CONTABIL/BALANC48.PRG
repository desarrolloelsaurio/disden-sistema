* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : BALANC48.PRG                                             บ
* บ COMENTARIO    : BALANCE PARA CUENTAS NO IMPUTABLES CON NIVEL MAYOR A 4   บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-14-93                                                    บ
* บ HORA       : 01:27:12am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
EXTERNAL ARRAY TTR,PAR,TTL
? CHR(27)+CHR(64)
STORE .F. TO PORFEC
=LISTADO3(.T.)
TIT="BALANCE GENERAL "+QUEAP()
DO TIT48
SELE BAL1
GO TOP
MILES=INT(INICIO/10^7)
MILTEX=NOMBRE
SCAN
	IF !EMPTY(NIVEL)
		IF MILES#INT(CODIGO/10^7)
			MILES=INT(CODIGO/10^7)
			? REPL("-",76)
			? PAIP
			?? PADR("!TOTAL "+MILTEX,49)
			?? PAIP
			?? TRAN(TTR[1],PICU9)
			?? SPACE(8)
			?? PAIP
			? PAIP
			?? SPACE(49)
			?? PAIP
			?? SPACE(7)
			?? TRAN(TTR[8],PICU9)
			?? PAIPI
			STORE 0 TO TTR
			MILTEX=NOMBRE
			C=C+3
			DO EJEPAG WITH 48,.T.
		ENDIF
		STORE 0 TO PAR
		MISPAR=SUMPER()
		IF !EMPTY(MISPAR)
			STORE IIF(IMPUTABLE="I",8,NIVEL) TO INDICA
			STORE MISPAR TO PAR[INDICA]
			? PAIPD
			?? STR(CODIGO,8)
			?? PAIP2
			SPC1=(NIVEL-1)
			SPC2=(9-NIVEL)
			?? SPACE(SPC1)
			?? NOMBRE
			?? SPACE(SPC2)
			?? PAIP
			?? SPACE(SPC1)
			?? TRAN(PAR[INDICA],PICU9)
			?? SPACE(SPC2)
			?? PAIPI
			STORE TTL[INDICA]+PAR[INDICA] TO TTL[INDICA]
			STORE TTR[INDICA]+PAR[INDICA] TO TTR[INDICA]
			STORE C+1 TO C
			DO EJEPAG WITH 48,.F.
		ENDIF
	ENDIF
ENDSCAN
? REPL("-",76)
? PAIP
?? LEFT("!TOTAL "+MILTEX+SPACE(49),49)
?? PAIP
?? TRAN(TTR[1],PICU9)
?? SPACE(8)
?? PAIP
? PAIP
?? SPACE(49)
?? PAIP
?? SPACE(7)
?? TRAN(TTR[8],PICU9)
?? PAIPI
C=C+3
? REPL("-",76)
? REPL("-",76)
? PAIP
?? LEFT("!SALDOS FINALES"+SPACE(49),49)
?? PAIP
?? TRAN(TTL[1],PICU9)
?? SPACE(8)
?? PAIP
? PAIP
?? SPACE(49)
?? PAIP
?? SPACE(7)
?? TRAN(TTL[8],PICU9)
?? PAIPI
? REPL("-",76)
?
DO FINIMP
SELE BAL1
=OFF_TMP()
=MEN_LIN(SYSNOMBRE)
RETURN

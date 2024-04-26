* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : BALANCE1.PRG                                             บ
* บ COMENTARIO    : BALANCE DE SUMAS Y SALDOS                                บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-14-93                                                    บ
* บ HORA       : 01:26:34am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
IF HAYCUE()
	STORE 0 TO MNIV,MES,MES2,INICIO,FINAL,FISC,FISC1,PERINI,PERFIN,ARRASANIO,ARRASMES,MLIM
	STORE " " TO AP,TR
	STORE 1 TO NPAG
	STORE .F. TO PORFEC
	IF LISBAL("BALANCE DE SUMAS Y SALDOS",.T.)
		IF PREGUNT1("Est n en condiciones la Impresora y el Papel")
			=LISTADO3(.T.)
			SELE BAL1
			GO TOP
			SET CONSOLE OFF
			DO TEST_IMP
			DO CABPRI
			STORE 1 TO C
			STORE 0 TO DPAR,HPAR,DFIN,HFIN,T1,T2,T3,T4
			TIT="BALANCE DE SUMAS Y SALDOS "+QUEAP()
			? CHR(27)+CHR(15)
			DO TIT1
			SCAN
				DO ACBALAN1
				STORE DPAR-HPAR TO SALDO
				? PAIPD
				?? STR(BAL1.CODIGO,8)
				?? PAIP2
				?? BAL1.NOMBRE
				?? PAIP2
				?? TRAN(DPAR,PICU9)
				?? PAIP2
				?? TRAN(HPAR,PICU9)
				?? PAIP2
				IF SALDO>0
					?? TRAN(SALDO,PICU9)
					?? PAIP2
					?? TRAN(0,PICU9)
					?? PAIP2
					STORE T3+SALDO TO T3
				ELSE
					STORE ABS(SALDO) TO SALDO
					?? TRAN(0,PICU9)
					?? PAIP2
					?? TRAN(SALDO,PICU9)
					?? PAIP2
					STORE T4+SALDO TO T4
				ENDIF
				STORE T1+DPAR TO T1
				STORE T2+HPAR TO T2
				STORE C+1 TO C
				IF _PLINENO>66
					=F_BAL1("TRANSPORTE")
					DO EJEPAG WITH 1,.F.
				ENDIF
			ENDSCAN
			=F_BAL1("SALDOS FINALES")
			?
			DO FINIMP
			DO EJEPAG WITH 1000,.T.
			SELE BAL1
			=OFF_TMP()
		ENDIF
	ENDIF
ENDIF
=MEN_LIN(SYSNOMBRE)
RETURN

FUNCTION F_BAL1
	PARAMETERS F_TEXTO
	? REPL("-",121)
	? PAIP
	?? PADC(F_TEXTO,43)
	?? PAIPD
	?? TRAN(T1,PICU9)
	?? PAIP2
	?? TRAN(T2,PICU9)
	?? PAIP2
	?? TRAN(T3,PICU9)
	?? PAIP2
	?? TRAN(T4,PICU9)
	?? PAIP2
	? REPL("-",121)
RETURN .T.

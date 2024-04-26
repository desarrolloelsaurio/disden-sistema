* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : BALANCE3.PRG                                             บ
* บ COMENTARIO    : BALANCE AฅO COMPLETO                                     บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-12-93                                                    บ
* บ HORA       : 04:34:41pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
if haycue()
	STORE 1 TO ARRASANIO,ARRASMES,NPAG
	store 0 to MNIV,MES,MES2,INICIO,FINAL,fisc,fisc1,PERINI,PERFIN,MLIM
	store " " to AP,TR
	STORE .F. TO PORFEC
	IF LISBAL("BALANCE DE SUMAS Y SALDOS",.T.,.F.)
		IF PREGUNT1("Est  en lกnea la Impresora y el Papel en posiciขn")
			=listado3(.t.)
			sele bal1
			set console off
			do TEST_IMP
			DO CABPRI
			store 1 to C
			T1="! CODIGO !"
			T1=T1+IIF(ARRASANIO,"AฅO ANTERIOR!","")
			ELFIN=IIF(PERFIN<PERINI,PERFIN+12,PERFIN)
			FOR A=PERINI TO ELFIN
				COD=IIF(A>12,A-12,A)
				T1=T1+PADC(ALLTRIM(KMESES[COD]),12)+PAIP
			NEXT
			T1=T1+PADC("TOTAL",12)+PAIP
			TIT="BALANCE DE SUMAS Y SALDOS POR MES "+QUEAP()
			? chr(27)+chr(15)
			DO TIT3
			DIME DBX[14],DBP[14]
			STORE 0 TO DBX
			SCAN
				SCAT TO NADA
				STORE 0 TO DBP
				FOR A=PERINI TO ELFIN
					COD=IIF(A>12,A-12,A)
					POSIC=(COD+2)*2
					DBP[COD]=NADA[POSIC]-NADA[POSIC+1]
				NEXT
				DBP[13]=DEBE0-HABER0
				?  PAIP
				?? str(BAL1.CODIGO,8)
				?? PAIP
				IF ARRASANIO
					?? STR(DBP[13],12,2)
					?? PAIP
					DBP[14]=DBP[13]
					DBX[13]=DBX[13]+DBP[13]
					DBX[14]=DBX[14]+DBP[14]
				ENDIF
				FOR A=PERINI TO ELFIN
					COD=IIF(A>12,A-12,A)
					?? STR(DBP[COD],12,2)
					?? PAIP
					DBX[COD]=DBX[COD]+DBP[COD]
					DBP[14]=DBP[14]+DBP[COD]
					DBX[14]=DBX[14]+DBP[COD]
				NEXT
				?? STR(DBP[14],12,2)
				?? PAIP
				store C+1 to C
				IF _PLINENO>66
					DO BALAN31 WITH "TRASP."
					DO LINF WITH 65
					C=1
					DO TIT3
				endif
			endSCAN
			DO BALAN31 WITH "FINAL"
			DO FINIMP
		ENDIF
		SELE BAL1
		=OFF_TMP()
	ENDIF
ENDIF
=MEN_LIN(SYSNOMBRE)
RETURN

PROCEDURE BALAN31
	PARAMETER	B_TEX
	? REPL("-",LEN(T1))
	? PAIP
	?? PADR(B_TEX,8)
	?? PAIP
	IF ARRASANIO
		?? STR(DBX[13],12,2)
		?? PAIP
	ENDIF
	FOR A=PERINI TO ELFIN
		COD=IIF(A>12,A-12,A)
		?? STR(DBX[COD],12,2)
		?? PAIP
	NEXT
	?? STR(DBX[14],12,2)
	?? PAIP
	C=C+2
RETURN

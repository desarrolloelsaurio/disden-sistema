*
*                          ACUMULA PARA BALANCE 3
*
* ACBALAN2.PRG
*
if SEMESTRE=1
	if AP="P"
		SCAT TO NADA 
		FOR XX3=KPERINIC TO KPERINIC+5
			POSIC=iif(XX3>12,XX3-12,XX3)
			POSIC=(POSIC+2)*2
			X1=NADA[POSIC]
			X2=NADA[POSIC+1]
			store "DPAR"+ltrim(str(XX3,2)) to X3
			store "HPAR"+ltrim(str(XX3,2)) to X4
			store EVAL(X3)+EVAL(X1) TO &X3
			store EVAL(X4)+EVAL(X2) TO &X4
			RELE NADA
		NEXT
		store DPAR0+DEBE0 to DPAR0
		store HPAR0+HABER0 to HPAR0
	else
		store 0 to AC1,AC2
		store KPERINIC to XX
		store 1 to XX3
		do while XX<KPERINIC+6
			XX2=iif(XX>12,XX-12,XX)
			store "DEBE"+ltrim(str(XX2,2)) to X1
			store "HABER"+ltrim(str(XX2,2)) to X2
			store "DPAR"+ltrim(str(XX3,2)) to X3
			store "HPAR"+ltrim(str(XX3,2)) to X4
			store EVAL(X3)+EVAL(X1)+AC1 TO &X3
			store EVAL(X4)+EVAL(X2)+AC2 TO &X4
			store AC1+EVAL(X1) to AC1
			store AC2+EVAL(X2) to AC2
			store XX+1 to XX
			store XX3+1 to XX3
		enddo
		store DPAR0+DEBE0 to DPAR0
		store HPAR0+HABER0 to HPAR0
	endif
else
	if AP="P"
		store KPERINIC to XX
		do while XX<KPERINIC+6
			XX2=iif(XX>12,XX-12,XX)
			store "DEBE"+ltrim(str(XX2,2)) to X1
			store "HABER"+ltrim(str(XX2,2)) to X2
			store TOT+EVAL(X1)-EVAL(X2) to TOT
			store XX+1 to XX
		enddo
		store KPERINIC+6 to XX
		store 1 to XX3
		do while XX<KPERINIC+12
			XX2=iif(XX>12,XX-12,XX)
			store "DEBE"+ltrim(str(XX2,2)) to X1
			store "HABER"+ltrim(str(XX2,2)) to X2
			store "DPAR"+ltrim(str(XX3,2)) to X3
			store "HPAR"+ltrim(str(XX3,2)) to X4
			store TOT+EVAL(X1)-EVAL(X2) to TOT
			store EVAL(X3)+EVAL(X1) TO &X3
			store EVAL(X4)+EVAL(X2) TO &X4
			store XX+1 to XX
			store XX3+1 to XX3
		enddo
	else
		store 0 to AC1,AC2
		store KPERINIC to XX
		do while XX<KPERINIC+6
			XX2=iif(XX>12,XX-12,XX)
			store "DEBE"+ltrim(str(XX2,2)) to X1
			store "HABER"+ltrim(str(XX2,2)) to X2
			store AC1+EVAL(X1) to AC1
			store AC2+EVAL(X2) to AC2
			store TOT+EVAL(X1)-EVAL(X2) to TOT
			store XX+1 to XX
		enddo
		store KPERINIC+6 to XX
		store 1 to XX3
		do while XX<KPERINIC+12
			XX2=iif(XX>12,XX-12,XX)
			store "DEBE"+ltrim(str(XX2,2)) to X1
			store "HABER"+ltrim(str(XX2,2)) to X2
			store "DPAR"+ltrim(str(XX3,2)) to X3
			store "HPAR"+ltrim(str(XX3,2)) to X4
			store TOT+EVAL(X1)-EVAL(X2) to TOT
			store EVAL(X3)+EVAL(X1)+AC1 TO &X3
			store EVAL(X4)+EVAL(X2)+AC2 TO &X4
			store AC1+EVAL(X1) to AC1
			store AC2+EVAL(X2) to AC2
			store XX+1 to XX
			store XX3+1 to XX3
		enddo
		store DPAR0+DEBE0 to DPAR0
		store HPAR0+HABER0 to HPAR0
	endif
endif
return

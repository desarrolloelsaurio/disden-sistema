PROCEDURE RULER
	R=MROW("")
	C=MCOL("")
	DN="8....þ....7....þ....6....þ....5....þ....4....þ....3....þ....2....þ....1....þ...."
	UP="....þ....1....þ....2....þ....3....þ....4....þ....5....þ....6....þ....7....þ....8"
	DEFI WIND RULHZ FROM M.R,M.C-(SCOLS()-1) TO M.R,M.C+SCOLS() NONE COLO SCHE 7
	DEFI WIND RULVT FROM M.R-(SROWS()-1),M.C TO M.R+SROWS(),M.C NONE COLO SCHE 7
	ACTI WIND RULHZ
	@ 0,0 SAY RIGHT(dn,scols())
	@ $,$+1 say left(up,scols())
	ACTI WIND RULvt
	@ 0,0 SAY RIGHT(dn,srows())
	@ $,$ say "x"+left(up,srows())
	do while EMPTY(inkey("HM"))
		MOVE WIND RULHZ TO MROW(""),MCOL("")-SCOLS()
		MOVE WIND RULVT TO MROW("")-SROWS() ,MCOL("")
	ENDDO
	RELE WIND RULHZ,RULVT
	RETURN

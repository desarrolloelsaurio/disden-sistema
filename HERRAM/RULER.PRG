PROCEDURE RULER
	R=MROW("")
	C=MCOL("")
	DN="8....�....7....�....6....�....5....�....4....�....3....�....2....�....1....�...."
	UP="....�....1....�....2....�....3....�....4....�....5....�....6....�....7....�....8"
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

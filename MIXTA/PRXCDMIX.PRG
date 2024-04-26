function prxcdmix
	parameter p_alias,p_order
	el_alias=alias()
	sele (p_alias)
	set order to tag (p_order)
	dime prxa[43],prxb[43]
	store 1 to p_indice
	FOR xa = asc("0") TO asc("9")
		store chr(xa) to prxa[P_INDICE],prxb[P_INDICE]
		store p_indice+1 to p_indice
	ENDFOR
	FOR xa = asc("<") TO asc("\")
		store chr(xa) to prxa[P_INDICE],prxb[P_INDICE]
		store p_indice+1 to p_indice
	ENDFOR
FOR XA=1 TO 43
FOR XB=1 TO 43
P_COSA=PRXA[XA]+PRXB[XB]
IF !SEEK(P_COSA)
   EXIT
ENDIF
NEXT
NEXT
SELE (EL_ALIAS)
RETURN WNCL("PROXIMO CODIGO:"+M.P_COSA)
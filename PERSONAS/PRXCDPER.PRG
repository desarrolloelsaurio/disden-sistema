function prxcdper
	parameter p_alias,p_order,p_filtro
	el_alias=alias()
	sele (p_alias)
	set order to tag (p_order)
	p_largo=10-len(p_filtro)
	FOR xa = 1 TO 999999999
		p_cosa=p_filtro+zero(xa,p_largo)
		IF !SEEK(P_COSA)
			EXIT
		ENDIF
	ENDFOR
	SELE (EL_ALIAS)
RETURN WNCL("PROXIMO CODIGO:"+M.P_COSA)

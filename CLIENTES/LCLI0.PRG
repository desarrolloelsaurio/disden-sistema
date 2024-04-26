FUNCTION LCLI0
	?paip
	=iif(variable[1],qout(codcli+paip),'')
	=iif(variable[2],qout(cliente+paip),'')
	=IIF(VARIABLE[3],QOUT(enccom+PAIP),'')
	=IIF(VARIABLE[4],QouT(domicilio+PAIP),'')
	IF VARIABLE[5]
		=XSEEK(LOCALIDAD,'MIX','CIUCOD')
		?? LEFT(MIX.TEXTO1,TEXTO[5,2])
		?? PAIP
	ENDIF
	=IIF(VARIABLE[6],QOUT(telefonos+PAIP),'')
	=IIF(VARIABLE[7],QOUT(fax+PAIP),'')
	=IIF(VARIABLE[8],QOUT(padr(abrev(XACIVA[PER.condiva,1]),TEXTO[8,2])+PAIP),'')
	=IIF(VARIABLE[9],QOUT(nroiva+PAIP),'')
	IF VARIABLE[10]
		=XSEEK(ZONA,'MIX','ZONCOD')
		?? LEFT(MIX.TEXTO1,TEXTO[10,2])
		?? PAIP
	ENDIF
	=IIF(VARIABLE[11],QOUT(left(eval('XALIS'+ALLTRIM(STR(PRECIO))),texto[11,2])+paip),'')
	=IIF(VARIABLE[12],QOUT(dtoc(fecha)+PAIP),'')
	=IIF(VARIABLE[13],QOUT(usuario+PAIP),'')
	CASOS=CASOS+1
RETURN .T.

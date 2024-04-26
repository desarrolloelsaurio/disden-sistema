FUNCTION LFACPCD0
	=WORKING()
	HAYDISC=HAYCAMPO("DISCRIM","MER")
	for a=1 to 15
		if !empty(xaciva[a,1])
			if xaciva[a,3]='SI'
				px[a]=(xaciva[a,2]+xaciva[a,4]+xaciva[a,6])/100
			else
				px[a]=1+(xaciva[a,2]+xaciva[a,4]+xaciva[a,6])/100
			endif
		endif
	NEXT
	set order to TAG codcli IN PER
	set order to TAG articulo in mer
	sele fac
	SET ORDER TO TAG FACTURA
	set rela to codcli INTO PER
	sele fax
	set rela to articulo into mer addi
	set rela to factura into fac addi
	sele fax
	NADA=GENTMP()
	FISC=FISC+' .AND. !EMPTY(PER.CONDIVA)'
	INDE ON MER.MERCA TO (NADA) FOR EVAL(FISC) COMP
	sele fax
	go top
	store paip+PADC('ARTICULO',10)+paip+PADC('DENOMINACION',30)+paip to acla
	acla=acla+padc("UNIDADES",XACDIGI)+PAIP+;
	IIF(HAYDISC,PADC("PESO",XACDIGI)+PAIP,"")+;
	PADC("COSTO",XACDIGI)+PAIP+;
	PADC("VENTA GRAVADA",XACDIGI)+PAIP+;
	PADC("DIFERENCIA",XACDIGI)+PAIP
	STORE REPL("=",LEN(acla)) TO lns
	tt='Listado de Mercader¡as s/'+tit_invo+' - COSTO '+chr(13)+chr(10)+"(Costos de Reposici¢n)"+TTQUE
	=unwork()
RETURN .T.

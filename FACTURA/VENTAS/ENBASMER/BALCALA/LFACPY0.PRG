FUNCTION LFACPY0
	=WORKING()
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
	set rela to codcli INTO PER
	sele fax
	set rela to articulo into mer addi
	set rela to factura into fac addi
	NADA=GENTMP()
	FISC=FISC+' .AND. !EMPTY(PER.CONDIVA)'
	INDE ON MER.MERCA TO (NADA) FOR EVAL(FISC) COMP
	sele fax
	go top
	store paip+PADC('ARTICULO',10)+;
	paip+PADC('DENOMINACION',30)+paip TO ACLA
	IF HAYDISC
	STORE ACLA+padc("UNIDADES",XACDIGI)+PAIP+padc("PESO",XACDIGI)+PAIP TO ACLA
	ELSE
	STORE ACLA+padc("CANTIDAD",XACDIGI)+PAIP TO ACLA
	ENDIF
	STORE ACLA+;
	padc("NETO GRAVADO",XACDIGI)+PAIP+;
	padc("IVA",XACDIGI)+PAIP+;
	padc("TOTAL",XACDIGI)+PAIP ;
    to acla
	STORE REPL("=",LEN(acla)) TO lns
	tt='Listado de Mercader¡as s/'+tit_invo+ttque
	=unwork()
RETURN .T.

FUNCTION LINQP1
	?paip
	=iif(variable[1],qout(codcli+paip),'')
	=iif(variable[2],qout(cliente+paip),'')
	=iif(variable[3],qout(left(PER.DOMICILIO,TEXTO[3,2])+paip),"")
	=iif(variable[4],qout(left(MIX.TEXTO1,TEXTO[4,2])+paip),"")
	=iif(variable[5],qout(left(PER.TELEFONO,TEXTO[5,2])+paip),"")
	=iif(variable[6],qout(LEFT(PER.TIPODOC,TEXTO[6,2])+paip),"")
	=iif(variable[7],qout(trans(PER.NRODOC,"99,999,999")+paip),"")
	=iif(variable[8],qout(left(xaciva[PER.condiva,1],TEXTO[8,2])+paip),"")
	=iif(variable[9],qout(left(PER.nroiva,TEXTO[9,2])+paip),"")
	=iif(variable[10],qout(DTOC(PER.FECHA)+paip),"")
	=iif(variable[11],qout(USUARIO+paip),"")
    STORE m.casos+1 TO m.casos
RETURN .T.

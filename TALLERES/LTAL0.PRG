FUNCTION LTAL0
? PAIP
=iif(variable[1],qout(tal.talcod+paip),'')
=iif(variable[2],qout(tal.talleres+paip),'')
=IIF(VARIABLE[3],QOUT(tal.domicilio+PAIP),'')
=IIF(VARIABLE[4],QouT(tal.localidad+PAIP),'')
=IIF(VARIABLE[5],QOUT(padr(abrev(xaciva[tal.condiva]),texto[5,2])+PAIP),'')
=IIF(VARIABLE[6],QOUT(tal.nroiva+PAIP),'')
=IIF(VARIABLE[7],QOUT(tal.telefono+PAIP),'')
=IIF(VARIABLE[8],QOUT(SAYMIX(PER.NU1,"ETACOD",TEXTO[8,2])+PAIP),"")
=IIF(VARIABLE[9],QOUT(DTOC(TAL.FECHA)+PAIP),'')
=IIF(VARIABLE[10],QOUT(TAL.USUARIO+PAIP),'')
CASOS=CASOS+1
RETURN .T.

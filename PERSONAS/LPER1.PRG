* ษอออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LPERP1.PRG                    บ
* บ COMENTARIO    : CUERPO DE LISTADO DE PERSONAS บ
* ศอออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LPER1
	#DEFINE PAIP   "|"                             && PAIP
	? PAIP         
	caract=saygrl(per.localidad,"mix","ciucod", ;
                 "allt(left(mix.texto2,18))")+" - "
	=IIF(VARIABLE[1],QOUT(left(CODCLI,TEXTO[1,2])+PAIP),"")
	=IIF(VARIABLE[2],QOUT(left(CLIENTE,TEXTO[2,2])+PAIP),"")
	=IIF(VARIABLE[3],QOUT(left(DOMICILIO,TEXTO[3,2])+PAIP),"")
	=IIF(VARIABLE[4],QOUT(SAYMIX(LOCALIDAD,"CIUCOD",TEXTO[4,2])+PAIP),"")
	=IIF(VARIABLE[5],QOUT(left(caract+TELEFONO,TEXTO[5,2])+PAIP),"")
	=IIF(VARIABLE[6],QOUT(left(caract+FAX,TEXTO[6,2])+PAIP),"")
	=IIF(VARIABLE[7],QOUT(SAYMIX(TIPODOC,"DNICOD",6)+" "+TRAN(NRODOC,"@R 99.999.999")+PAIP),"")
	=IIF(VARIABLE[8],QOUT(IIF(PORPAN,CONDIVA,SAYMIX(CONDIVA,"IVACOD",TEXTO[8,2],20))+PAIP),"")
	=IIF(VARIABLE[9],QOUT(left(NROIVA,TEXTO[9,2])+PAIP),"")
	=IIF(VARIABLE[10],QOUT(DTOC(FECHANAC)+PAIP),"")
	=IIF(VARIABLE[11],QOUT(DETALLE+PAIP),"")
	CASOS=CASOS+1
RETURN .T.

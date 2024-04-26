FUNCTION LREMP41
IF ELPRO#REM.PROVEEDOR .OR. LAREM#REM.REMESA
  CASOS=CASOS+1
  ? M.LINEA
  ELPRO=REM.PROVEEDOR
  LAREM=REM.REMESA
ENDIF  
?paip
=iif(variable[1],qout(LEFT(PRO.PROVEEDOR,TEXTO[1,2])+paip),'')
=iif(variable[2],qout(STR(REMESA,TEXTO[2,2])+paip),'')
=iif(variable[3],qout(DTOC(FECHAOP)+paip),'')
=IIF(VARIABLE[4],QOUT(LEFT(MER.PALPOPUP,TEXTO[4,2])+PAIP),"")
=iif(variable[5],qout(STR(BULTOS,TEXTO[5,2])+paip),'')
=iif(variable[6],qout(STR(VENDIDO,TEXTO[6,2])+paip),'')
=IIF(VARIABLE[7],qout(STR(BULTOS-VENDIDO,TEXTO[7,2])+paip),'')
=iif(variable[8],qout(IIF(AGOTADA='S','SI','  ')+paip),'')
=IIF(VARIABLE[9],QOUT(DTOC(FECHA)+PAIP),"")
=IIF(VARIABLE[10],QOUT(USUARIO+PAIP),"")
RETURN .T.
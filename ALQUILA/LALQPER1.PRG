* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LALQPER1.PRG                                             บ
* บ COMENTARIO    :                                                          บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LALQPER1
	?PAIP
	=IIF(VARIABLE[1],QOUT(LEFT(CODINM,TEXTO[1,2])+PAIP),'')
	=IIF(VARIABLE[2],QOUT(LEFT(DOMICILIO,TEXTO[2,2])+PAIP),'')
	=IIF(VARIABLE[3],QOUT(LEFT(TEXTO1,TEXTO[3,2])+PAIP),'')
	=IIF(VARIABLE[4],QOUT(LEFT(CLIENTE,TEXTO[4,2])+PAIP),'')
	=IIF(VARIABLE[5],QOUT(LEFT(DETALLE,TEXTO[5,2])+PAIP),'')
	=IIF(VARIABLE[6],QOUT(LEFT(INMOC,TEXTO[6,2])+PAIP),'')
	=IIF(VARIABLE[7],QOUT(LEFT(MUNIC,TEXTO[7,2])+PAIP),'')
	=IIF(VARIABLE[8],QOUT(LEFT(DIPOC,TEXTO[8,2])+PAIP),'')
	=IIF(PORSHIT=2,IIF(VARIABLE[9],QOUT(STR(ALQ.DIAVENC,TEXTO[9,2])+PAIP),''),"")
	CASOS=CASOS+1
RETURN .T.

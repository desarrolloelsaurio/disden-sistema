* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: LCOSP1.PRG                                                 �
* �       Author: G. REINER                                                  �
* � Date created: 11-01-92                                                   �
* � Time created: 06:23:39pm                                                 �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION LCOSP1
	? PAIP
	=IIF(VARIABLE[1],QOUT(RUBRO+PAIP),"")
	=IIF(VARIABLE[2],QOUT(SUBRUBRO+PAIP),"")
	=IIF(VARIABLE[3],QOUT(STR(ARTICULO,TEXTO[3,2])+PAIP),"")
	=IIF(VARIABLE[4],QOUT(LEFT(MERCA,TEXTO[4,2])+PAIP),"")
	=IIF(VARIABLE[5],QOUT(LEFT(MI1.TEXTO1,TEXTO[6,2])+PAIP),"")
	=IIF(VARIABLE[6],QOUT(LEFT(PRO.PROVEEDOR,TEXTO[6,2])+PAIP),"")
	=IIF(VARIABLE[7],QOUT(STR(MER.COSTOAU,XACDIGI,2)+PAIP),"")
	=IIF(VARIABLE[8],QOUT(STR(MER.COSTODOL,XACDIGI,2)+PAIP),"")
	=IIF(VARIABLE[9],QOUT(STR(MER.COSTOAU*PRO.COEFRES,XACDIGI,2)+PAIP),"")
	=IIF(VARIABLE[10],QOUT(STR(MER.COSTODOL*PRO.COEFRES,XACDIGI,2)+PAIP),"")
	CASOS=CASOS+1
RETURN .T.

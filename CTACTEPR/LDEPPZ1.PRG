* �� Funci�n  �������������������Ŀ
* �  Description: LDEPPZ1         �
* �       Author: G. REINER       �
* � Date created: 10-16-92        �
* � Time created: 02:32:43pm      �
* ���������������������������������
FUNCTION LDEPPZ1
	?PAIP
	=IIF(VARIABLE[1],QOUT(DTOC(CCP.FECHAOP)+PAIP),'')
	=IIF(VARIABLE[2],QOUT(DTOC(CCP.FECHAVE)+PAIP),'')
	=IIF(VARIABLE[3],QOUT(LEFT(PRO.PROVEEDOR,TEXTO[3,2])+PAIP),'')
	=IIF(VARIABLE[4],QOUT(LEFT(CCP.DETALLE,TEXTO[4,2])+PAIP),'')
	=IIF(VARIABLE[5],QOUT(LEFT(CCP.COMPR,TEXTO[5,2])+PAIP),'')
	IF VARIABLE[6]
		PARC=ccp.MONTO-ccp.CUOTA
		?? STR(PARC,XACDIGI,2)
		?? PAIP
		TTL[6]=TTL[6]+PARC
		PTL[6]=PTL[6]+PARC
	endif
	CASOS=CASOS+1
RETURN .T.

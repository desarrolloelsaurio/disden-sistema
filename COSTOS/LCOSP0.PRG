* 旼 FUNCION  컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �  Description: LCOSP0.PRG                                                 �
* �       Author: G. REINER                                                  �
* � Date created: 11-01-92                                                   �
* � Time created: 05:37:53pm                                                 �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION LCOSP0
	PARAMETER ESPRECIO
	=WORKING()
	SET ORDER TO TAG MARCOD in mi1
	SET ORDER TO TAG TODOS in rub
	SET ORDER TO TAG PROCOD in PRO
	SELE mer
	SET ORDER TO tag articulo
	SET RELA TO MARCA INTO MI1
	SET RELA TO STR(VAL(RUBRO))+STR(VAL(SUBRUBRO)) INTO RUB ADDI
	SET RELA TO PRO1 INTO PRO ADDI
	=LMERO(GENTMP())
	SELE MER
	GO TOP
	stor LEFT(RUB.PALISTAR,20) TO RUB1
	STOR RUB.RUBRO TO SRUB1
	acla=HAZ_ACLA()
	IF ESPRECIO
		TT='Lista de Precios'+iif(!empty(ttque),CHR(13)+CHR(10)+ttque,'')
	ELSE
		TT='Listado de Costos'+iif(!empty(ttque),CHR(13)+CHR(10)+ttque,'')
	ENDIF
	m.linea=REPL("=",LEN(acla))
	=UNWORK()
RETURN .T.

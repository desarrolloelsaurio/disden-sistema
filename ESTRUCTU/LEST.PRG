********************************************************************************
*-- Programa: lest.prg
*-- Fecha   : 06/25/91 04:11pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE listado de estructura de producto
********************************************************************************
PARAMETER PORPAN
ulpr=hora_ulp(PROGRAM())
do case
case bar()=1
	DO IMER_DO.SPR WITH .F.," Lista Estructura ",22,.F.,.T.
case bar()=2
	DO IMER_DO.SPR WITH .F.," Lista Estructura ",23,.F.,.T.
case bar()=3
	=OPMER()
	store 0 to respuesta
	do while !empty(eliprc(" a Listar",-1,1))
		TMP=GENTMP()
		=WORKING()
		=DOTALK()
		SELE EST
		SORT ON ARTICULO TO (TMP) FOR prc=prc.prccod
		=PRXAREA(.T.)
		USE (TMP) ALIAS TMP
		aclaPAN =PAIP+PADC('ARTICULO',15)+PAIP+;
			PADC('DESCRIPCION DEL ARTICULO',26)+PAIP+;
			PADC('T.ESTIM.',8)+PAIP+;
			PADC('T.REAL',8)+PAIP+;
			PADC('FECHA',8)+PAIP+;
			PADC('USUARIO',7)+PAIP
		aclaPRN =PAIP+PADC('ARTICULO',15)+PAIP+;
			PADC('DESCRIPCION DEL ARTICULO',30)+PAIP+;
			PADC('T.ESTIM.',8)+PAIP+;
			PADC('T.REAL',8)+PAIP+;
			PADC('CONDICION',40)+PAIP
		Tt='Listado de Estructura de Producto por Proceso '+;
			alltrim(prc.procfab)
		=UNTALK()
		=UNWORK()
		=XPRN1(4,"TMP","LEST2()",TT,"LEST2")
		=OFF_TMP()
		store 0 to respuesta
	enddo
endcase
RETURN MEN_LIN(BOTOM)

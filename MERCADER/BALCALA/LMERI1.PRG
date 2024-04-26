**********************************************************************
*-- Programa: LMERI1.PRG
*-- Fecha   : 03-27-92 02:00am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE MERCADERIA, SIN DESCRIPCION GLOBAL, POR IMPRESORA
*************************************************************************
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	=working()
	SET ORDER TO TAG CODRUB IN RUB
	SELE mer
	SET ORDER TO TAG ARTICULO
	SET RELA TO RUBRO INTO RUB
	=lmero(GENTMP())
	=HORA_ULP()
	=IMPRESOR()
	STOR NUL TO casos
	STORE 63 TO MXRN
	STORE PAIP+PADC("RUBRO",20)+PAIP+PADC("ARTICULO",10)+PAIP+PADC("MERCADERIA",30)+"|TEMPORADA|" TO ACLA
	STORE ACLA+"UNID|DISC|  FECHA | USUARIO  |" TO acla
	STORE REPL("=",LEN(acla)) TO lns
	STORE LEN(acla) TO largo
	STORE MIN(xacancho,xachoja) TO largoim
	=unwork()
	=MEN_LIN(IMPRIMIENDO)
	IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
		A=LEFT(sincosas(janname),8)+'.TXT'
		ACTI SCRE
		=MEN_LIN("Imprimiendo Listado en Archivo "+ALLTRIM(A))
		SET PRINTER TO (A)
	ENDIF
	STORE 'Listado de Mercader¡a' TO tt
	=CABPRI()
	PRINTJOB
	=cABPRI1()
	=TIT_LNS(3)
	SCAN FOR &fisc
		IF _PLINENO>MXRN
			=FIN_LNS(3,NUL)
			=CABPRI1()
			=TIT_LNS(4)
		ENDI
		?  PAIP
		?? RUB.RUBRO
		?? PAIP
		?? LEFT(articulo,10)
		?? PAIP
		?? MERCA
		?? PAIP
		?? LEFT(QTEM(TEMPORADA),10)
		?? PAIP
		?? STR(UNIDXBUL,4)
		?? PAIP
		?? IIF(DISCRIM,' SI ',' NO ')
		=IMPUSE()
	ENDSCAN
	=FIN_LNS(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN

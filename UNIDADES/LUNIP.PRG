********************************************************************************
*-- Programa: lUNIp.PRG
*-- Fecha   : 06/13/91 05:03pm
*-- Version : G. REINER
*-- Notas   : INGRESA UNIDADES
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=movewin(3,10,23,57,'win'," Listado Unidades ")
	clea
	@ NUL,NUL say '浜様様様様様様様様様様刺様様様様様様様様様様融'
	@ 1,NUL say '� Unidad de Fraccion. 査 Unidad de Fraccion. �'
	@ 2,NUL say '麺様様様様様様様様様様耕様様様様様様様様様様郵'
	=for_say('�'+SPACE(20)+'査'+SPACE(20)+'�',3,17,NUL)
	=ar_get(@unid,1,15,1,1,3,1,REPL('!',20))
	=ar_get(@unid,16,30,1,1,3,24,REPL('!',20))
	@ 18,NUL say '藩様様様様様様様様様様屡様様様様様様様様様様夕'
	clea gets
	acti scre
	=men_lin(tecmen)
	=inkey(NUL,'HM')
	=relewin("win")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

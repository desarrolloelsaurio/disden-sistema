********************************************************************************
*-- Programa: IUNI.PRG
*-- Fecha   : 06/13/91 05:03pm
*-- Version : G. REINER
*-- Notas   : INGRESA UNIDADES
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=MOVEWIN(3,10,23,57,'WIN'," Ingreso/Correcci�n Unidades ")
	clea
	@ NUL,NUL say '���������������������ͻ���������������������ͻ'
	@ 1,NUL say '� Unidad de Fraccion. �� Unidad de Fraccion. �'
	@ 2,NUL say '���������������������͹���������������������͹'
	=for_say('�'+SPACE(20)+'��'+SPACE(20)+'�',3,17,NUL)
	=ar_get(@unid,1,15,1,1,3,1,REPL('!',20))
	=ar_get(@unid,16,30,1,1,3,24,REPL('!',20))
	@ 18,NUL say '���������������������ͼ���������������������ͼ'
	read
	=RELEWIN("WIN")
ELSE
	=IAUDI()
ENDIF
return MEN_LIN(BOTOM)
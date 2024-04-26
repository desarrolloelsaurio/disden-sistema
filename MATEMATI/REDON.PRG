********************************************************************************
*-- Programa: redon.prg
*-- Fecha   : 28/07/90
*-- Version : g. reiner
*-- Notas   : FUNCION DE REDONDEO
********************************************************************************
FUNCTION REDON
	PARAMETER red_num
	red_num=INT(red_num)
	red_numT=ALLTRIM(STR(red_num,20))
	red_numL=LEN(red_numT)-3
	IF red_numL<1
		RR=red_num
	ELSE
		RR=10^red_numL
		red_numR=RIGHT(red_numT,red_numL)
		IF red_numR#REPLICATE("0",red_numL)
			red_numT=LEFT(red_numT,3)+REPLICATE("0",red_numL)
			RR=VAL(red_numT)+RR
		ELSE
			RR=red_num
		ENDIF
	ENDIF
RETURN RR

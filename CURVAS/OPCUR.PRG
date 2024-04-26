**********************************
*-- Programa: OPcur.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO CURVAS
*********************************
IF USED("CUR")
	SELE CUR
ELSE
	=MEN_LIN(ABA+"Curvas de Producci¢n")
	SELE 2
	=GETDBF('CURVAS','CURVA','CUR')
ENDIF
RETURN ;
IIF(curpop,DEFPOGRL(curpopr,curpopc,'curpop','cur.curva',20,'Elija la Curva'),RELEPOP("CURPOP")) ;
.AND. men_lin(botom)

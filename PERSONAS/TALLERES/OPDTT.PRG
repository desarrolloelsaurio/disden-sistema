****************************************
*-- Programa: OPDTT.PRG
*-- Fecha   : 06/07/91 10:58am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE DATOS DE PRODUCCION
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

PARAMETER O_REOP,O_EXCL
=IIF(O_REOP,REOPXXX("DTT"),.T.)
=IIF(O_REOP,CLOSDBF("DTT"),.T.)
IF USED("DTT")
	SELE DTT
	RETURN MEN_LIN(BOTOM)
ENDIF
RETURN MEN_LIN(ABA+'Datos de Producci¢n') .AND. ;
GETDBF('DATOSTAL',.F.,"DTT",PRXAREA(.T.),O_EXCL) .AND. ;
MEN_LIN(BOTOM)

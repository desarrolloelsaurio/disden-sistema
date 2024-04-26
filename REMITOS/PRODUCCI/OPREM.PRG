***********************************
*-- Programa: OPREM.PRG
*-- Fecha   : 07/04/91 10:57am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO REMITOS
**********************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
=CLOSDBF("REX")
=MEN_LIN(ABA+"Remitos")
=GETDBF("REMITDAF","REMITO","REX",11)
IF !USED("REM")
	=GETDBF('REMITOF',"REMITO","REM",10)
ENDIF
SELE REM
RETURN MEN_LIN(BOTOM)

**************************************************************
*-- Programa: MER.PRG
*-- Fecha   : 06/05/91 03:21pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE PROCESOS DE FABRICACION
**************************************************************
PARAMETER ME_DECIAS
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
ulpr=PROGRAM()
=CABPAN1()
ME_DIJO=IIF(EMPTY(ME_DECIAS),ALLTRIM(PROMPT()),ME_DECIAS)
SELE MER
DO CASE
#IF "PROD" $ CURD()
CASE ME_DIJO="Caracter¡sticas"
	DO IMER_CAG.SPR
CASE ME_DIJO="Legajo"
	DO MER_LEG.SPR WITH .T.
CASE ME_DIJO="Datos Generales"
	DO IMER.SPR WITH  " Ingreso de Art¡culos "
CASE ME_DIJO="Repite"
	RESPUESTA='RMER#10#25#Tipo de Repetici¢n#3#\<Todo el Producto#\<Descripci¢n'
	=DEFPOP()
	ON SELE POPU RMER DO RMER
	ACTI POPU RMER
	RELE POPU RMER
	ULPR=HORA_ULP(PROGRAM())
CASE ME_DIJO="Restaura el Archivo"
	=OPMER() .AND. XMER()
#ENDIF	
ENDCASE
ULPR=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)

***************************************************************
*-- Programa: Rmer.prg
*-- Fecha   : 06/05/91 03:21pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE repeticion de mercaderias
***************************************************************
PROCEDURE RMER
ULPR=HORA_ULP()
M_DIJO=ALLT(PROM())
DO CASE
CASE M_DIJO="Todo el Producto"
   DO IMER_DO.SPR WITH .F.," Repite Art¡culo Completo ",4
CASE M_DIJO="Descripci¢n"
   DO IMER_DO.SPR WITH .F.," Repite Descripci¢n Art¡culo ",5
ENDCASE
RETURN men_lin(BOTOM)

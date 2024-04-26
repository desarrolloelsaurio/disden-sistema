************************************************
*-- Programa: COR.PRG
*-- Fecha   : 06/26/91 10:19AM
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE CORTES
************************************************
ULPR=PROGRAM()
=CABPAN1()
=OPRPV()
=OPTELS()
=OPAVIS()
=OPDES()
SELE COR
DO CASE
CASE BAR()=1
	DO ICOR.SPR with "Ingreso de Cabeceras de Ordenes de Corte"
CASE BAR()=3
    DO ICOR_DO.SPR WITH  " PARA ANULAR",2
CASE BAR()=5
	RESPUESTA='LCOR#6#60#Listado de Ordenes de '+korte+' (Cabecera)#3;
#\<Listados Comunes;
#Ordene\<s de corte de la semana;
#C\<ortes por Color;
#\<Resultado'
	=DEFPOP()
	ON SELE POPU LCOR DO MLCOR
	ACTI POPU LCOR
	RELE POPU LCOR
CASE BAR()=6
	RESPUESTA='LEGCOR#6#60#Legajo de Ordenes de '+korte+' (Cabecera)#3;
#\<Ingresa;
#\<Consulta;
#\<Listado de un Legajo;
#\<Ordenes de Corte con Legajo'
	=DEFPOP()
	ON SELE POPU LEGCOR DO LEGCOR
	ACTI POPU LEGCOR
	RELE POPU LEGCOR
CASE BAR()=8
	=XCOR()
ENDCASE
ULPR=HORA_ULP(PROGRAM())
UNLO ALL
RETURN MEN_LIN(BOTOM)

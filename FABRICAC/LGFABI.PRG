*********************************************************
*-- Programa: LGFABI.PRG
*-- Fecha   : 07/02/91 05:51pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE ORDENES DE FABRICACION
*********************************************************
PARAMETER PORP
store HORA_ULP(program()) to ulpr
IF cheqseg()
	#DEFINE CRLF CHR(13)+CHR(10)                   && CRLF
	LG_DIJO=alltrim(prompt())
	=OPTALS()
	DO CASE
	CASE LG_DIJO="Finales Previstos"
		=FABFINPR(PORP)
	CASE LG_DIJO="Informe de Segunda"
		=LSEGUNDA(PORP)
    CASE LG_DIJO="Balance de Talleres"
RESPUESTA='LGFABI#12#40#A/B/M/L Varios#3;
#\<Balance Com£n;
#B\<alance Valorizado;
#Ba\<lance Anual;
#\<Carga de Talleres'
		=defpop()
		ON SELE POPU LGFABI DO BATAL
		ACTI POPU LGFABI
		RELE POPU LGFABI
		ULPR=HORA_ULP(PROGRAM())
	CASE LG_DIJO='Listado de Remitos'
RESPUESTA='LGFABI#12#40#A/B/M/L Varios#3;
#\<Listados Comunes;
#\<Seguimiento de Remitos;
#\<Telas no Cortadas en Talleres'
		=defpop()
		ON SELE POPU LGFABI DO LREM
		ACTI POPU LGFABI
		RELE POPU LGFABI
	CASE LG_DIJO='Estado de una Orden'
         DO ICOR_DO.SPR WITH  " PARA IMPRIMIR ESTADO ",IIF(PORP,7,8)
	CASE LG_DIJO='Estado de varias ¢rdenes'
		RESPUESTA='LGFABI#12#40#Estado de varias Ordenes#3;
#por \<N£mero;
#por \<Art¡culo entre Fechas;
#por \<Rubro entre Fechas;
#Entre \<Fechas'
		=DEFPOP()
		ON SELE POPU LGFABI DO LESTCOR
		ACTI POPU LGFABI
		RELE POPU LGFABI
	CASE LG_DIJO='Materiales Enviados'
		=LREMM(PORP)
	CASE LG_DIJO='O. Corte Pendientes'
		RESPUESTA='LGFABI#12#40#Listado de Ordenes de Corte Pendientes#3;
		#\<Listados Comunes;
#por \<Rubro;
#por \<Proceso;
#por \<Taller;
#por \<Art¡culo;
#-;
#de m s de \<X d¡as;
#de m x de X dias por \<Rubro'
		=DEFPOP()
		ON SELE POPU LGFABI DO FABNT WITH PORP
		ACTI POPU LGFABI
		RELE POPU LGFABI
	CASE LG_DIJO='Procesos Terminados'
       RESPUESTA='LGFABI#12#40#Listado de Procesos Terminados#3;
#\<Listados Comunes;
#Resumen \<Completo;
#\<Resumen por Rubro;
#Resumen \<Especial'
		=DEFPOP()
		ON SELE POPU LGFABI DO LFABPTT WITH PORP
		ACTI POPU LGFABI
		RELE POPU LGFABI
	CASE LG_DIJO='Rendimiento'
		=OPPRC() .AND. LPMIO(PORP)
	CASE LG_DIJO='Consistencia'
       RESPUESTA='LCONSS#12#40#Listados de Consistencia#3;
#\<Cortes Irregulares;
#\<Listado General'
		=DEFPOP()
		ON SELE POPU LCONSS DO LCONSS WITH PORP
		ACTI POPU LCONSS
		RELE POPU LCONSS
	ENDCASE
ELSE
	=IAUDI()
ENDIF
ulpr=PROGRAM()
RETURN MEN_LIN(BOTOM)

PROCEDURE LCONSS
PARAMETER PORP
ULPR=HORA_ULP(PROGRAM())
LC_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LC_DIJO='Cortes Irregulares'
	  =LIRREG()
CASE LC_DIJO='Listado General'
    =LCONS()
ENDCASE
RETURN MEN_LIN(BOTOM)


PROCEDURE BATAL
ULPR=HORA_ULP(PROGRAM())
LB_DIJO=ALLTRIM(PROMPT())
DO CASE
	CASE LB_DIJO=="Balance Valorizado"
		=OPPRC()
		M.MESANIO=MESANIO("Mes y A¤o del Balance VALORIZADO",.T.,.T.)
		IF !EMPTY(M.MESANIO) .AND. CONFIRMA('Listado',.T.,15,15)
			STOR VAL(LEFT(M.MESANIO,2)) TO M.XMES
			STOR VAL(RIGHT(M.MESANIO,4)) TO M.XANIO
			=RELEWIN("WIN")
			=LBALTALX()
		ELSE
			=NOSELEC("MES")
		ENDIF
		=RELEWIN("WIN")
	CASE LB_DIJO=="Balance Com£n"
		M.MESANIO=MESANIO("Mes y A¤o del Balance",.T.,.T.)
		IF !EMPTY(M.MESANIO) .AND. CONFIRMA('Listado',.T.,15,15)
			STOR VAL(LEFT(M.MESANIO,2)) TO M.XMES
			STOR VAL(RIGHT(M.MESANIO,4)) TO M.XANIO
			=RELEWIN("WIN")
			=LBALTAL()
		ELSE
			=NOSELEC("MES")
		ENDIF
		=RELEWIN("WIN")
CASE LB_DIJO=="Balance Anual"
CASE LB_DIJO="Carga de Talleres"
	=CARGTAL()
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)

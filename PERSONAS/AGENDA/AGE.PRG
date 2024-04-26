************************************************
*-- Programa: AGE.PRG
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE AGENDA
*-- Modificaci¢n GOYO 09-10-92 06:33pm
************************************************
ME1_DIJO=ALLTRIM(PROMPT())
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
EXTERNAL PROCEDURE ELIAGE.PRG
RELE AGE_TIPO
DO CASE
CASE ME1_DIJO='Legajo'
	AGE_TIPO="J"
CASE ME1_DIJO='Datos Generales' .OR. ;
		ME1_DIJO='Datos Administrativos'
	AGE_TIPO=.F.
CASE ME1_DIJO='B£squeda'
	AGE_TIPO="E"
ENDCASE
IF TYPE("AGE_TIPO")#"U"
	=OPCIU()
	DO OPAGE
	ulpr=PROGRAM()
	=cabpan1()
	sele PER
	EXTERNAL ARRAY CONTENIDO,TEXTO
	DIME TEXTO[10],CONTENIDO[9]
	TEXTO[1]='Agenda'
	TEXTO[2]='Agenda'
	TEXTO[3]='Agendados'
	*[4] VA DESPUES
	TEXTO[5]='Fecha de Nacimiento'
	TEXTO[6]='Domicilio Postal'
	TEXTO[7]='Legajo'
	TEXTO[10]='Apellido y Nombre'
	TIPO_PER="AGENDA"

	CONTENIDO[1]='@!'
	CONTENIDO[2]=9
	CONTENIDO[3]='AGECOD'
	CONTENIDO[4]='AGENDA'
	CONTENIDO[5]='A'
	CONTENIDO[6]=.F.
	CONTENIDO[7]=.F.
	CONTENIDO[8]=.F.
	CONTENIDO[9]=.F.

	TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
	DO CASE
	CASE EMPTY(AGE_TIPO)
		DO PERSISD.SPR WITH .T.
	CASE AGE_TIPO="J"
		DO IPER_LEG.SPR
	OTHERWISE
		DO IPER_AGE.SPR
	ENDCASE
	ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

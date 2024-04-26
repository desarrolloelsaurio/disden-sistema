* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : MED.PRG              บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 10-29-93                บ
* บ HORA       : 01:21:55am              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
ME1_DIJO=ALLTRIM(PROMPT())
RELE MED_TIPO
DO CASE
CASE ME1_DIJO='Listados'
    MED_TIPO="L"
CASE ME1_DIJO='Legajo'
	MED_TIPO="J"
CASE ME1_DIJO='Datos Generales'
	MED_TIPO=.F.
CASE ME1_DIJO='Datos Especกficos'
	MED_TIPO="E"
CASE ME1_DIJO='Liquidaciขn'
	MED_TIPO="L"
ENDCASE
IF TYPE("MED_TIPO")#"U"
	=OPCIU()
	DO OPMED
	ulpr=PROGRAM()
	=cabpan1()
	sele PER
	EXTERNAL ARRAY CONTENIDO
	EXTERNAL ARRAY TEXTO
	DIME TEXTO[10],CONTENIDO[9]
	TEXTO[1]='Mdico'
	TEXTO[2]='Mdico'
	TEXTO[3]='Mdicos'
	*[4] VA DESPUES
	TEXTO[5]='Fecha de Nacimiento'
	TEXTO[6]='Domicilio Postal'
	TEXTO[7]='Legajo'
	TEXTO[10]='Apellido y Nombre'
	TIPO_PER="MEDICO"

	CONTENIDO[1]='@!'
	CONTENIDO[2]=9
	CONTENIDO[3]='MEDCOD'
	CONTENIDO[4]='MEDICO'
	CONTENIDO[5]='M'
	CONTENIDO[6]=.F.
	CONTENIDO[7]=.F.
	CONTENIDO[8]=.F.
	CONTENIDO[9]='MEDDNI'

	TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
	IF EMPTY(MED_TIPO)
		DO IPER.SPR WITH .T.
	ELSE
		IF MED_TIPO="J"
			DO IPER_LEG.SPR
		ELSE
		   IF MED_TIPO="L"
	respuesta='LIQMED#15#40#Submenฃ de Liquidaciขn de Mdicos#3;
#\<Mdicos no Listados;
#\<Listado S bana;
#\<Modifica Liquidaciขn;
#\<Emisiขn de Resฃmenes;
#\<Confirma Pago'
	=defpop()
	ON SELE POPU liqmed DO liqmed
	ACTI POPU liqmed
	RELE POPU liqmed
		   ELSE
			DO IPER_MED.SPR
			ENDIF
		ENDIF
	ENDIF
	ulpr=PROGRAM()
ENDIF
UNLO ALL
RETURN men_lin(botom)

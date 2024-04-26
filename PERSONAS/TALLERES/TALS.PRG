* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : TALS.PRG                บ
* บ COMENTARIO    : GESTION DE TALLERES     บ
* ฬอออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                บ
* บ FECHA      : 25-06-95                   บ
* บ HORA       : 03:05:36am                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER    บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM
PARAMETER ME_DIJO
EXTERNAL PROCEDURE ELITALS
GA1_DIJO=IIF(EMPTY(ME_DIJO),ALLTRIM(PROMPT()),ME_DIJO)
=OPCIU()
=OPIVA()
=OPDNI()
=OPTALS()
RELE TALS_TIPO
DO CASE
CASE GA1_DIJO="Rubro-Taller"
TALS_TIPO="RUT"
CASE GA1_DIJO="Datos de Producciขn"
TALS_TIPO="IDA"
CASE GA1_DIJO="Legajo"
	TALS_TIPO="J"
CASE GA1_DIJO="Datos Administrativos"
	TALS_TIPO=.F.
ENDCASE
IF TYPE("TALS_TIPO")#"U"
	=OPCIU()
	=OPTALS()
	ULPR=PROGRAM()
	=CABPAN1()
	SELE PER
	EXTERNAL ARRAY CONTENIDO
	EXTERNAL ARRAY TEXTO
	DIME TEXTO[10],CONTENIDO[9]
	TEXTO[1]="Taller"
	TEXTO[2]="Taller"
	TEXTO[3]="Talleres"
	*[4] VA DESPUES
	TEXTO[5]="Fecha de Nacimiento"
	TEXTO[6]="Detalle"
	TEXTO[7]="Legajo"
	TEXTO[10]="Apellido y Nombre"
	TIPO_PER="TALLER"

	CONTENIDO[1]="@!"
	CONTENIDO[2]=9
	CONTENIDO[3]="TALCOD"
	CONTENIDO[4]="TALLERES"
	CONTENIDO[5]="R"
	CONTENIDO[6]=.T.
	CONTENIDO[7]=.F.
	CONTENIDO[8]=.T.
	CONTENIDO[9]=.F.

	TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
	DO CASE
	CASE EMPTY(TALS_TIPO)
		DO IPER.SPR WITH .T.
	CASE TALS_TIPO="J"
		DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Taller ",.T.
	CASE TALS_TIPO="IDA"		
		=OPRUB()
		=OPDTT()
		DO IDATOTAL.SPR WITH .F., .F., "PER", "Datos de Producciขn"
	CASE TALS_TIPO="RUT"		
      DO IPER_dO.SPR WITH .F.,.F.,"PRS","Listado de Presupuestos - Taller/Rubro ",.F.,13
	ENDCASE
	ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

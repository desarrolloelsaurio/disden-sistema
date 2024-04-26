* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : GAR.PRG              บ
* บ COMENTARIO    : GESTION DE GARANTIAS บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 11-06-93                บ
* บ HORA       : 03:05:36am              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                && BOTOM
GA1_DIJO=ALLTRIM(PROMPT())
RELE GAR_TIPO
DO CASE
CASE GA1_DIJO="Legajo"
	GAR_TIPO="J"
CASE GA1_DIJO="Datos Generales"
	GAR_TIPO=.F.
CASE GA1_DIJO="Datos del Inmueble"
	GAR_TIPO="E"
ENDCASE
IF TYPE("GAR_TIPO")#"U"
	=OPCIU()
	DO OPGAR
	ULPR=PROGRAM()
	=CABPAN1()
	SELE PER
	EXTERNAL ARRAY CONTENIDO
	EXTERNAL ARRAY TEXTO
	DIME TEXTO[10],CONTENIDO[9]
	TEXTO[1]="Garantกa"
	TEXTO[2]="Garantกa"
	TEXTO[3]="Garantกas"
	*[4] VA DESPUES
	TEXTO[5]="Fecha de Nacimiento"
	TEXTO[6]="Propiedad"
	TEXTO[7]="Legajo"
	TEXTO[10]="Apellido y Nombre"
	TIPO_PER="GARANTIA"

	CONTENIDO[1]="@!"
	CONTENIDO[2]=9
	CONTENIDO[3]="GARCOD"
	CONTENIDO[4]="GARANTIA"
	CONTENIDO[5]="G"
	CONTENIDO[6]=.T.
	CONTENIDO[7]=.T.
	CONTENIDO[8]=.T.
	CONTENIDO[9]="GARDNI"

	TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
	DO CASE
	CASE EMPTY(GAR_TIPO)
		DO IPER.SPR WITH .T.
	CASE GAR_TIPO="J"
		DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Garante ",.T.
	OTHERWISE
		DO IPER_GAR.SPR WITH .F.,.F.,"PER"," Datos del Inmueble ",.T.
    ENDCASE
	ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

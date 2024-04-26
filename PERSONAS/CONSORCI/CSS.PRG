* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CSS.PRG               บ
* บ COMENTARIO    : GESTION DE CONSORCSTA บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 11-06-93                 บ
* บ HORA       : 03:05:36am               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM
EXTERNAL PROCEDURE ELICSS
GA1_DIJO=ALLTRIM(PROMPT())
RELE CSS_TIPO
DO CASE
CASE GA1_DIJO="Legajo"
	CSS_TIPO="J"
CASE GA1_DIJO="Datos Administrativos"
	CSS_TIPO=.F.
ENDCASE
IF TYPE("CSS_TIPO")#"U"
	=OPCIU()
	DO OPCSS
	ULPR=PROGRAM()
	=CABPAN1()
	SELE PER
	EXTERNAL ARRAY CONTENIDO
	EXTERNAL ARRAY TEXTO
	DIME TEXTO[10],CONTENIDO[9]
	TEXTO[1]="Consorcista"
	TEXTO[2]="Consorcista"
	TEXTO[3]="Consorcistas"
	*[4] VA DESPUES
	TEXTO[5]="Fecha de Nacimiento"
	TEXTO[6]="Detalle"
	TEXTO[7]="Legajo"
	TEXTO[10]="Apellido y Nombre"
	TIPO_PER="CONSORCISTA"

	CONTENIDO[1]="@!"
	CONTENIDO[2]=9
	CONTENIDO[3]="CSSCOD"
	CONTENIDO[4]="CONSORCI"
	CONTENIDO[5]="O"
	CONTENIDO[6]=.T.
	CONTENIDO[7]=.T.
	CONTENIDO[8]=.T.
	CONTENIDO[9]="CSSDNI"

	TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
	DO CASE
	CASE EMPTY(CSS_TIPO)
		DO IPER.SPR WITH .T.
	OTHERWISE
		DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Consorcista ",.T.
	ENDCASE
	ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

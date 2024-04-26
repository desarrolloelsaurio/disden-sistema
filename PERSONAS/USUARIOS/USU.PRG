* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : USU.PRG               บ
* บ COMENTARIO    : GESTION DE USUARIOS   บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 11-06-93                 บ
* บ HORA       : 03:05:36am               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM
EXTERNAL PROCEDURE ELIUSU
GA1_DIJO=ALLTRIM(PROMPT())
RELE USU_TIPO
*DO CASE
*CASE GA1_DIJO="Legajo"*
*	USU_TIPO="J"
*CASE GA1_DIJO="Datos Generales"
	USU_TIPO=.F.
*ENDCASE
IF TYPE("USU_TIPO")#"U"
	=OPCIU()
	DO OPUSU
	ULPR=PROGRAM()
	=CABPAN1()
	SELE PER
	EXTERNAL ARRAY CONTENIDO
	EXTERNAL ARRAY TEXTO
	DIME TEXTO[10],CONTENIDO[9]
	TEXTO[1]="Usuario"
	TEXTO[2]="Usuario"
	TEXTO[3]="Usuarios"
	*[4] VA DESPUES
	TEXTO[5]="Fecha de Nacimiento"
	TEXTO[6]="Detalle"
	TEXTO[7]="Legajo"
	TEXTO[10]="Apellido y Nombre"
	TIPO_PER="Usuario"

	CONTENIDO[1]="@!"
	CONTENIDO[2]=9
	CONTENIDO[3]="USUCOD"
	CONTENIDO[4]="USUARIO"
	CONTENIDO[5]="U"
	CONTENIDO[6]=.F.
	CONTENIDO[7]=.F.
	CONTENIDO[8]=.F.
	CONTENIDO[9]=.F.

	TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
	IF EMPTY(USU_TIPO)
		DO IPER_RED.SPR WITH .T.
	ELSE
		DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Usuario ",.T.
	ENDIF
	ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

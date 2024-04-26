* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPE.PRG                 บ
* บ COMENTARIO    : GESTION DE Operadores   บ
* ฬอออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                บ
* บ FECHA      : 11-06-93                   บ
* บ HORA       : 03:05:36am                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER    บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM
GA1_DIJO=ALLTRIM(PROMPT())
EXTERNAL PROCEDURE ELIOPE.PRG
RELE OPE_TIPO
DO CASE
CASE GA1_DIJO="Legajo"
	OPE_TIPO="J"
CASE GA1_DIJO="Datos Administrativos"
	OPE_TIPO=.F.
OTHERWISE
    OPE_TIPO="F"
ENDCASE
IF TYPE("OPE_TIPO")#"U"
	=OPCIU()
	DO OPOPE
	ULPR=PROGRAM()
	=CABPAN1()
	SELE PER
	EXTERNAL ARRAY CONTENIDO
	EXTERNAL ARRAY TEXTO
	DIME TEXTO[10],CONTENIDO[9]
	TEXTO[1]="Operador"
	TEXTO[2]="Operador"
	TEXTO[3]="Operadores"
	*[4] VA DESPUES
	TEXTO[5]="Fecha de Nacimiento"
	TEXTO[6]="Detalle"
	TEXTO[7]="Legajo"
	TEXTO[10]="Apellido y Nombre"
	TIPO_PER="OPERADOR"

	CONTENIDO[1]="@!"
	CONTENIDO[2]=9
	CONTENIDO[3]="OPECOD"
	CONTENIDO[4]="OPERADOR"
	CONTENIDO[5]="O"
	CONTENIDO[6]=.T.
	CONTENIDO[7]=.T.
	CONTENIDO[8]=.F.
	CONTENIDO[9]="OPEDNI"

	TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
	IF EMPTY(OPE_TIPO)
		DO PERSIVA.SPR WITH .T.
	ELSE
	   IF OPE_TIPO="J"
		  DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Operador ",.T.
	   ENDIF
	ENDIF
	ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

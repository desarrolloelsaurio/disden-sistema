* ษอออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : BUQ.PRG                     บ
* บ COMENTARIO    : GESTION DE Mdicos BUQUESs  บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                    บ
* บ FECHA      : 11-06-93                       บ
* บ HORA       : 03:05:36am                     บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER        บ
* ศอออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM

EXTERNAL PROCEDURE ELIBUQ
GA1_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE GA1_DIJO="Buques"
	STORE .F. TO M.BUQ_TIPO
CASE GA1_DIJO="Legajo"
	STORE "J" TO M.BUQ_TIPO
ENDCASE
IF TYPE("M.BUQ_TIPO")#"U"
	=OPCIU()
	DO OPBUQ
	ULPR=PROGRAM()
	=CABPAN1()
	SELE PER
	EXTERNAL ARRAY CONTENIDO
	EXTERNAL ARRAY TEXTO
	DIME TEXTO[10],CONTENIDO[9]
	TEXTO[1]="Buque"
	TEXTO[2]="Buque"
	TEXTO[3]="Buques"
	*[4] VA DESPUES
	TEXTO[5]="Fecha de Nacimiento"
	TEXTO[6]="Bandera"
	TEXTO[7]="Legajo"
	TEXTO[10]="Nombre"
	TIPO_PER="Buque"

	CONTENIDO[1]="@!"
	CONTENIDO[2]=9
	CONTENIDO[3]="BUQCOD"
	CONTENIDO[4]="BUQUE"
	CONTENIDO[5]="B"
	CONTENIDO[6]=.F.
	CONTENIDO[7]=.F.
	CONTENIDO[8]=.F.
	CONTENIDO[9]=.F.
	TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'

	DO CASE
	CASE EMPTY(BUQ_TIPO)
		DO IPER_RED.SPR WITH .T.
	CASE M.BUQ_TIPO="J"
		DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Buque ",.T.
	ENDCASE
	ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

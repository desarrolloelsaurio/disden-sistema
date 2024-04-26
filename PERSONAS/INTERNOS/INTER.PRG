* ษอออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INTER.PRG                   บ
* บ COMENTARIO    : GESTION DE Mdicos Internos บ
* ฬอออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                    บ
* บ FECHA      : 11-06-93                       บ
* บ HORA       : 03:05:36am                     บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER        บ
* ศอออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM

EXTERNAL PROCEDURE ELIINTER
GA1_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE GA1_DIJO="Mdicos Internos"
	STORE .F. TO M.INTER_TIPO
	=OPCIU()
	DO OPINTER
	ULPR=PROGRAM()
	=CABPAN1()
	SELE PER
	EXTERNAL ARRAY CONTENIDO
	EXTERNAL ARRAY TEXTO
	DIME TEXTO[10],CONTENIDO[9]
	TEXTO[1]="Mdico Interno"
	TEXTO[2]="Mdico Interno"
	TEXTO[3]="Mdicos Internos"
	*[4] VA DESPUES
	TEXTO[5]="Fecha de Nacimiento"
	TEXTO[6]="Categorizaciขn"
	TEXTO[7]="Legajo"
	TEXTO[10]="Apellido y Nombre"
	TIPO_PER="Mdico Interno"

	CONTENIDO[1]="@!"
	CONTENIDO[2]=9
	CONTENIDO[3]="INTERCOD"
	CONTENIDO[4]="INTERNO"
	CONTENIDO[5]="I"
	CONTENIDO[6]=.F.
	CONTENIDO[7]=.F.
	CONTENIDO[8]=.F.
	CONTENIDO[9]=.F.
	TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
CASE GA1_DIJO="Listados por Pantalla"
	STORE "P" TO M.INTER_TIPO
CASE GA1_DIJO="Listados por Impresora"
	STORE "I" TO M.INTER_TIPO
ENDCASE

IF EMPTY(INTER_TIPO)
	DO IPER_RED.SPR WITH .T.
	*ELSE
	*DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Mdico Interno ",.T.
	*ENDIF
ELSE
respuesta='Lmed#10#35#Listado de Mdicos Internos#3;
#\<Pr cticas del Mdico;
#\<Liquidaciขn'
=defpop()
	ON SELE POPU lMED DO lint WITH M.INTER_TIPO="P"
	ACTI POPU lMED
	RELE POPU lMED
ENDIF
ULPR=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)

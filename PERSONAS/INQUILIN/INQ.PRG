* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INQ.PRG               บ
* บ COMENTARIO    : GESTION DE INQUILINOS บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 11-06-93                 บ
* บ HORA       : 03:05:36am               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM
EXTERNAL PROCEDURE ELIINQ
GA1_DIJO=ALLTRIM(PROMPT())
RELE INQ_TIPO
DO CASE
CASE GA1_DIJO="Legajo"
	INQ_TIPO="J"
CASE GA1_DIJO="Datos Generales"
	INQ_TIPO=.F.
CASE GA1_DIJO="Pasa a Histขrico"
	INQ_TIPO="PHI"
CASE GA1_DIJO="Un Inquilino"
	INQ_TIPO="CCL"
CASE GA1_DIJo="Histขrico"
    INQ_TIPO="HCCL"
CASE GA1_DIJO="Reimputa"
	INQ_TIPO="REI"
ENDCASE
IF TYPE("INQ_TIPO")#"U"
	=OPCIU()
	DO OPINQ
	ULPR=PROGRAM()
	=CABPAN1()
	SELE PER
	EXTERNAL ARRAY CONTENIDO
	EXTERNAL ARRAY TEXTO
	DIME TEXTO[10],CONTENIDO[9]
	TEXTO[1]="Inquilino"
	TEXTO[2]="Inquilino"
	TEXTO[3]="Inquilinos"
	*[4] VA DESPUES
	TEXTO[5]="Fecha de Nacimiento"
	TEXTO[6]="Detalle"
	TEXTO[7]="Legajo"
	TEXTO[10]="Apellido y Nombre"
	TIPO_PER="INQUILINO"

	CONTENIDO[1]="@!"
	CONTENIDO[2]=9
	CONTENIDO[3]="INQCOD"
	CONTENIDO[4]="INQUILIN"
	CONTENIDO[5]="I"
	CONTENIDO[6]=.T.
	CONTENIDO[7]=.T.
	CONTENIDO[8]=.T.
	CONTENIDO[9]="INQDNI"

	TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
	DO CASE
	CASE EMPTY(INQ_TIPO)
		DO IPER.SPR WITH .T.
    CASE INQ_TIPO="PHI"
      DO IPER_dO.SPR WITH .F.,.F.,"PER"," Pasa a Histขrico ",.F.,3
    CASE INQ_TIPO="CCL"
      DO IPER_dO.SPR WITH .F.,.F.,"PER"," Cuenta Corriente Inquilino ",.F.,iif(por_pan,4,5)
    CASE INQ_TIPO="REI"
   	  DO IPER_DO.SPR WITH .F.,.F.,"PER"," Reimputa Cta Cte Inquilino ",.f.,6
    CASE INQ_TIPO="HCCL"
      DO IPER_dO.SPR WITH .F.,.F.,"PER"," Cta Cta Histขrica Inquilino ",.F.,iif(por_pan,7,8)
	OTHERWISE
      DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Inquilino ",.T.
	ENDCASE
	ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

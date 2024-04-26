* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : TPT.PRG              บ
* บ COMENTARIO    : GESTION DE TRENSPORT บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 01-07-98                บ
* บ HORA       : 00:44:44am              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
ME1_DIJO=ALLTRIM(PROMPT())
RELE TPT_TIPO
DO CASE
CASE ME1_DIJO='Legajo'
   TPT_TIPO="J"
CASE ME1_DIJO='Datos Administrativos'
   TPT_TIPO=.F.
ENDCASE
IF TYPE("TPT_TIPO")#"U"
=OPCIU()
DO OPTPT
ulpr=PROGRAM()
=cabpan1()
sele PER
EXTERNAL ARRAY CONTENIDO,TEXTO
DIME TEXTO[10],CONTENIDO[9]
TEXTO[1]='Transporte'
TEXTO[2]='Transporte'
TEXTO[3]='Transportes'
*[4] VA DESPUES
TEXTO[5]='Fecha de Nacimiento'
TEXTO[6]='Domicilio Postal'
TEXTO[7]='Legajo'
TEXTO[10]='Apellido y Nombre'
TIPO_PER="TPTTEX"

CONTENIDO[1]='@!'
CONTENIDO[2]=9
CONTENIDO[3]='TPTCOD'
CONTENIDO[4]='TPTTEX'
CONTENIDO[5]='Q'
CONTENIDO[6]=.F.
CONTENIDO[7]=.F.
CONTENIDO[8]=.F.

TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
DO CASE
CASE EMPTY(TPT_TIPO)
   DO IPER.SPR WITH .T.
CASE TPT_TIPO="J"
      DO IPER_LEG.SPR
ENDCASE
ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

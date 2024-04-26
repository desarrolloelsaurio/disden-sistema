* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : SER.PRG              บ
* บ COMENTARIO    : GESTION DE SERVICES  บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 10-25-93                บ
* บ HORA       : 00:44:44am              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
ME1_DIJO=ALLTRIM(PROMPT())
RELE SER_TIPO
DO CASE
CASE ME1_DIJO='Legajo'
   SER_TIPO="J"
CASE ME1_DIJO='Datos Administrativos'
   SER_TIPO=.F.
CASE ME1_DIJO='Marcas'
	=OPMAR()
   SER_TIPO="E"
ENDCASE
IF TYPE("SER_TIPO")#"U"
=OPCIU()
=OPMAR()
DO OPSER
ulpr=PROGRAM()
=cabpan1()
sele PER
EXTERNAL ARRAY CONTENIDO,TEXTO
DIME TEXTO[10],CONTENIDO[9]
TEXTO[1]='Srvice'
TEXTO[2]='Srvice'
TEXTO[3]='Srvices'
*[4] VA DESPUES
TEXTO[5]='Fecha de Nacimiento'
TEXTO[6]='Domicilio Postal'
TEXTO[7]='Legajo'
TEXTO[10]='Apellido y Nombre'
TIPO_PER="SERVICE"

CONTENIDO[1]='@!'
CONTENIDO[2]=9
CONTENIDO[3]='SERCOD'
CONTENIDO[4]='SERVICE'
CONTENIDO[5]='S'
CONTENIDO[6]=.F.
CONTENIDO[7]=.F.
CONTENIDO[8]=.F.

TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
DO CASE
CASE EMPTY(SER_TIPO)
   DO IPER.SPR WITH .T.
CASE SER_TIPO="J"
      DO IPER_LEG.SPR
OTHERWISE
      DO IPER_MAR.SPR
ENDCASE
ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

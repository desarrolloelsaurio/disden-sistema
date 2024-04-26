************************************************
*-- Programa: SAN.PRG
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE SANATORIOS
*-- Modificaci¢n GOYO 09-10-92 06:33pm
************************************************
ME1_DIJO=ALLTRIM(PROMPT())
RELE MED_TIPO
DO CASE
CASE ME1_DIJO='Legajo'
   MED_TIPO="J"
CASE ME1_DIJO='Datos Generales'
   MED_TIPO=.F.
CASE ME1_DIJO='Datos Espec¡ficos'
   MED_TIPO="E"
ENDCASE
IF TYPE("MED_TIPO")#"U"
=OPCIU()
DO OPSAN
ulpr=PROGRAM()
=cabpan1()
sele PER
EXTERNAL ARRAY CONTENIDO,TEXTO
DIME TEXTO[10],CONTENIDO[10]
TEXTO[1]='Sanatorio'
TEXTO[2]='Sanatorio'
TEXTO[3]='Sanatorios'

TEXTO[5]='Fecha 1¦ Operaci¢n'
TEXTO[6]='Detalle'
TEXTO[7]='Legajo'
TEXTO[10]='Raz¢n Social'
TIPO_PER="SANATORIO"

CONTENIDO[1]='@!'
CONTENIDO[2]=9
CONTENIDO[3]='SANCOD'
CONTENIDO[4]='SANATORI'
CONTENIDO[5]='Z'
CONTENIDO[6]=.F.
CONTENIDO[7]=.F.
CONTENIDO[8]=.F.

TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'

IF EMPTY(MED_TIPO)
   DO IPERSDNI.SPR WITH .T.
ELSE
   IF MED_TIPO="J"
      DO PERDNLEG.SPR
   ELSE
      DO IPER_MED.SPR
   ENDIF
ENDIF
ulpr=PROGRAM()
ENDIF
=men_lin(botom)
UNLO ALL
RETURN

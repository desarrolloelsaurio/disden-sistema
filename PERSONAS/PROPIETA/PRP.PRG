* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : PRP.PRG                 บ
* บ COMENTARIO    : GESTION DE PROPIETARIOS บ
* ฬอออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                บ
* บ FECHA      : 11-06-93                   บ
* บ HORA       : 03:05:36am                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER    บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM
GA1_DIJO=ALLTRIM(PROMPT())
RELE PRP_TIPO
DO CASE
CASE GA1_DIJO="Legajo"
   PRP_TIPO="J"
CASE GA1_DIJO="Datos Generales"
   PRP_TIPO=.F.
OTHERWISE
   PRP_TIPO="F"
ENDCASE
IF TYPE("PRP_TIPO")#"U"
	=OPCIU()
   DO OPPRP
   ULPR=PROGRAM()
   =CABPAN1()
   SELE PER
   EXTERNAL ARRAY CONTENIDO
   EXTERNAL ARRAY TEXTO
   DIME TEXTO[10],CONTENIDO[9]
   TEXTO[1]="Propietario"
   TEXTO[2]="Propietario"
   TEXTO[3]="Propietarios"
   *[4] VA DESPUES
   TEXTO[5]="Fecha de Nacimiento"
   TEXTO[6]="Detalle"
   TEXTO[7]="Legajo"
   TEXTO[10]="Apellido y Nombre"
   TIPO_PER="PROPIETARIO"

   CONTENIDO[1]="@!"
   CONTENIDO[2]=9
   CONTENIDO[3]="PRPCOD"
   CONTENIDO[4]="PROPIETA"
   CONTENIDO[5]="P"
   CONTENIDO[6]=.T.
   CONTENIDO[7]=.T.
   CONTENIDO[8]=.T.
   CONTENIDO[9]="PRPDNI"
   TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
   IF EMPTY(PRP_TIPO)
      DO IPER.SPR WITH .T.
   ELSE
      IF PRP_TIPO="J"
         DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Propietario ",.T.
      ELSE
         IF PRP_TIPO="F"
            DO OPPRP
            DO OPCCP
            DO IFAC3.SPR WITH .F.,.F.,"CCP"," Facturas por Cuenta de Propietarios ",.T.
         ENDIF
      ENDIF
   ENDIF
   ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

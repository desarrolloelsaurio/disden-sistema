* 浜様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : INTE.PRG                �
* � COMENTARIO    : GESTION DE INTERESADOS  �
* 麺様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                �
* � FECHA      : 11-06-93                   �
* � HORA       : 03:05:36am                 �
* � COPYRIGHT  : 1993 by GREGORIO REINER    �
* 藩様様様様様様様様様様様様様様様様様様様様�
#DEFINE BOTOM "  "+repl("�",78)                  && BOTOM
GA1_DIJO=ALLTRIM(PROMPT())
EXTERNAL PROCEDURE ELIINTE.PRG
RELE INT_TIPO
DO CASE
CASE GA1_DIJO="Legajo"
   INT_TIPO="J"
CASE GA1_DIJO="Interesados" .or. ;
     GA1_DIJO="Datos Administrativos"
   INT_TIPO=.F.
CASE GA1_DIJO="Agrupaci�n" .OR. ;
     GA1_DIJO="Agrupaci�n"
   =OPCAG()
   INT_TIPO="A"
CASE GA1_DIJO="Pasa a Cliente"
   INT_TIPO="P"
OTHERWISE
   INT_TIPO="F"
ENDCASE
IF TYPE("INT_TIPO")#"U"
   =OPCIU()
   DO OPINT
   ULPR=PROGRAM()
   =CABPAN1()
   SELE PER
   EXTERNAL ARRAY CONTENIDO
   EXTERNAL ARRAY TEXTO
   DIME TEXTO[10],CONTENIDO[9]
   TEXTO[1]="Interesado"
   TEXTO[2]="Interesado"
   TEXTO[3]="Interesados"
   *[4] VA DESPUES
   TEXTO[5]="Fecha Prox Visita"
   TEXTO[6]="Detalle"
   TEXTO[7]="Legajo"
   TEXTO[10]="Apellido y Nombre"
   TIPO_PER="INTERESADO"
 
   CONTENIDO[1]="@!"
   CONTENIDO[2]=9
   CONTENIDO[3]="INTCOD"
   CONTENIDO[4]="INTERESADO"
   CONTENIDO[5]="I"
   CONTENIDO[6]=.T.
   CONTENIDO[7]=.F.
   CONTENIDO[8]=.F.
   CONTENIDO[9]=.F.
 
   TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
   DO CASE
   CASE EMPTY(INT_TIPO)
      DO PERSISD.SPR WITH .T.
         CASE INT_TIPO="A"
      DO IPER_CAG.SPR WITH .F.,.F.,"PER",Iif(_windows," Agrupaci�n "," Agrupaci�n "),.T.
   CASE INT_TIPO="J"
      DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Interesado ",.T.
   CASE INT_TIPO="P"
      CONTENIDO[7]=.T.
      CONTENIDO[8]=.T.
      CONTENIDO[9]="CLIDNI"
      DO INTAPER.SPR WITH .F.,.F.,"PER"," ",.T.
   ENDCASE
   ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

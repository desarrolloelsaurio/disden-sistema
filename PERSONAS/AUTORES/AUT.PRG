* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : AUT.PRG               บ
* บ COMENTARIO    : GESTION DE AUTORES บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 11-06-93                 บ
* บ HORA       : 03:05:36am               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM
PARAMETER PROM_PER
EXTERNAL PROCEDURE ELIAUT
GA1_DIJO=IIF(EMPTY(PROM_PER),ALLTRIM(PROMPT()),PROM_PER)
RELE CLI_TIPO
=OPAUT()
DO CASE
CASE GA1_DIJO="Legajo" .OR. ;
GA1_DIJO="Legajo del Autor"
   CLI_TIPO="J"
CASE GA1_DIJO="Domicilio Postal"
   CLI_TIPO="D"
CASE GA1_DIJO="Datos Generales"
   CLI_TIPO=.F.
CASE GA1_DIJO="Agrupaci๓n" .OR. ;
     GA1_DIJO="Agrupaciขn"
   =OPCAG()
   CLI_TIPO="A"
ENDCASE
IF TYPE("CLI_TIPO")#"U"
   =OPCIU()
   =OPCLI()
   ULPR=PROGRAM()
   =CABPAN1()
   SELE PER
   EXTERNAL ARRAY CONTENIDO
   EXTERNAL ARRAY TEXTO
   #IF "NOVO" $ CURD() .OR. "PUNTOP" $ CURD()
      DIME TEXTO[12],CONTENIDO[9]
      TEXTO[12]="Lista de Precios"
   #ELSE
      DIME TEXTO[11],CONTENIDO[9]
   #ENDIF
   TEXTO[1]="Cliente"
   TEXTO[2]="Cliente"
   TEXTO[3]="Clientes"
   *[4] VA DESPUES
   TEXTO[5]="Fecha de Nacimiento"
   TEXTO[6]="Detalle"
   TEXTO[7]="Legajo"
   TEXTO[10]="Apellido y Nombre"
   TEXTO[11]="Zona"
   TIPO_PER="CLIENTE"
   CONTENIDO[1]="@!"
   #IF "NOVO" $ CURD() .OR. "PUNTOP" $ CURD()
      CONTENIDO[2]=8
      CONTENIDO[5]=Q_FILCLI()
   #ELSE
      TEXCOD="ZONCOD"
      TEXTEX="ZONTEX"
      CONTENIDO[2]=9
      CONTENIDO[5]="C"
   #ENDIF
   CONTENIDO[3]="CODCLI"
   CONTENIDO[4]="CLIENTES"
   CONTENIDO[6]=.T.
   CONTENIDO[7]=.T.
   CONTENIDO[8]=.T.
   CONTENIDO[9]="CLIDNI"

   TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
   DO CASE
   CASE EMPTY(CLI_TIPO)
      IF SSTM1="DIS-DEN"
         CONTENIDO[7]=.F.
         CONTENIDO[9]=.F.
         DO PERSDT.SPR WITH .T.
      ELSE
        IF SSTM1="BARCOS"
            G_GRABA="GRABAPRO()"
         ENDIF
         #IF "NOVO" $ CURD() .OR. "PUNTOP" $ CURD()
            DO PERYNU1.SPR WITH .T.
         #ELIF "BINA" $ CURD()
         CONTENIDO[7]=.F.
         CONTENIDO[9]=.F.
                     DO PERSDNI.SPR WITH .T.
         #ELSE
            DO IPER.SPR WITH .T.
         #ENDIF
      ENDIF
   CASE CLI_TIPO="A"
      DO IPER_CAG.SPR WITH .F.,.F.,"PER",;
        Iif(_windows," Agrupaci๓n "," Agrupaciขn "),.T.
   CASE CLI_TIPO="J"
      DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Autor ",.T.
   OTHERWISE
      eltit1=" Domicilio Postal "
      DO IPER_DPO.SPR WITH .F.,.F.,"PER"," Domicilio Postal del Autor ",.T.
   ENDCASE
   ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

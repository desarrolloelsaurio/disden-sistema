* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CLI.PRG               บ
* บ COMENTARIO    : GESTION DE CLIENTES   บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 11-06-93                 บ
* บ HORA       : 03:05:36am               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM
PARAMETER PROM_PER
EXTERNAL PROCEDURE ELICLI
GA1_DIJO=IIF(EMPTY(PROM_PER),ALLTRIM(PROMPT()),PROM_PER)
RELE CLI_TIPO
=OPCLI()
DO CASE
CASE GA1_DIJO="Legajo" .OR. ;
GA1_DIJO="Legajo del Cliente"
   CLI_TIPO="J"
CASE GA1_DIJO="Domicilio Postal"
   CLI_TIPO="D"
CASE GA1_DIJO="Datos Administrativos"
   CLI_TIPO=.F.
CASE GA1_DIJO="Agrupaci๓n" .OR. ;
     GA1_DIJO="Agrupaciขn"
   =OPCAG()
   CLI_TIPO="A"
CASE GA1_DIJO="Asigna Transporte"
   CLI_TIPO="T"
CASE GA1_DIJO="Asigna Operadores"
   CLI_TIPO="O"
CASE GA1_DIJO="Asigna Caja"
   CLI_TIPO="S"
CASE GA1_DIJO="Borra Caja"
   CLI_TIPO="B"
CASE GA1_DIJO="Un Cliente" .OR. ;
GA1_DIJO="Resumen de Cuenta por Pantalla" .OR. ;
GA1_DIJO="Cuenta Corriente un Inquilino"  .or. ;
GA1_DIJO="Cuenta Corriente un Cliente"  && LISTADO DE CUENTA CORRIENTE-BOCHI-CRT
   m.eltesto=""
   CLI_TIPO="PCCL"
CASE GA1_DIJO="Res๚men Com๚n" or ;
GA1_DIJO="Res๚men Especial" or ;
GA1_DIJO="Resumen de Cta un Cliente"	&& LISTADO DE CUENTA CORRIENTE-BOCHI-PRN
   CLI_TIPO="ICCL"
   if  GA1_DIJO="Res๚men Especial"
   	m.eltesto="Por favor. Tomar Fecha de Vencimientos de Facturas y enviar pagos a la brevedad.   Muchas gracias."
   else
*****       m.eltesto="กPara su comodidad!..."+chr(13)+chr(10)+"Deposite en nuestra caja de ahorro"+chr(13)+chr(10)+"Horacio Calamante - Banco de Galicia nro 409060930753 "
       m.eltesto=""
   endif
CASE GA1_DIJO="Pasa a Hist๓rico" .OR. ;
GA1_DIJO="Pasa a Histขrico"
   CLI_TIPO="PHI"
CASE GA1_DIJO="Cobrado Cuota/Cheque" .OR. ;
GA1_DIJO="Cobrado Cuota - Cheques"
   CLI_TIPO="CCC"
CASE GA1_DIJO="Monto"
   CLI_TIPO="NCR"
CASE GA1_DIJO="Reimputaciขn Manual"
   CLI_TIPO="REI"
CASE GA1_DIJO="Salda por Partida"
   CLI_TIPO="SPP"
CASE GA1_DIJO="Hist๓rico por Pantalla" .OR. ;
GA1_DIJO="Histขrico por Pantalla" .OR. ;
GA1_DIJO=="Histขrico"
   CLI_TIPO="LHIP"
CASE GA1_DIJO="Hist๓rico por Impresora" .OR. ;
"Histขrico por Impresora"
   CLI_TIPO="LHII"
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
   CASE CLI_TIPO="T"
     DO IPER_DO.SPR WITH .F.,.F.,"PER","Asigna Transporte",.F.,21
   CASE CLI_TIPO="ICCL"
      DO IPER_dO.SPR WITH .F.,.F.,"PER"," Listado de Cuenta Corriente ",.F.,2
   CASE CLI_TIPO="PCCL"
      DO IPER_dO.SPR WITH .F.,.F.,"PER"," Listado de Cuenta Corriente ",.F.,1
   CASE CLI_TIPO="PHI"
      DO IPER_dO.SPR WITH .F.,.F.,"PER",IIF(_WINDOWS," Pasa a Hist๓rico ","Pasa a Histขrico"),.F.,3
   CASE CLI_TIPO="CCC"
      DO IPER_dO.SPR WITH .F.,.F.,"PER","Cobrado Cuota/Cheque",.F.,9
   CASE CLI_TIPO="REI"
      DO IPER_dO.SPR WITH .F.,.F.,"PER","Reimputaciขn Manual",.F.,10
   CASE CLI_TIPO="SPP"
      DO IPER_dO.SPR WITH .F.,.F.,"PER","Salda por Partida",.F.,11
   CASE CLI_TIPO="NCR"
      DO ICRE1.SPR WITH .F.,.F.,"PER"," Nota de Crdito por Monto "
    CASE CLI_TIPO="LHII"
      DO IPER_DO.SPR WITH .F.,.F.,"PER"," Cuenta Corriente "+IIF(_WINDOWS,"Hist๓rica ","Histขrica "),.F.,15
    CASE CLI_TIPO="LHIP"
      DO IPER_DO.SPR WITH .F.,.F.,"PER"," Cuenta Corriente "+IIF(_WINDOWS,"Hist๓rica ","Histขrica "),.F.,14
   CASE CLI_TIPO="J"
      DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Cliente ",.T.
      #IF "CAJA" $ CURD()
      CASE CLI_TIPO="O" && ASIGNA OPERADORES
         =OPOPE(.T.)
         DO ASIGOPE.SPR with .F.,.F.,"PER"," Asigna Operadores ",.T.
      CASE CLI_TIPO="S" && ASIGNA CAJAS
         DO ASIGCAJ.SPR WITH " Asigna Cajas ",0
      CASE CLI_TIPO="B" && BORRA CAJAS
         DO ASIGCAJ.SPR WITH " Borra Cajas ",1
      #ENDIF
   OTHERWISE
      eltit1=" Domicilio Postal "
      DO IPER_DPO.SPR WITH .F.,.F.,"PER"," Domicilio Postal del Cliente ",.T.
   ENDCASE
   ULPR=PROGRAM()
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

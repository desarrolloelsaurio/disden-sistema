* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : PRO.PRG                 บ
* บ COMENTARIO    : GESTION DE PROVEEDORES  บ
* ฬอออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                บ
* บ FECHA      : 11-06-93                   บ
* บ HORA       : 03:05:36am                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER    บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+repl("ฐ",78)                  && BOTOM
PARAMETER QUE_DIJO
EXTERNAL PROCEDURE ELIPRO
GA1_DIJO=IIF(EMPTY(QUE_DIJO),ALLTRIM(PROMPT()),QUE_DIJO)
=OPCIU()
=OPIVA()
=OPPRO()
RELE PRO_TIPO
DO CASE
CASE GA1_DIJO="Legajo"
   PRO_TIPO="J"
CASE GA1_DIJO="Datos Administrativos" .OR. ;
     SSTM="CONTROL BANCOS"
   PRO_TIPO=.F.
CASE GA1_DIJO=="Factura de Compras"
   PRO_TIPO="FCO"
CASE GA1_DIJO="Recibo de Proveedores"
   PRO_TIPO="RCP"
CASE GA1_DIJO="Nota de Cr้dito de Proveedores" .or. ;
GA1_DIJO="Nota de Crdito de Proveedores" 
   PRO_TIPO="NCP"
CASE GA1_DIJO="Nota de D้bito de Proveedores" .or. ;
GA1_DIJO="Nota de Dbito de Proveedores"
   PRO_TIPO="NDP"
CASE GA1_DIJO=="Facturas de Servicio"
   PRO_TIPO="F"
CASE GA1_DIJO="Mira un Remito"
   =OPPRO()
#IF "STOCK" $ CURDIR() .AND. "PROD" $ CURDIR()
   DO OPAVIS
   DO OPTELS
   DO OPCOMS
   DO OPOTRS
#ELSE
   DO OPMER
#ENDIF
   DO OPREC
   PRO_TIPO="R"
CASE GA1_DIJO="Agrupaci๓n" .OR. ;
     GA1_DIJO="Agrupaciขn"
   =OPCAG()
   PRO_TIPO="A"
CASE GA1_DIJO="Datos de Producciขn"
   PRO_TIPO="DP"
CASE GA1_DIJO="Presupuestos"
   PRO_TIPO="PRS"
CASE GA1_DIJO="CCLPRP" .OR.  GA1_DIJO="CCLPRI" 
   PRO_TIPO=GA1_DIJO
ENDCASE
 
IF TYPE("PRO_TIPO")#"U"
   =OPCIU()
   =OPPRO()
   ULPR=PROGRAM()
   =CABPAN1()
   SELE PER
   EXTERNAL ARRAY CONTENIDO
   EXTERNAL ARRAY TEXTO
   DIME TEXTO[10],CONTENIDO[9]
   TEXTO[1]="Proveedor"
   TEXTO[2]="Proveedor"
   TEXTO[3]="Proveedores"
   *[4] VA DESPUES
   TEXTO[5]="Fecha de Nacimiento"
   TEXTO[6]="Detalle"
   TEXTO[7]="Legajo"
   TEXTO[10]="Apellido y Nombre"
   TIPO_PER="PROVEEDOR"
 
   CONTENIDO[1]="@!"
   CONTENIDO[2]=9
   CONTENIDO[3]="PROCOD"
#IF "RAFUL" $ CURD() .OR. "ALQ" $ CURD() .OR. "EXPE" $ CURD()
   CONTENIDO[4]="PROPIETA"
#ELSE
   CONTENIDO[4]="PROVEEDO"
      TEXCOD="ZONCOD"
      TEXTEX="ZONTEX"
#ENDIF
   CONTENIDO[5]="R"
   CONTENIDO[6]=.T.
   CONTENIDO[7]=.F.
   CONTENIDO[8]=.T.
   CONTENIDO[9]=.F.
 
   TEXTO[4]='AJCODPER(M.CODCLI,'+ALLTRIM(STR(CONTENIDO[2]))+',"'+CONTENIDO[5]+'")'
   DO CASE
   CASE EMPTY(PRO_TIPO)
#IF "GEST" $ CURDIR()
      STORE .F. TO CONTENIDO[6],;
        CONTENIDO[7],;
        CONTENIDO[8],;
        CONTENIDO[9]
      DO IPER_RED.SPR WITH .T.
#ELSE
      IF SSTM1="BARCOS"
         G_GRABA="GRABAPRO()"
      ENDIF
      DO IPER.SPR WITH .T.
#ENDIF
   CASE PRO_TIPO=="R"
      RETURN ELIREC()
   CASE PRO_TIPO=="J"
      DO IPER_LEG.SPR WITH .F.,.F.,"PER"," Legajo del Proveedor ",.T.
   CASE PRO_TIPO=="F"
      rpr=iif(type("rpr")='N',rpr,4)
      cpr=iif(type("cpr")='N',cpr,15)
      RESPUESTA='grl#'+str(rpr)+'#'+str(cpr)+'#Facturas de Servicio y Compras#3;
#\<Facturas;
#\<Notas de Crdito;
#\<Borra Documento;
#-;
#\<Muestra Factura;
#\<Lista por Pantalla;
#Lista por \<Impresora;
#-;
#Reinde\<xa'
      =defpop()
      ON SELE POPU GRL DO FACTUR
      ACTI POPU GRL
      RELE POPU GRL
      ULPR=PROGRAM()
   CASE PRO_TIPO=="A"
      DO IPER_CAG.SPR WITH .F.,.F.,"PER",;
        Iif(_windows," Agrupaci๓n "," Agrupaciขn "),.T.
   CASE PRO_TIPO=="DP"
   CASE PRO_TIPO=="PRS"
      =OPPRC()
      =OPPRS()
      =OPMER()
      DO INGPRS1.SPR WITH .F.,.F.,"PRS"," Presupuesto de Servicios Textiles ",.T.
   CASE PRO_TIPO=="FCO"
      store 'FA' to m.tipopec
      store  'Fact' to m.ABRE
      store 'FACT' to m.ABR1
      store 'Factura' to m.tit_sin
      store 'Facturas' to m.tit_pl
      store .f. to m.SOLOVER,HAYFACTURA
      DO ifacd WITH .f.,.F.,"FAR"," Factura de Compras "
   CASE PRO_TIPO=="RCP"
      store 'RE' to m.tipopec
      store 'Recibo' to m.ABRE
      store 'Rec.' to m.ABR1
      store "Recibo" to m.tit_sin
      store "Recibos" to m.tit_pl
      store .f. to m.SOLOVER,HAYFACTURA
      store .t. to m.HAYRECIBO
      DO ifacd WITH .f.,.F.,"FAR"," Recibo de Proveedores "
   CASE PRO_TIPO=="NCP"
      store 'NC' to m.tipopec
      store 'N.Cr.' to m.ABRE
      store 'N.CR.' to m.ABR1
      store 'Nota de '+iif(_windows,"Cr้dito","Crdito") to m.tit_sin
      store 'Notas de '+iif(_windows,"Cr้dito","Crdito") to m.tit_pl
      store .f. to m.SOLOVER,HAYFACTURA
      DO ifacd WITH .f.,.F.,"FAR"," Notas de "+iif(_windows,"Cr้dito","Crdito")+" de Proveedores "
   CASE PRO_TIPO=="NDP"
      store 'ND' to m.tipopec
      store  'N.De.' to m.ABRE
      store 'N.DE.' to m.ABR1
      store 'Nota de D้bito' to m.tit_sin
      store 'Notas de D้dito' to m.tit_pl
      store .f. to m.SOLOVER,HAYFACTURA
      DO ifacd WITH .f.,.F.,"FAR"," Notas de D้bito de Proveedores "
   CASE PRO_TIPO="CCLPRP" .OR.  PRO_TIPO="CCLPRI" 
      DO IPER_dO.SPR WITH .F.,.F.,"PER"," Listado de Cuenta Corriente Proveedores ",.F.,16
   ENDCASE
ENDIF
UNLO ALL
RETURN MEN_LIN(BOTOM)

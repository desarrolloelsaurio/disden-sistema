* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CTACTEC1.PRG                                   บ
* บ COMENTARIO    : DERIVA A LISTADOS DE CUENTA CORRIENTE CLIENTES บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                       บ
* บ FECHA      : 12-08-93                                          บ
* บ HORA       : 06:22:44pm                                        บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                           บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
PARAMETER POR_PAN
#DEFINE BOTOM  "  "+REPL("ฐ",78)                 && BOTOM
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
CTA_DIJO=ALLTRIM(PROMPT())
ULPR=PROGRAM()
=CABPAN1()
CTACTEC=BAR()
DO CASE
CASE CTA_DIJO='Falta de Recepciขn de Pagos'
   DO LDEU WITH POR_PAN
CASE cta_dijo="Deuda de los Clientes" .OR. ;
     cta_dijo="Deuda de los Consorcistas"
   DO LCCL WITH POR_PAN
CASE cta_dijo="Sขlo Alquileres"   
   DO LCCLALQ WITH POR_PAN
CASE cta_dijo="Cheques en Cartera"
   DO LCCH WITH POR_PAN
CASE cta_dijo="Agrupa por Factura"
   #IF "RAFULS" $ CURD()
      DO cligrl WITH 12,47,'Lกmites del Listado',.t.,"I"
   #ELSE
      DO cligrl WITH 12,47,'Lกmites del Listado',.t.
   #ENDIF
   ON SELE POPU CLIGRL DO LAGR WITH POR_PAN
   ACTI POPU CLIGRL
   RELE POPU CLIGRL
CASE cta_dijo="Estado Patrimonial"
   #IF "RAFULS" $ CURD()
      DO CLIGRL WITH 17,47,'Lกmites del Listado',.t.,"I"
   #ELSE
      DO CLIGRL WITH 17,47,'Lกmites del Listado',.t.
   #ENDIF
   ON SELE POPU CLIGRL DO LPAT WITH POR_PAN
   ACTI POPU CLIGRL
   RELE POPU CLIGRL
CASE cta_dijo="An lisis de un Cliente" .AND. !POR_PAN
   DO LANACCLI
CASE cta_dijo="Un Inquilino" 
   DO INQ
CASE CTA_DIJO="Consistencia de Recibos"
   DO CONRECB
case cta_dijo="Histขrico"
if SSTM1="ADMIN"
   DO INQ
   else
   do cli
   endif
CASE cta_dijo="Mal Imputadas"
   =LCCLPR1(.T.,.T.)
CASE cta_dijo="Saldo Negativo"
   =LCCLPR1(.T.,.f.,.t.)
CASE cta_dijo="Un Cliente" 
    DO CLI
CASE CTA_DIJO="Cuenta Corriente un Inquilino"
*   DO LCCLU WITH POR_PAN
    DO CLI
CASE CTA_DIJO="Histขrico"
    DO CLI
CASE cta_dijo="Saldos Completos"
   FISC=".T."
   FILCLI=1
   TTQUE=CRLF+"Todos los Inquilinos"
   =IIF(POR_PAN,LCCLPR(),LCCLIR())
CASE cta_dijo="Saldos por Propietario"
   STORE NUL TO M.RESPUESTA
   IF ELIPRP("a Listar",-1,1)
      =OPINM()
      =OPALQ()
      ELPRP=PER.CODCLI
      ELPRP1=PER.CLIENTE
      SELE INM
      SET ORDER TO TAG CODINM
      SELE CCL
      SET RELA TO CODINM INTO INM
      FISC="INM.PROCOD='"+ELPRP+"'"
      FILCLI=1
      TTQUE=CRLF+"Inquilinos de "+alltrim(elprp1)
      =IIF(POR_PAN,LCCLPR(),LCCLIR())
      =OFF_RELA()
   ELSE
      =NOSELEC("PROPIETARIO")
   ENDIF
CASE cta_dijo="Informe de Perกodo"
  do infoper with por_pan
ENDCASE
RETURN MEN_LIN(BOTOM)

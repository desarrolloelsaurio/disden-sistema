PARAMETER PORP1
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
EXTERNAL PROCEDURE LCCI10.PRG
LI_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LI_DIJO="Impuestos de Inquilinos"
   =LCCI(PORP1)
CASE LI_DIJO="Impuestos de Propietarios"
   =OPCCP()
   STORE NUL TO M.RESPUESTA
   IF ELIPRP("a Listar",-1,1)
      =WORKING()
      =DOTALK()
      TMP=GENTMP()
      SELE CCP
      =FLOCK() .OR. FLOK()
      SORT ON FECHAVE TO (TMP) FOR ;
      PROCOD=PER.CODCLI .AND. ;
      INLIST(DETALLE,"DIP","INM","MUN")
      UNLO IN CCP
      =PRXAREA(.T.)
      USE (TMP) ALIAS TMP
      TT="Listado de Impuestos"+;
      crlf+;
      alltrim(per.cliente)
      ACLA=PAIP+"F. VENC."+PAIP+;
      PADC("DETALLE",30)+PAIP
      =LGRL2(PORP1,"TMP","LCCI10()","","")
      =OFF_TMP()
      =UNTALK()
      =UNWORK()
   ELSE
   =NOSELEC("PROPIETARIO")
   ENDIF
ENDCASE
RETURN MEN_LIN(BOTOM)

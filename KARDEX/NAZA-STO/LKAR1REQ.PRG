FUNCTION LKAR1REQ
PARAMETER PORPAN
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE NUL    0                                 && NUL
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

EXTERNAL PROCEDURE LKAR1RQ0
=OPTELS()
=OPAVIS()
=OPCOMS()
=OPKARS()
STORE NUL TO M.RESPUESTA
LAORD=INFIC("Orden de Requerimiento a Listar",9999999)
if !empty(m.laord) .and. ;
   last()#27
   =WORKING()
   =DOTALK()
   TMP=GENTMP()
   LAREF="OR "+ZERO(M.LAORD,8)
   SORT ON FECHAOP,;
   TELCODPRO,;
   AVICODPRO ;
   TO (TMP) ;
   FOR REFERENCIA=LAREF
   SELE KARS
   USE (TMP) ALIAS KARS
   SET ORDER TO TAG AVICODPRO IN AVIS
   SET ORDER TO TAG TELCODPRO IN TELS
   STORE "" TO M.LINEA,M.CASOS
   TT="Listado de Kardex"+;
   crlf+;
   "Orden de Requerimiento N§ "+alltrim(str(m.LAORD))
   ACLA=PAIP+;
   " FECHA  "+PAIP+;
   PADC("CODIGO",20)+PAIP+;
   PADC("MATERIAL",30)+PAIP+;
   PADC("ENTRADA",XACDIGI)+PAIP+;   
   "UNID"
   =UNWORK()
   =UNTALK()
   =XPRN1(4,"KARS","LKAR1RQ0()",ZERO(M.LAORD,8),"LKARREQ")
   =OPKARS(.T.)
ENDIF
RETURN MEN_LIN(BOTOM)
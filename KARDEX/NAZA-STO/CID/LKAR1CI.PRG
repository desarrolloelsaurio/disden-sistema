FUNCTION LKAR1CI
#DEFINE BOTOM  "  "+repl("�",78)              && BOTOM
#DEFINE PAIP   "|"                            && PAIP
#DEFINE NUL    0                              && NUL
#DEFINE CRLF CHR(13)+CHR(10)                  && CRLF

EXTERNAL PROCEDURE LKAR1CI0
DO OPTELS
DO OPAVIS
=OPKARS()
STORE NUL TO M.NROCID,M.RESPUESTA
M.NROCID=INFIC("C.I.D. a Listar",99999999)
IF LAST()#27 .AND. !EMPTY(M.NROCID)
   =WORKING()
   =DOTALK()
   M.NROCIDX=ZERO(M.NROCID,8)
   TMP=GENTMP()
   SORT ON FECHAOP, TELCODPRO, AVICODPRO TO (TMP) ;
     FOR NUMERO=M.NROCIDX .AND. COMPR="CI"
   =PRXAREA(.T.)
   USE (TMP) ALIAS TMP
   SET ORDER TO TAG AVICODPRO IN AVIS
   SET ORDER TO TAG TELCODPRO IN TELS
   STORE "" TO M.LINEA,M.CASOS
   TT="Listado de Kardex"+;
     crlf+;
     "Comp. Interno de Dep�sito N� "+alltrim(str(m.nrocid))
   ACLA=" FECHA  "+PAIP+;
     PADC("CODIGO",20)+PAIP+;
     PADC("MATERIAL",25)+PAIP+;
     PADC("ENTRADA",XACDIGI)+PAIP+;
     PADC("SALIDA",XACDIGI)+PAIP+;
     "UNID"+PAIP
   =UNWORK()
   =UNTALK()
   =XPRN1("TMP","LKAR1CI0()",M.NROCIDX,"LKAR1CI")
   =OFF_TMP()
ENDIF
RETURN MEN_LIN(BOTOM)

PARAMETER PORPAN
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

STORE NUL TO RESPUESTA
SELE PRX
SET RELA OFF INTO PRA
IF ELIPRA("a Listar",-1,1)
   =WORKING()
   =DOTALK()
   TMP=GENTMP()
   SELE PRX
   SET ORDER TO
   =FLOCK("PRX") .OR. FLOK("PRX")
   SORT ON CODPRX,TIPO,UNIDAD ;
     FOR CODPRA=PRA.CODPRA ;
     TO (TMP)
   USE
   USE (TMP) ALIAS PRX EXCL
   GO TOP
   ELCOD=PRX.CODPRX
   ACLA=PAIP+"TIPO"+PAIP+;
   "COD."+PAIP+;
     PADC("CONCEPTO",20)+PAIP+;
     "CANT"+PAIP
   M.LINEA=REPL("=",LEN(ACLA))

   TT1="Listado de Componentes"+;
     crlf+;
     "PRACTICA:"+alltrim(pra.practica)+;
     crlf+;
     "CODIGO:"+alltrim(pra.codPRA)
   =UNTALK()
   =UNWORK()
   IF PORPAN
      DO LPRXP
   ELSE
      DO LPRXI
   ENDIF
   =REOPPRA()
ENDIF
SELE PRX
SET ORDER TO TAG CODPRX
SET RELA TO CODPRA INTO PRA
RETURN MEN_LIN(BOTOM)

#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF

** LISTA PACIENTES - UNA PRACTICA - ENTRE FECHAS
FUNCTION LPAC1
PARAMETER PORPAN
STORE NUL TO M.RESPUESTA
IF ELIPRA("a Listar",-1,1)
   LAPRA=PRA.CODPRA
   ELNOPRA=ALLTRIM(PRA.PRACTICA)
   STORE {} TO M.FECINI,M.FECFIN
   IF ENTRE_FE("a Listar")
   SELE LIQ
   ACLA=PAIP+;
   " FECHA  "+;
   PAIP+;
   PADC("PACIENTE",30)+;
   PAIP+;
   "SUBCODIGO "+;
   PAIP+;
   PADC("MEDICO",IIF(PORPAN,15,30))+;
   PAIP+;
   IIF(PORPAN,"",PADC("OPERADOR",30)+PAIP)
   
   TMP=GENTMP()
   =FLOCK("LIQ") .OR. FLOK("LIQ")
   =WORKING()
   =DOTALK()
   SORT ON FECHAIN,;
   PER.CLIENTE ;
   FOR LIQ.PRACTICA=PRA.CODPRA .AND. ;
   FECHAIN>=M.FECINI .AND. ;
   FECHAIN<=M.FECFIN ;
   TO (TMP)
   UNLO IN LIQ
   =PRXAREA(.T.)
   USE (TMP) ALIAS TMP
   TT="Listado de Pacientes"+;
   crlf+;
   "PRACTICA:"+;
   trans(LAPRA,"@R 99.99.99")+;
   CRLF+;
  ELNOPRA+;
  CRLF+;
  "entre el "+;
  dtoc(m.fecini)+;
  " y el "+;
  dtoc(m.fecfin)
  
  
   =UNTALK()
   =UNWORK()
   =IIF(PORPAN,;
   LGRLP("TMP","LPAC10()",PRA.CODPRA,"LPRAPAC"),;
   LGRLI("TMP","LPAC10()",PRA.CODPRA,"LPRAPAC"))
   =OFF_TMP()
   ENDIF
ENDIF
RETURN MEN_LIN(BOTOM)
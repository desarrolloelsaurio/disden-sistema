FUNCTION UNRUB
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

STORE NUL TO M.RESPUESTA
IF ELIRUB("a Listar",-1,1)
   TMP=GENTMP()
   SELE FAC
   =FLOCK() .OR. FLOK()
   SORT ON NROITE TO (TMP) FOR MER.RUBRO=LEFT(MIX.TEXTO2,3)
   TT="Rubro:"+alltrim(mix.texto1)
   
   
   UNLO IN FAC
   =PRXAREA(.T.)
   USE
ELSE
=NOSELEC("RUBRO")
ENDIF
RETURN MEN_LIN(BOTOM)
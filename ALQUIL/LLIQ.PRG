* FUNCTION LLIQ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
LL_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LL_DIJO="Todos los Inquilinos"
   FISC=".T."
   DO LLIQ1
CASE LL_DIJO="Por Localidad"
   STORE NUL TO RESPUESTA
   IF ELICIU("a Listar",-1,1)
      FISC="INM.CIUCOD="+ALLTRIM(STR(MIX.NU1))
      DO LLIQ1
   ENDIF
CASE LL_DIJO="Por Propietario"
   STORE NUL TO RESPUESTA
   IF ELIPRP("a Listar",-1,1)
      FISC="ALQ.PRPCOD='"+PER.CODCLI+"'"
      DO LLIQ1
   ENDIF
CASE LL_DIJO="Un Inquilino"
   STORE NUL TO RESPUESTA
   IF ELIINQ("a Listar",-1,1)
      FISC="ALQ.CODCLI='"+PER.CODCLI+"'"
      DO LLIQ1
   ENDIF
ENDCASE
RETURN MEN_LIN(BOTOM)

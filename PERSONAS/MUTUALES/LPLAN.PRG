PROCEDURE LPLAN
PARAMETER PORPAN
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

ULPR=HORA_ULP(PROGRAM())
STORE NUL TO RESPUESTA
IF ELIMUT("a Listar",-1,1)
   M.LAMUT=MUT.CODMUT
   =working()
   =dotalk()
   TT="Listado de Planes"+;
   crlf+;
   "Obra Social "+alltrim(mut.mutualabr)
   tmp=GENTMP()
   SELE MUT
   SET ORDER TO
   =FLOCK("MUT") .OR. FLOK("MUT")
   SORT ON PLAN TO (TMP) FOR CODMUT=LAMUT .AND. !EMPTY(CODPLAN)
   USE (TMP) ALIAS MUT
   ACLA=PAIP+;
   " COD "+PAIP+;
   PADC("PLAN",20)+PAIP+;
   PADC("ARANCEL",20)+PAIP
   STORE NUL TO M.CASOS
	LINEA=REPL("=",LEN(ACLA))
   =untalk()
   =unwork()
   if porpan
   do lplanp
   else
      do lplani
      endif
      =IAUD(M.LAMUT)
      =reopmut()
ENDIF
RETURN MEN_LIN(BOTOM)

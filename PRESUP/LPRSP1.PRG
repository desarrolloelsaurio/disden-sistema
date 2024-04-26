FUNCTION LPRSP1
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE NUL    0                                 && NUL 
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
EXTERNAL PROCEDURE LPRS12
ULPR=HORA_ULP(PROGRAM())
RESPUESTA="LPRS11#6#25#Listado de Prespuestos#3;
#\<Un Art¡culo;
#Art¡culo-\<Proceso;
#\<Rubro-Proceso;
#Rubro-Taller"
=DEFPOP()
ON SELE POPU lprs11 DO lprsP11
ACTI SCRE
ACTI POPU lprs11
RELE POPU lprs11
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
FUNCTION LPRSP11
LP_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE LP_DIJO="Un Art¡culo"
   DO IMER_DO.SPR WITH .F.," Lista Presupuesto de un Art¡culo ",25,.T.
CASE LP_DIJO="Art¡culo-Proceso"
   DO IMER_DO.SPR WITH .F.," Lista Presupuesto Art¡culo/Proceso ",26,.T.
CASE LP_DIJO="Rubro-Proceso"
   STORE NUL TO M.RESPUESTA
   IF ELIRUB("a Listar",-1,1)
      =WORKING()
      =DOTALK()
      STORE NUL TO M.RESPUESTA
      M.ELRUBRO=LEFT(MIX.TEXTO2,3)
      IF ELIPRC("a Listar",-1,1)
         TT="Listado de Presupuesto de Servicios"+;
           crlf+;
           "Proceso:"+alltrim(prc.procfab)+;
           crlf+;
           "Rubro:"+alltrim(mix.TEXTO1)
         SELE PRS
         TMP=GENTMP()
         SORT ON ARTICULO,CODCLI TO (TMP) FOR ;
           LEFT(ARTICULO,3)=M.ELRUBRO .AND. ;
           PRCCOD=PRC.PRCCOD
         =UNLO_PRX("PRS",TMP)
         ACLAPRN=PAIP+PADC("ARTICULO",13)+PAIP+;
         PADC("DESCRIPCIOM",40)+PAIP+;
         PADC("TALLER",30)+PAIP+;
         PADC("P. Unit.",xacdigi)+PAIP
         ACLAPAN=PAIP+PADC("ARTICULO",13)+PAIP+;
         PADC("DESCRIPCIOM",20)+PAIP+;
         PADC("TALLER",20)+PAIP+;
         PADC("P. Unit.",xacdigi)+PAIP
         =UNTALK()         
         =UNWORK()
         =xprn1(4,"TMP","LPRS12(3)",LEFT(MIX.TEXTO2,3)+"/"+PRC.PRCCOD,"LPRSPR") 
         =OFF_TMP()
         ELSE
            =NOSELEC("PROCESO DE FABRICACION")
      ENDIF
   ELSE
   =NOSELEC("RUBRO")
   ENDIF
CASE LP_DIJO="Rubro-Taller"
   DO TALS WITH "Rubro-Taller"
ENDCASE
RETURN MEN_LIN(BOTOM)

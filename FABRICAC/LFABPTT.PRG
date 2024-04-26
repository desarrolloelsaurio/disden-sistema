#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
PARAMETER PORPAN
D_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE D_DIJO="Listados Comunes"
   =OPEST() .AND. LFABPT(PORPAN)
CASE D_DIJO="Resumen Completo"
   STORE {} TO M.FECINI,M.FECFIN
   IF ENTRE_FE("a Listar") .and. ;
        LAST()#27 .AND. ;
        CONFIRMA("L¡mites del Listado "+DTOC(M.FECINI)+" a "+DTOC(M.FECFIN),.t.,10,10)
      =WORKING()
      =DOTALK()
      TMP=GENTMP()
      SELE COR
      SET ORDER TO TAG NUMERO
      SELE FAX
      SET ORDER TO TAG REMTRU
      SET RELA TO NUMERO INTO COR
      =FLOCK() .OR. FLOK()
      SORT ON COR.ARTICULO ;
        TO (TMP) FOR ;
        TALLER="R000099995" .AND. ;
        BETW(SF,M.FECINI,M.FECFIN)
      UNLO IN FAX
      =PRXAREA(.T.)
      USE (TMP) ALIAS TMP
      SET RELA TO NUMERO INTO COR
      ACLA=PAIP+PADC("RUBRO",20)+;
        PAIP+;
        PADC("PRIMERA",10)+PAIP+;
        PADC("SEGUNDA",10)+PAIP+;
        PADC("TOTAL",10)+PAIP+;
        PADC("% SEG",7)+PAIP
      LINEA=REPL("=",LEN(ACLA))
      TT="Resumen de Producci¢n Terminada"+;
        crlf+;
        "entre el "+dtoc(m.fecini)+" al "+dtoc(m.fecfin)
      SELE TMP
      GO TOP
      ELRUB=LEFT(COR.ARTICULO,3)
      STORE NUL TO TER1,TTER1
      STORE NUL TO TER2,TTER2
      =UNTALK()
      =UNWORK()
      =IIF(PORPAN,LTER1P(),LTER1I())
      =OFF_TMP()
   ENDIF
CASE D_DIJO="Resumen por Rubro"
   STORE {} TO M.FECINI,M.FECFIN
   IF ENTRE_FE("a Listar") .and. ;
        LAST()#27 .AND. ;
        CONFIRMA("L¡mites del Listado "+DTOC(M.FECINI)+" a "+DTOC(M.FECFIN),.t.,10,10)
      STORE NUL TO RESPUESTA
      IF !EMPTY(ELIRUB("a Listar",-1,1))
         ELRUB=LEFT(MIX.TEXTO2,3)
         =WORKING()
         =DOTALK()
         TMP=GENTMP()
         SELE COR
         SET ORDER TO TAG NUMERO
         SELE FAX
         SET ORDER TO TAG REMTRU
         SET RELA TO NUMERO INTO COR
         =FLOCK() .OR. FLOK()
         SORT ON COR.ARTICULO ;
           TO (TMP) FOR ;
           LEFT(COR.ARTICULO,3)=ELRUB .AND. ;
           TALLER="R000099995" .AND. ;
           BETW(SF,M.FECINI,M.FECFIN)
         UNLO IN FAX
         =PRXAREA(.T.)
         USE (TMP) ALIAS TMP
         SET RELA TO NUMERO INTO COR
         ACLA=PAIP+PADC("ARTICULO",10)+;
           PAIP+;
           PADC("DESCRIPCION",20)+PAIP+;
           PADC("PRIMERA",10)+PAIP+;
           PADC("SEGUNDA",10)+PAIP+;
           PADC("TOTAL",10)+PAIP+;
           PADC("% SEG",7)+PAIP
         LINEA=REPL("=",LEN(ACLA))
         TT="Resumen de Producci¢n Terminada"+;
           crlf+;
           "entre el "+dtoc(m.fecini)+" al "+dtoc(m.fecfin)+;
           CRLF+;
           "RUBRO:"+ALLTRIM(SAYMIX(ELRUB,"RUBCOD"))
         GO TOP
         LAMER=COR.ARTICULO
         STORE NUL TO TER1,TTER1
         STORE NUL TO TER2,TTER2
 
         =UNTALK()
         =UNWORK()
         =IIF(PORPAN,LTER2P(),LTER2I())
         =OFF_TMP()
      ENDIF
   ENDIF
CASE D_DIJO="Resumen Especial"
   =OPMER()
   STORE "" TO TT,FISC,TTQUE
   DO QWMERCA.SPR
   IF !EMPTY(FISC) .AND. FISC#'.F.'
      STORE {} TO M.FECINI,M.FECFIN
      IF ENTRE_FE("a Listar") .and. ;
           LAST()#27 .AND. ;
           CONFIRMA("L¡mites del Listado "+DTOC(M.FECINI)+" a "+DTOC(M.FECFIN),.t.,10,10)
         FISC=qw_FISC(FISC,"TALLER='R000099995'")
         FISC=QW_FISC(FISC,"BETW(SF,{"+DTOC(M.FECINI)+"},{"+DTOC(M.FECFIN)+"})")
         FISC=QW_FISC(FISC,".T.")
         TT=QW_TT("Resumen de Producci¢n Terminada")+;
           QW_TT("entre el "+dtoc(m.fecini)+" al "+dtoc(m.fecfin))+;
           TTQUE
         =WORKING()
         =DOTALK()
         SET ORDE TO TAG ARTIRED IN MER
         SELE COR
         SET ORDER TO TAG NUMERO
         SET RELA TO ARTICULO INTO MER
         SELE FAX
         SET ORDER TO TAG REMTRU
         SET RELA TO NUMERO INTO COR
         =FLOCK() .OR. FLOK()
         TMP=GENTMP()
         SORT ON COR.ARTICULO TO (TMP) FOR &FISC
         UNLO IN FAX
         =PRXAREA(.T.)
         USE (TMP) ALIAS TMP
         SET RELA TO NUMERO INTO COR
         ACLA=PAIP+PADC("ARTICULO",10)+;
           PAIP+;
           PADC("DESCRIPCION",20)+PAIP+;
           PADC("PRIMERA",10)+PAIP+;
           PADC("SEGUNDA",10)+PAIP+;
           PADC("TOTAL",10)+PAIP+;
           PADC("% SEG",7)+PAIP
         LINEA=REPL("=",LEN(ACLA))
         GO TOP
         LAMER=COR.ARTICULO
         STORE NUL TO TER1,TTER1
         STORE NUL TO TER2,TTER2
 
         =UNTALK()
         =UNWORK()
         =IIF(PORPAN,LTER2P(),LTER2I())
         =OFF_RELA()
         =OFF_TMP()
      ENDIF
   ENDIF
ENDCASE
RETURN MEN_LIN(BOTOM)

PARAMETER PORPAN,ELCOSO,DECONSUMO,ELORDEN,FECHAFECHA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
EXTERNAL PROCEDURE INGDIA0.PRG
STORE {} TO M.FECINI,M.FECFIN
=ENTRE_FE("Fecha a Listar")
IF LAST()#27 .AND. !EMPTY(M.FECINI) .AND. !EMPTY(M.FECFIN)
   =WORKING()
   =DOTALK()
   =OPMIX()
   =OPKARS()
   SET ORDER TO
   DO CASE
   CASE ELCOSO="A"
      TT="Av¡os"
      =opavis()
      SET ORDER TO TAG AVICODPRO
      SELE KARS
      SET RELA TO AVICODPRO INTO AVIS
      FISC="!EMPTY(AVICODPRO)"
      DO CASE
      CASE ELORDEN=1
         CAMPO="AVIS.AVIO"
      CASE ELORDEN=2
         CAMPO="KARS.REFERENCIA,AVIS.AVIO"
      CASE ELORDEN=3
         CAMPO="KARS.NUMERO,AVIS.AVIO"
      ENDCASE
      ELACLA=PADC("AVIO",IIF(PORPAN,20,30))
   case elcoso="T"
      TT="Telas"
      =optels()
      SET ORDER TO TAG TELCODPRO
      SELE KARS
      SET RELA TO TELCODPRO INTO TELS
      FISC="!EMPTY(TELCODPRO)"
      ELACLA=PADC("TELA",IIF(PORPAN,20,30))
      DO CASE
      CASE ELORDEN=1
         CAMPO="TELS.TELA"
      CASE ELORDEN=2
         CAMPO="KARS.REFERENCIA,TELS.TELA"
      CASE ELORDEN=3
         CAMPO="KARS.NUMERO,TELS.TELA"
      ENDCASE
   case elcoso="C"
      TT="Productos Terminados"
      =opcoms()
      SET ORDER TO TAG COMCODPRO
      SELE KARS
      SET RELA TO COMCODPRO INTO COMS
      FISC="!EMPTY(COMCODPRO)"
      ELACLA=PADC("PRODUCTO TERMINADO",IIF(PORPAN,20,30))
      DO CASE
      CASE ELORDEN=1
         CAMPO="COMS.COMPRA"
      CASE ELORDEN=2
         CAMPO="KARS.REFERENCIA,COMS.COMPRA"
      CASE ELORDEN=3
         CAMPO="KARS.NUMERO,COMS.COMPRA"
      ENDCASE
   case elcoso="O"
      TT="Otros Productos"
      =opotrs()
      SET ORDER TO TAG OTRCODPRO
      SELE KARS
      SET RELA TO OTRCODPRO INTO OTRS
      FISC="!EMPTY(OTRCODPRO)"
      ELACLA=PADC("OTRO PRODUCTO",IIF(PORPAN,20,30))
      DO CASE
      CASE ELORDEN=1
         CAMPO="OTRS.OTRO"
      CASE ELORDEN=2
         CAMPO="KARS.REFERENCIA,OTRS.OTRO"
      CASE ELORDEN=3
         CAMPO="KARS.NUMERO,OTRS.OTRO"
      ENDCASE
   endcase
   TT="Listado de "+IIF(DECONSUMO,"Consumos de ","Ingresos de ")+tt
   TT=TT+;
     crlf+;
     "Fecha "+IIF(fechafecha,"de Alta","de Documento")+;
     "entre el "+dtoc(m.fecini)+" y el "+dtoc(m.fecfin)
   TMP=GENTMP()
   IF FECHAFECHA
      FISC=FISC+" .AND. "+iif(deconsumo,"!EMPTY(KARS.SALIDA)","!EMPTY(KARS.ENTRADA)")+" .AND. ;
        BETW(KARS.FECHA,{"+;
        DTOC(M.FECINI)+";
        },{"+;
        DTOC(M.FECFIN)+";
        })"
   ELSE
      FISC=FISC+" .AND. "+iif(deconsumo,"!EMPTY(KARS.SALIDA)","!EMPTY(KARS.ENTRADA)")+" .AND. ;
        BETW(KARS.FECHAOP,{"+;
        DTOC(M.FECINI)+";
        },{"+;
        DTOC(M.FECFIN)+";
        })"
   ENDIF
   ACLA=PAIP+"FECHA OP"+PAIP+;
     IIF(FECHAFECHA,"FECHA AL"+PAIP,"")+;
     PADC("ARTICULO",20)+PAIP+;
     ELACLA+PAIP+;
     IIF(!PORPAN,PADC("NUMERO",13)+PAIP+PADC("REFERENCIA",20)+PAIP+PADC("DETALLE",25)+PAIP,"")+;
     PADC("CANTIDAD",XACDIGI)+PAIP+;
     "UNID"+PAIP
   sele kars
   =flock() .or. flok()
   SORT ON &CAMPO ;
     TO (TMP) ;
     FOR &FISC
   UNLO IN KARS
   =PRXAREA(.T.)
   USE (TMP) ALIAS TMP EXCL
   do case
   case elcoso="A"
      SELE KARS
      SET ORDER TO TAG AVICODPRO
      SELE TMP
      SET RELA TO AVICODPRO INTO AVIS
   case elcoso="T"
      SELE TELS
      SET ORDER TO TAG TELCODPRO
      SELE TMP
      SET RELA TO TELCODPRO INTO TELS
   case elcoso="C"
      SELE COMS
      SET ORDER TO TAG COMCODPRO
      SELE TMP
      SET RELA TO COMCODPRO INTO COMS
   case elcoso="O"
      SELE OTRS
      SET ORDER TO TAG OTRCODPRO
      SELE TMP
      SET RELA TO OTRCODPRO INTO OTRS
   ENDCASE
   =UNTALK()
   =UNWORK()
   =LGRL2(PORPAN,"TMP","INGDIA0()",ELCOSO+"/"+;
     DTOC(M.FECINI)+"-"+;
     DTOC(M.FECFIN),;
     "LINGDIA")
   =OFF_TMP()
ENDIF
RETURN MEN_LIN(BOTOM)

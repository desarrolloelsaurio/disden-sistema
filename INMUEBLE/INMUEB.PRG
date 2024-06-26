* 浜様様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : INMUEB.PRG                    �
* � COMENTARIO    : DERIVA A GESTION DE INMUEBLES �
* 麺様様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                      �
* � FECHA      : 11-17-93                         �
* � HORA       : 07:47:32pm                       �
* � COPYRIGHT  : 1993 by GREGORIO REINER          �
* 藩様様様様様様様様様様様様様様様様様様様様様様様�
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
 
I_DIJO=ALLTRIM(PROMPT())
ULPR=PROGRAM()
=CABPAN1()
STORE .T. TO M.AFUTURO
=OPCIU()
=OPINM()
=OPPRP()
=OPEST()
=OPTIP()
DO CASE
CASE I_DIJO="Datos Administrativos"
   DO INM_DAT.SPR WITH .T.
CASE I_DIJO="N�meros Impositivos"
   DO INM_IMP.SPR WITH .F.,.F.,.F.,.F.,.F.,.T.
CASE I_DIJO="Legajo"
   DO INM_LEG.SPR WITH .F.,.F.,.F.,.F.,.F.,.T.
CASE I_DIJO="Listados de Control"
   respuesta='LINMX#4#40#Gesti�n de Listados de Control Inmuebles#3;
#\<Sin N�meros Impositivos;
#\<N�meros Impositivos Incorrectos;
#-;
#Control 100 % - \<Inmobliliario;
#Control 100 % - \<Municipal;
#Control 100 % - \<Dipos'
   RESPUESTA=RESPUESTA+';
#-;
#Por Partida - Inmo\<biliario;
#Por Partida - Municip\<al;
#Por Partida - Dip\<os'
   =DEFPOP()
   ON SELE POPU LINMX DO LINMX
   ACTI POPU LINMX
   RELE POPU LINMX
   ULPR=HORA_ULP(PROGRAM())
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LINMX
LI_DIJO=ALLT(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE LI_DIJO="Sin N�meros Impositivos"
   =WORKING()
   =DOTALK()
   TMP=GENTMP()
   TMP1=GENTMP()
   SELE INM
   =FLOCK() .OR. FLOK()
   SORT ON CODINM TO (TMP) FOR ;
     EMPTY(DIPOC) .OR. EMPTY(INMOC) .OR. EMPTY(MUNIC) .OR. ;
     EMPTY(DIPOS) .OR. EMPTY(INMOBILIAR) .OR. EMPTY(MUNICIPAL)
   UNLO IN INM
   =PRXAREA(.T.)
   USE (TMP) ALIAS TMP EXCL
   REPL ALL LEGAJO WITH ""
   PACK
   TT="Inmuebles sin N� Impositivos"
   ACLA=PAIP+;
     PADC("CODIGO",10)+;
     PAIP+;
     PADC("INMUEBLE",20)+;
     PAIP+;
     "INMO C"+PAIP+"MUNI C"+PAIP+"DIPO C"+PAIP+;
     "INMO R"+PAIP+"MUNI R"+PAIP+"DIPO R"+PAIP
   =XPRN1(4,"TMP","LINM6()","","LINMSNUI")
   =UNWORK()
   =UNTALK()
   =OFF_TMP()
CASE LI_DIJO="N�meros Impositivos Incorrectos"
   =WORKING()
   =DOTALK()
   TMP=GENTMP()
   TMP1=GENTMP()
   SELE INM
   =FLOCK() .OR. FLOK()
   COPY TO (TMP)
   UNLO IN INM
   =PRXAREA(.T.)
   USE (TMP) ALIAS TMP EXCL
   DELE FOR EMPTY(inmoc) .or. empty(dipoc) .or. empty(munic)
   REPL ALL LEGAJO WITH ""
   PACK
   REPL MUNICIPAL WITH LEFT(MUNICIPAL,AT("/",MUNICIPAL)-1) FOR !EMPTY(AT("/",MUNICIPAL))
   REPL DIPOS WITH LEFT(DIPOS,AT("/",DIPOS)-1) FOR !EMPTY(AT("/",DIPOS))
   REPL INMOBILIAR WITH LEFT(INMOBILIAR,AT("/",INMOBILIAR)-1) FOR !EMPTY(AT("/",INMOBILIAR))
   REPL ALL INMOBILIAR WITH CHRTRAN(INMOBILIAR,"-","/")
   REPL ALL MUNICIPAL WITH CHRTRAN(MUNICIPAL,"-","/")
   REPL ALL DIPOS WITH CHRTRAN(DIPOS,"-","/")
   SORT ON CODINM TO (TMP1) FOR ;
     !(ALLTRIM(DIPOS) $ DIPOC) .OR. ;
     !(ALLTRIM(MUNICIPAL) $ MUNIC) .OR. ;
     !(ALLTRIM(INMOBILIAR) $ INMOC)
   =PRXAREA(.T.)
   USE (TMP1) ALIAS TMP1 EXCL
   TT="Inmuebles con Diferencias en N� Impositivos"
   ACLA=PAIP+;
     PADC("CODIGO",10)+;
     PAIP+;
     PADC("INMUEBLE",40)+;
     PAIP+;
     "INMO OK"+PAIP+"MUNI OK"+PAIP+"DIPO OK"+PAIP
   =XPRN1(4,"TMP1","LINM5()","","LINMXNIM")
   =UNWORK()
   =UNTALK()
   =OFF_TMP()
CASE left(LI_DIJO,13)="Control 100 %"
   =WORKING()
   =DOTALK()
   SELE INM
   TMP=GENTMP()
   =FLOCK() .OR. FLOK()
   SORT ON CODINM TO (TMP) FOR ;
     (RECDIP .AND. PORDIP#100) .OR. ;
     (RECINM .AND. PORINM#100) .OR. ;
     (RECMUN .AND. PORMUN#100)
   =UNLO_PRX("INM",TMP)
   TMP1=GENTMP()
   DO CASE
   CASE "nmob" $ LI_DIJO
      TTIM="Inmobiliario"
      COND1="PORINM=100"
      VAR_TOTAL="INMOC"
      VAR_IMPR="PORINM"
   CASE "unic" $ LI_DIJO
      TTIM="Municipal"
      COND1="PORMUN=100"
      VAR_TOTAL="MUNIC"
      VAR_IMPR="PORMUN"
   OTHERWISE
      TTIM="D.I.P.O.S."
      VAR_TOTAL="DIPOC"
      COND1="PORDIP=100"
      VAR_IMPR="PORDIP"
   ENDCASE
   INDEX ON &VAR_TOTAL TAG IMPU
   SET ORDER TO TAG IMPU
   TOTAL ON &VAR_TOTAL TO (TMP1) FIELD PORDIP,PORMUN,PORINM
   =UNLO_PRX(.F.,TMP1,"TMP1")
   DELE FOR EVAL(COND1)
   PACK
   TT="Listado de Control Inmuebles"+;
     crlf+;
     "Control 100 % "+ttim
   VAR_IMPR="STR("+VAR_IMPR+","+STR(XACDIGI)+",2)"
   ACLA=PAIP+;
     PADC("DOMICILIO",40)+;
     PAIP+;
     PADC("PORCENTAJE",XACDIGI)+;
     PAIP
   =XPRN1(4,"TMP1","LINM7()","","LINMC100")
   =UNTALK()
   =UNWORK()
   =OFF_TMP()
CASE left(LI_DIJO,11)="Por Partida"
   DO WHILE .T.
      IF ELIINM("a Listar",-1,1)
         TMP=GENTMP()
         DO CASE
         CASE "nmob" $ LI_DIJO
            POSIT="INM.INMOC='"+INM.INMOC+"'"
            tt1="Inmobiliario"
            TT2=INM.INMOC
            TX1="INMOC"
            TX2="INMOBILIAR"
            TX3="STR(PORINM,XACDIGI,2)"
         CASE "unic" $ LI_DIJO
            POSIT="INM.MUNIC='"+INM.MUNIC+"'"
            tt1="Municipal"
            TT2=INM.MUNIC
            TX1="MUNIC"
            TX2="MUNICIPAL"
            TX3="STR(PORMUN,XACDIGI,2)"            
         OTHERWISE
            POSIT="INM.DIPOC='"+INM.DIPOC+"'"
            tt1="D.I.P.O.S."
            TT2=INM.DIPOC
            TX1="DIPOC"
            TX2="DIPOS"
            TX3="STR(PORDIP,XACDIGI,2)"            
         ENDCASE
         =WORKING()
         =DOTALK()
         SELE INM
         =FLOCK() .OR. FLOK()
         SORT ON CODINM FOR EVAL(POSIT) TO (TMP)
         =UNLO_PRX("INM",TMP)
         ACLA=PAIP+PADC("CODINM",10)+PAIP+;
           PADC("DOMICILIO",30)+PAIP+;
           PADC("PARCIAL",15)+PAIP+;
           PADC("PORCENTAJE",XACDIGI)+PAIP
         TT="Listado de Inmuebles"+;
           crlf+;
           "Partida "+tt1+":"+tt2
         =XPRN1(4,"TMP","LINM8()",TT2,"LINMPAR",.T.)
      ELSE
         EXIT
      ENDIF
      =UNTALK()
      =UNWORK()
      =OFF_TMP()
   ENDDO
ENDCASE
RETURN MEN_LIN(BOTOM)

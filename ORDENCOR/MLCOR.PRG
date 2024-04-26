PROCEDURE MLCOR
PARAMETER PPA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
 
LI_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LI_DIJO='Resultado'
   RESPUESTA='LRESU#4#45#Listado de Resultado O.C.#3;
#\<Completo;
#\<Un Art¡culo;
#\<Agrupado por Articulo;
#Un \<Rubro;
#Agrupado por Ru\<bro'
   =DEFPOP()
   ON SELE POPU LRESU DO RENDCOR
   ACTI POPU LRESU
   RELE POPU LRESU
   ULPR=HORA_ULP(PROGRAM())
CASE LI_DIJO='Listados Comunes'
   DO LCOR
CASE LI_DIJO='Ordenes de corte de la semana'
   STORE {} TO M.FECINI,FECFIN
   =ENTRE_FE("a Listar")
   if last()#27
      =WORKING()
      =DOTALK()
      =OPFAB()
      =OPCOR()
      SELE COR
      SET ORDER TO TAG NUMERO
      SELE FAX
      SET RELA TO NUMERO INTO COR
      =FLOCK("FAX") .OR. FLOK("FAX")
      TMP=GENTMP()
      SORT ON COR.ARTICULO,NUMERO ;
        TO (TMP) ;
        FOR SF>fecini .AND. ;
        SF<fecfin
      UNLO IN FAX
      SET RELA OFF INTO COR
      =OPTAL()
      =OPPRC()
      =OPFAB()
      SET ORDER TO
      SET ORDER TO TAG PRCCOD IN PRC
      =PRXAREA(.T.)
      USE (TMP) ALIAS TMP EXCL
      SET RELA TO NUMERO INTO COR
      SET RELA TO PRC INTO PRC ADDI
      STORE 0 TO ELREG
      SELE TMP
      SCAN
         IF "COR" $ PRC.PROCFAB
            STORE ELREG+1 TO ELREG
            WAIT "REGISTROS:"+ALLTRIM(STR(ELREG)) WIND NOWA
         ELSE
            DELE
         ENDIF
      ENDSCAN
      =WCL()
      PACK
      ACLA=PAIP+;
        PADC("O. CORTE",10)+;
        PAIP+;
        PADC("F. GEN",8)+;
        PAIP+;
        PADC("F. COR",8)+;
        PAIP+;
        PADC("ARTICULO",10)+;
        PAIP+;
        PADC("CANTIDAD",XACDIGI)+;
        PAIP+;
        PADC("TALLER DE CONFECCION",30)+;
        PAIP
      TT="Cortes entre el "+dtoc(fecini)+" y el "+dtoc(fecfin-1)
      =UNTALK()
      =UNWORK()
      EXTERNAL PROCEDURE LCORSEMP
      EXTERNAL PROCEDURE LCORSEMI
      =XPRN3(2,"LCORSEMP()","LCORSEMI()")
      =OFF_TMP()
   ENDIF
CASE LI_DIJO='Cortes por Color'
EXTERNAL PROCEDURE LCOCOL
   store {} to m.fecini,m.fecfin
   if entre_fe("a Listar")
      =WORKING()
      =DOTALK()
      =opcor()
      sele cor
      set order to
      tmpcor=gentmp()      
      =flock() .or. flok()
      sort on articulo to (tmpcor) for betw(cor.fechafab,m.fecini,m.fecfin)
      =unlo_prx("cor",tmpcor,"tmpcor")
      index on numero tag numero
      SET ORDER TO TAG NUMERO
      sele CO1
      SET ORDER TO
      SET RELA TO NUMERO INTO TMPCOR
      tmpco1=gentmp()      
      =flock() .or. flok()
      SORT ON TMPCOR.ARTICULO,COLOR TO (TMPCO1) FOR !EMPTY(TMPCOR.NUMERO)
      =unlo_prx("co1",tmpco1,"tmpco1")      
      CREATE CURSOR TEMPORAL ;
      (COLOR C(2),;
      TEXTO C(20),;
      PANTALON N(10),;
      REMERA N(10),;
      BUZO N(10),;
      CAMISA N(10),;
      OTROS N(10) ,;
      FECHA D,;
      USUARIO C(10))
      INDEX ON COLOR TAG COLOR
      SET ORDER TO TAG COLOR
      SCAT MEMV BLAN
      SELE TMPCO1
      SET RELA TO NUMERO INTO TMPCOR
      SCAN
         IF !XSEEK(TMPCO1.COLOR,"TEMPORAL","COLOR")
            M.COLOR=TMPCO1.COLOR
            =AGRABAR("TEMPORAL")
         ENDIF
         SELE TEMPORAL
         IF SEEK(TMPCO1.COLOR)
            RUBRO=LEFT(TMPCOR.ARTICULO,3)
            DO CASE
            CASE RUBRO='001'
               REPL PANTALON WITH PANTALON+tmpco1.CANTCOR
            CASE RUBRO='003'
               REPL REMERA WITH REMERA+tmpco1.CANTCOR
            CASE RUBRO='005'
               REPL CAMISA WITH CAMISA+tmpco1.CANTCOR
            CASE RUBRO='008'
               REPL BUZO WITH BUZO+tmpco1.CANTCOR
OTHERWISE
REPL OTROS WITH OTROS+tmpco1.CANTCOR
            ENDCASE
         ENDIF
         SELE tmpco1
      ENDSCAN
      SET ORDER TO TAG SUECOD IN MIX
      SELE TEMPORAL
      SET RELA TO COLOR INTO MIX
      REPL ALL TEXTO WITH MIX.TEXTO1
      SET RELA OFF INTO MIX
      INDEX ON TEXTO TAG TEXTO
      ACLA=PAIP+;
      PADC("COLOR",20)+;
      PAIP+;
      PADC("PANTALONES",xacdigi)+;
      PAIP+;
      PADC("REMERAS",xacdigi)+;
      PAIP+;
      PADC("CAMISAS",xacdigi)+;
      PAIP+;
      PADC("BUZOS",xacdigi)+;
      PAIP+;
      PADC("OTROS",xacdigi)+;
      PAIP+;
      PADC("TOTAL",xacdigi)+;
      PAIP
      TT="Discriminaci¢n de Cortes por Color"+;
      crlf+;
      "entre el "+dtoc(m.fecini)+" y el "+dtoc(m.fecfin)
      =UNWORK()
      =UNTALK()
      =xprn1(4,"temporal","lcocol()",dtoc(m.fecini)+" y el "+dtoc(m.fecfin),;
      "LCORCOL",6)
      =OFF_TMP()
   endif
ENDCASE
RETURN MEN_LIN(BOTOM)
 
 
PROCEDURE RENDCOR
ULPR=HORA_ULP(PROGRAM())
RE_DIJO=ALLTRIM(PROMPT())
STORE {} TO M.FECINI,M.FECFIN
IF ENTRE_FE("de Inicio de Corte")
   STORE NUL TO M.CORTADOS
   =OPCOR()
   =WORKING()
   =DOTALK()
   TMP=GENTMP()
   =FLOCK() .OR. FLOK()
   SORT ON NUMERO TO (TMP) ;
     FOR BETW(FECHAINI,M.FECINI,M.FECFIN)
   =UNLO_PRX("COR",TMP,"TMP")
   DO CASE
   CASE RE_DIJO="Completo"
   ACLA=PAIP+PADC("N£mero",6)+paip+;
   PADC("Art¡culo",10)+paip+;
   PADC("Cant.",xacdigi)+paip+;
   "F. CARGA"+PAIP+;
   "F. INIC."+PAIP+;
   "F. FINAL"+PAIP+PAIP+;   
   "DIF 1"+PAIP+;
   PADC("PROM 1",XACDIGI)+PAIP+;
   "DIF 2"+PAIP+;
   PADC("PROM 2",XACDIGI)+PAIP
   
   TT="Ordenes de Corte Generadas"+;
   crlf+;
   dtoc(m.fecini)+' al '+dtoc(m.fecfin)
   DIME EL_PUCU[4]
   STORE REPL("9",XACDIGI) TO EL_PUCU
   =XPRN1(4,"TMP","LREND0()",DTOC(M.FECINI)+"-"+DTOC(M.FECFIN),"LREND",4,@EL_PUCU)
   CASE RE_DIJO="Un Art¡culo"
   CASE RE_DIJO="Agrupado por Articulo"
   CASE RE_DIJO="Un Rubro"
   CASE RE_DIJO="Agrupado por Rubro"
   ENDCASE
ENDIF
=UNTALK()
=UNWORK()
=OFF_TMP()
RETURN MEN_LIN(BOTOM)

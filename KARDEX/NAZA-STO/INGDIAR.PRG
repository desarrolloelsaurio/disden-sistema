PARAMETER FECHAFECHA,QLIS
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
STORE {} TO M.FECINI,M.FECFIN
IF ENTRE_FE("Fecha a Listar")
   =WORKING()
   =DOTALK()
   =OPREQ()
   =OPPRO()
   =OPAVIS()
   =OPTELS()
   =OPCOMS()
   =OPOTRS()
   =opkars()
   IF FECHAFECHA
      FISC="left(KARS.referencia,2)='OR' .AND. BETW(KARS.FECHA,{"+;
        DTOC(M.FECINI)+"},{"+DTOC(M.FECFIN)+"})"
   ELSE
      FISC="left(KARS.referencia,2)='OR' .AND. BETW(KARS.FECHAOP,{"+;
        DTOC(M.FECINI)+"},{"+DTOC(M.FECFIN)+"})"
   ENDIF
   DO CASE
   CASE QLIS=1
      TT1="Av¡os"
      FISC=FISC+" .AND. !EMPTY(KARS.AVICODPRO)"
   CASE QLIS=2
      TT1="Telas"
      FISC=FISC+" .AND. !EMPTY(KARS.TELCODPRO)"
   CASE QLIS=3
      TT1="Productos Terminados"
      FISC=FISC+" .AND. !EMPTY(KARS.COMCODPRO)"
   CASE QLIS=4
      TT1="Otros Productos"
      FISC=FISC+" .AND. !EMPTY(KARS.OTRCODPRO)"
      TT1="Otros Productos"
   CASE QLIS=4
      TT1="Completo"
   CASE QLIS=5
      FISC=FISC+" .AND. (!EMPTY(KARS.TELCODPRO) .OR. !EMPTY(KARS.TELCODPRO))"
      TT1="Telas y Av¡os"
   CASE QLIS=6
      FISC=FISC+" .AND. EMPTY(KARS.OTRCODPRO)"
      TT1="Telas, Av¡os y Productos Terminados"
   ENDCASE
   SET ORDER TO
   tt="Listado de Ingresos por Orden de Requerimiento"+;
     crlf+;
     IIF(FECHAFECHA,"Fecha de Alta","Fecha de Documento")+;
     " entre el "+dtoc(m.fecini)+" y el "+dtoc(m.fecfin)+;
     CRLF+;
     TT1
   TMP=GENTMP()
   SELE KARS
   =FLOCK("KARS") .OR. FLOK("KARS")
   SORT ON REFERENCIA ;
     TO (TMP) ;
     FOR &FISC
   =PRXAREA(.T.)
   USE (TMP) ALIAS TMP EXCL
   =UNTALK()
   =UNWORK()
   DO WHILE .T.
      M.PORDONDE=XPRN(4)
      DO CASE
      CASE PORDONDE=1
         STORE .T. TO M.PORPAN
      CASE PORDONDE=2
         STORE .F. TO M.PORPAN
      CASE PORDONDE=3
         STORE .T. TO M.PORPAN,M.ENASCII
      CASE PORDONDE=4
         DO XANUIM
      CASE PORDONDE=5
         =CIMP(.T.)
         LOOP
      CASE PORDONDE=6
         =CIMP(.T.)
         LOOP
      OTHERWISE
         EXIT
      ENDCASE
      ACLA=PAIP+"O.REQ"+PAIP+;
        PADC("PROVEEDOR",20)+PAIP+;
        PADC("CODIGO",IIF(PORPAN,12,15))+PAIP+;
        IIF(PORPAN,"",PADC("DESCRIPCION",30)+PAIP)+;
        PADC("C REC.",XACDIGI)+PAIP+;
        "PROMESA "+PAIP+;
        "F. ENTRE"+PAIP+;
        "DIF."+PAIP+PAIP+;
        PADC("C. PEDIDA",XACDIGI)+PAIP+;
        PADC("C. TOT.REC",XACDIGI)+PAIP+;
        PADC("DEFECTO",XACDIGI)+PAIP+;
        PADC("EXCESO",XACDIGI)+PAIP
      =IIF(PORPAN,INGDIARP(),INGDIARI())
   ENDDO
   =OFF_TMP()
ENDIF
RETURN OPKARS() .AND. MEN_LIN(BOTOM)

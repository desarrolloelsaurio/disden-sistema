FUNCTION LORP1
PARAMETER PORPAN,ELTIPO
#DEFINE PAIP   "|"                               && PAIP
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE NUL    0                                 && NUL
STORE {} TO M.FECINI,M.FECFIN
IF ENTRE_FE("a Listar")
   FISC="BETW(ORP.FECHAOP,{"+;
     DTOC(M.FECINI)+"},{"+;
     DTOC(M.FECFIN)+"})"
   TT="Listado de Ordenes de Pago"+;
     crlf+;
     "Emitidas entre el "+;
     DTOC(m.fecini)+;
     " y el "+;
     DTOC(m.fecfin)
   STORE .T. TO M.OK
   DO CASE
   CASE ELTIPO=2
      =opvia()
      set order to tag numero
      go bott
      maxvia=via.numero
      store nul to m.respuesta
      m.elnum=infic("Viaje a Listar",maxvia)
      if last()#27 .and. ;
           !empty(m.elnum)
         =XSEEK(M.ELNUM,"VIA","NUMERO")
         TT=tt+crlf+"Viaje N§ "+alltrim(str(m.elnum))+;
           " - "+;
           ALLTRIM(SAYPER(VIA.BUQUE,"BUQCOD"))
         FISC=FISC+;
           " .AND. VIAJE="+;
           ALLTRIM(STR(M.ELNUM))
      else
         STORE .F. TO M.OK
         =NOSELEC("VIAJE")
      endif
   CASE ELTIPO=3
      store nul to m.respuesta
      IF ELIPRO("a Listar",-1,1)
         TT=tt+crlf+"Proveedor:"+;
           alltrim(per.cliente)+" ("+per.codcli+")"
         FISC=FISC+;
           " .AND. PROCOD='"+;
           PER.CODCLI+"'"
      else
         STORE .F. TO M.OK
         =NOSELEC("PROVEEDOR")
      endif
   CASE ELTIPO=4
      store nul to m.respuesta
      =OPGAS()
      IF ELIGAS("a Listar",-1,1)
         TT=tt+crlf+"Cuenta:"+;
           alltrim(mix.texto1)+" ("+left(mix.texto2,11)+")"
         FISC=FISC+;
           " .AND. GASTO='"+;
           LEFT(MIX.TEXTO2,11)+"'"
      ELSE
         STORE .F. TO M.OK
         =NOSELEC("CUENTA")
      endif
      CASE ELTIPO=5
         TT=tt+crlf+"Reposici¢n de Caja"
         FISC=FISC+;
           " .AND. empty(VIAJE)"
   ENDCASE
   IF M.OK
      =OPPRO()
      =OPOPAG()
      =WORKING()
      =DOTALK()
      SELE ORP
      TMP=GENTMP()
      SORT ON NUMERO TO (TMP) FOR &FISC
      =PRXAREA(.T.)
      USE (TMP) ALIAS TMP
      ACLA=PAIP+;
        PADC("Nro O. PAGO",10)+;
        PAIP+;
        IIF(ELTIPO#2,"VIAJE"+PAIP,"")+;
        " FECHA  "+;
        PAIP+;
        IIF(ELTIPO#3,;
        PADC("COD. PROV.",10)+PAIP+IIF(PORPAN,"",PADC("PROVEEDOR",30)+PAIP),;
        "")+;
        IIF(PORPAN,"",PADC("DETALLE",30)+PAIP)+;
        IIF(ELTIPO#4,PADC("IMPUTACION",11)+PAIP,"")+;
        PADC("MONTO",XACDIGI)+;
        PAIP
      =UNTALK()
      =UNWORK()
      =LGRL2(PORPAN,"TMP","LORP10()","","LORP1",.T.,"999,999,999.99")
      =OFF_TMP()
   ENDIF
ELSE
   =NOSELEC("FECHA")
ENDIF
RETURN MEN_LIN(BOTOM)

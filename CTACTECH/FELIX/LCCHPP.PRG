#DEFINE PAIP   "|"                               && PAIP
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
PROCEDURE LCCHPP
PARAMETER PORPAN,ELTIPO
=OPBAN()
=OPPRO()
=OPCHP()
STORE NUL TO M.RESPUESTA
IF ELIBAN("a Listar",-1,1)
   FISC="CHP.BANCO="+ALLTRIM(STR(MIX.NU1))
   TT="Cheques Emitidos"+;
     CRLF+;
     "Banco:"+alltrim(mix.texto2)
   STORE {} TO M.FECINI,M.FECFIN
   IF ENTRE_FE("de Emisi¢n a Listar")
      FISC=FISC+;
        " .AND. BETW(CHP.FECHAEM,{"+;
        DTOC(M.FECINI)+;
        "},{"+;
        DTOC(M.FECFIN)+;
        "})"
      TT=TT+;
        CRLF+;
        "Fecha de Emisi¢n entre el "+;
        dtoc(m.fecini)+" y el "+dtoc(m.fecfin)
      STORE .T. TO M.OK
      DO CASE
      CASE ELTIPO=2
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
      ENDCASE
      IF M.OK
         TMP=GENTMP()
         SELE CHP
         SORT ON FECHAVE TO (TMP) for &fisc
         =PRXAREA(.T.)
         USE (TMP) ALIAS TMP
         ACLA=PAIP+;
           "F. EMIS."+;
           PAIP+;
           "F. VENC."+;
           PAIP+;
           padc("NUMERO",14)+;
           PAIP+;
           PADC("PROVEEDOR",IIF(PORPAN,10,30))+;
           PAIP+;
           PADC("MONTO",XACDIGI)+;
           PAIP
         =LGRL2(PORPAN,"TMP","LCCHPP0()","","LCCHP",.T.,"999,999,999.99")
         =OFF_TMP()
      ENDIF
   ELSE
      =NOSELEC("FECHA")
   ENDIF
ELSE
   =NOSELEC("BANCO")
ENDIF
RETURN MEN_LIN(BOTOM)

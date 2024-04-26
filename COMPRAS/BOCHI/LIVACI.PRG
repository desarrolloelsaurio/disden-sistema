PROCEDURE LIVACI
* LISTA IVA COMPRAS
PARAMETER BLANCO,PORPAN, UNCLI
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
=oppro()
=opmix()
=OPPRO()
=OPFAR()
IF BLANCO
      testo=mesanio("Mes a Listar",.T.)
     MES_OK=LEFT(TESTO,2)
     ANO_OK=RIGHT(TESTO,4) 
     MESN_OK=VAL(MES_OK)
   ANON_OK=VAL(ANO_OK)
   =WORKING()
   =DOTALK()
   TT1="FACTURAS DE COMPRA / IVA SIN CERRAR"
   tt="LISTADO DE FACTURAS DE COMPRA"
   tmp=gentmp()
   =FLOCK() .OR. FLOK()
   SELE FAR
   SET ORDER TO
   FECHAMAX=gomonth(arma_fec(1,mesn_ok,anon_ok),1)
   SORT ON FECHAEM TO (TMP) FOR EMPTY(MES) .AND. FECHAEM<FECHAMAX
   ******
   ******    modif. 2-10-96
   ******    set orde to gascod in mix
   ******    set rela to gasto into mix
   ******    tmp2=gentmp()
   ******    SORT ON  mix.nu1 TO (TMP2) FOR EMPTY(MES)
   ******    set rela to
   ******    sele 0
   ******    use (tmp2) alias tmp2
   ******    set rela to gasto into mix
   ******    tmp3=gentmp()
   ******    TOTAL ON  mix.nu1 TO (TMP3)
   ******    sele tmp2
   ******    use (tmp3) alias tmp3
   ******    modif. 2-10-96
   ******
   =UNLO_PRX("FAR",TMP)
   =UNTALK()
   =UNWORK()
   IF _WINDOWS
      IF PORPAN
         REPO FORM LIVACI2 PREV
         ***         sele tmp3
         ***         REPO FORM LIVACI PREV
      ELSE
         REPO FORM LIVACI TO PRIN PROM noconsole
         ***         sele tmp3
         ***         REPO FORM LIVACI TO PRIN PROM noconsole
      ENDIF
   ELSE
      EXTERNAL PROCEDURE LIVAC00
      acla=paip+" FECHA  "+PAIP+;
        PADC("TIPO Y N§ COMPR",17)+PAIP+;
        PADC("RAZON SOCIAL",15)+PAIP+;
        PADC("COND Y N§ CUIT",20)+PAIP+;
        PADC("NETO GRAVADO",10)+PAIP+;
        PADC("CP. EXENTAS",10)+PAIP+;
        PADC("IMP. INTERNOS",10)+PAIP+;
        PADC("IVA INSCR",10)+PAIP+;
        PADC("PERCEPCION",10)+PAIP+;
        PADC("TOTAL",10)+PAIP
      TT='Listado de Facturas de Compra'+;
        crlf+;
        "IVA SIN CERRAR"
      RETURN XPRN1(4,"TMP","LIVAC00()","","LIVACSC",6,RIGHT(PICUMAX,10))
   ENDIF
   =OFF_TMP()
ELSE
   testo=mesanio("Mes a Listar",.T.)
   MES_OK=LEFT(TESTO,2)
   ANO_OK=RIGHT(TESTO,4)
   IF LAST()#27 .AND. ;
        !EMPTY(M.TESTO) .AND. ;
        !EMPTY(MES_OK) .AND. ;
        !EMPTY(ANO_OK) .and. CONFIRMA("Listar IVA COMPRAS mes de "+qmes(val(mes_ok))+" de "+ano_ok+" ",.t.,20,10)
      =relewin("win")
      SELE FAR
      =WORKING()
      =DOTALK()
      LACOSA=ZERO(VAL(MES_OK),2)+"/"+RIGHT(ANO_OK,2)
      tmp=gentmp()
      =FLOCK() .OR. FLOK()
      SELE FAR
      SET ORDER TO
      SORT ON FECHAEM TO (TMP) FOR MES=LACOSA
      =UNLO_PRX("FAR",TMP)
      =UNTALK()
      =UNWORK()
      TT="LISTADO DE FACTURAS DE COMPRA"
      TT1=QMES(VAL(MES_OK))+" DE "+ANO_OK
      IF _WINDOWS
         IF PORPAN
            REPO FORM LIVACI2 PREV
         ELSE
            REPO FORM LIVACI TO PRIN PROM noconsole
         ENDIF
      ELSE
         acla=paip+" FECHA  "+PAIP+;
           PADC("TIPO Y N§ COMPR",17)+PAIP+;
           PADC("RAZON SOCIAL",15)+PAIP+;
           PADC("COND Y N§ CUIT",20)+PAIP+;
           PADC("NETO GRAVADO",10)+PAIP+;
           PADC("CP. EXENTAS",10)+PAIP+;
           PADC("IMP. INTERNOS",10)+PAIP+;
           PADC("IVA INSCR",10)+PAIP+;
           PADC("PERCEPCION",10)+PAIP+;
           PADC("TOTAL",10)+PAIP
         tt="Listado de Facturas de Compra"+;
           crlf+;
           qmes(val(mes_ok))+" de "+ano_ok
         RETURN XPRN1(4,"TMP","LIVAC00()","","LIVACSC",6,RIGHT(PICUMAX,10))
      ENDIF
   ELSE
      =NOSELEC("MES A LISTAR")
   ENDIF
   =OFF_TMP()
ENDIF
RETURN relewin("win")

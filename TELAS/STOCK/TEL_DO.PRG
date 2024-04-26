#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE NUL    0                                 && NUL
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX
#DEFINE PAIP   "|"                               && PAIP
#DEFINE FOLC  ".F."                              && FOLC
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
FUNCTION TEL_DO
DO CASE
CASE COD_HACER=1	&& LISTADO DE ARTICULOS QUE CONTIENEN ACCESORIO
   =LDESNA("T")
CASE COD_HACER=2	&& LISTADO DE LAS O.C. QUE TIENEN RESERVA DEL TELA
   =WORKING()
   =DOTALK()
   TMP=GENTMP()
   SELE RPV
   SET ORDER TO
   =FLOCK() .OR. FLOK()
   SORT ON TELCODPRO,NUMERO TO (TMP) FOR TELCODPRO=TELS.TELCODPRO .AND. !DELE()
   =UNLO_PRX("RPV",TMP)
   =UNTALK()
   =UNWORK()
   CASO="Tela:"+alltrim(TELs.TELcodpro)+" - "+ALLTRIM(TELs.TELA)
   TT="Listado de Reservas"+;
   CRLF+;
   CASO
   ACLA=PAIP+;
   PADC("N§ CORTE",10)+;
   PAIP+;
   PADC("ARTICULO",10)+;
   PAIP+;
   PADC("DESCRIPCION",30)+;
   PAIP+;
   PADC("RESERVA",XACDIGI)+;
   PAIP
   =XPRN1(4,"TMP","LRPV0(1)",UPPER(CASO),"LRPVT",.T.)   
   =OFF_TMP()
CASE COD_HACER=3	&& listado de hermanos
   =DOTALK()
   =WORKING()
   M.LAMADRE=TELS.MADRE
   SELE TELS
   TMP=GENTMP()
   =FLOCK() .OR. FLOK()
   SORT ON TELA TO (TMP) FOR MADRE=M.LAMADRE
   =UNLO_PRX("TELS",TMP)
   =XSEEK(M.LAMADRE,"TMA","CODMADRE")
      TT="Listado de Hijos"+;
        CRLF+;
        alltrim(tma.telmadre)+" ("+ALLTRIM(Tma.codmadre)+")"
   ACLA=PAIP+PADC("CODIGO",20)+PAIP+;
     PADC("DESCRIPCION",40)+PAIP+;
     PADC("PROVEEDOR",15)+PAIP
   =XPRN1(4,"TMP","LTMA1()","HERMANOS DE"+TELS.TELCODPRO,"LTMAHE")
   =OFF_TMP()
   =UNWORK()
   =UNTALK()
ENDCASE

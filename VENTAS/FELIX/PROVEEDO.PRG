PROCEDURE PROVEEDO
#DEFINE BOTOM  "  "+repl("�",78)              && BOTOM
#DEFINE CRLF CHR(13)+CHR(10)                  && CRLF
=CABPAN1()
ULPR=HORA_ULP(PROGRAM())
PR_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE PR_DIJO="Datos Administrativos"
   DO PRO
CASE PR_DIJO="Legajo"
   DO PRO
CASE PR_DIJO="Listado Cta. Cte."
   respuesta='LCTA#4#36#Cuenta Corriente de Proveedores#3;
#\<Un Proveedor;
#\<Resumen por Proveedor;
#-;
#Un \<Viaje;
#\<Facturas Propias;
#Una C\<uenta'
   =DEFPOP()
   ON SELE POPU LCTA DO LCTA1
   ACTI POPU LCTA
   RELE POPU LCTA
   ULPR=HORA_ULP(PROGRAM())
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LCTA1
ULPR=HORA_ULP(PROGRAM())
LC_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LC_DIJO="Un Proveedor"
   =oppro()
   =opccp()
   store nul to m.respuesta
   if elipro("a Listar",-1,1)
      tt="Proveedor:"+;
        alltrim(per.cliente)
      SELE CCP
      SET ORDER TO TAG NUMERO
      DO WHILE .T.
         M.OPTAR=XPRN(2)
         DO CASE
         CASE M.OPTAR=1
            repo form lcclp prev for procod=per.codcli
         CASE M.OPTAR=2
            =PSPECODE("72")
            PRINT
               repo form lcclp TO PRIN for procod=per.codcli ;
                 NOCONSOLE NOEJECT
            ENDP
            =RESETPR()
         ENDCASE
         IF EMPTY(M.OPTAR) .OR. M.OPTAR=3
            EXIT
         ENDIF
      ENDDO
   ENDIF
CASE LC_DIJO="Resumen por Proveedor"
   EXTERNAL PROCEDURE LCCP20.PRG
   =DOTALK()
   =WORKING()
   =oppro()
   =opccp()
   TMP=GENTMP()
   SELE PER
   SET ORDER TO TAG PROCOD
   SELE CCP
   SET ORDER TO TAG PROCOD
   TOTAL ON PROCOD FIELD GY_DEBE,GY_HABER TO (TMP)
   =PRXAREA(.T.)
   USE (TMP) ALIAS TMP
   SET RELA TO PROCOD INTO PER
   REPL ALL DETALLE WITH PER.CLIENTE FOR !EMPTY(PER.CODCLI)
   INDEX ON DETALLE TAG DETALLE
   SET ORDER TO TAG DETALLE
   TT="Resumen de Cta Cte Proveedores"
   ACLA=PAIP+;
     PADC("PROVEEDOR",30)+;
     PAIP+;
     PADC("DEBE",XACDIGI)+;
     PAIP+;
     PADC("HABER",XACDIGI)+;
     PAIP+;
     PADC("SALDO",XACDIGI)+;
     PAIP
   =UNTALK()
   =UNWORK()
   =XPRN1(4,"TMP","LCCP20()","RESUMEN CCPRO","RESCCP",3,REPL("9",XACDIGI))
   =OFF_TMP()
   =OFF_RELA()
CASE LC_DIJO="Un Viaje"
   EXTERNAL PROCEDURE LCCP10.PRG
   =opvia()
   set order to tag numero
   go bott
   maxvia=via.numero
   =oppro()
   =opccp()
   store nul to m.respuesta
   m.elnum=infic("Viaje a Listar",maxvia)
   if last()#27 .and. ;
        !empty(m.elnum)
      =working()
      =dotalk()
      TT="Cuenta Corriente de Proveedores"+;
        cRlf+;
        "Viaje N� "+alltrim(str(m.elnum))+;
        CRLF+;
        ALLTRIM(SAYPER("B"+ZERO(M.ELNUM,9),"BUQCOD"))
      SELE PER
      SET ORDER TO TAG PROCOD
      SELE CCP
      =flock() .or. flok()
      tmp=gentmp()
      sort on procod to (tmp) for numero=m.elnum
      unlo in ccp
      =prxarea(.t.)
      use (tmp) alias tmp
      SET RELA TO PROCOD INTO PER
      STORE .T. TO M.PORPAN
      STORE "" TO ACLA,ACLAPAN,ACLAPRN
      =HAZ_ACL1('paip+PADC("PROVEEDOR",30)+PAIP+;
        PADC("COMPROBANTE",17)+PAIP+;
        IIF(PORPAN,"",PADC("DETALLE",30)+PAIP)+;
        PADC("DEBE",XACDIGI)+PAIP+;
        PADC("HABER",XACDIGI)+PAIP+;
        PADC("SALDO",XACDIGI)+PAIP')
      =UNTALK()
      =UNWORK()
      =XPRN1(4,"TMP","LCCP10()","LISTADO CCP VIAJE "+ALLTRIM(STR(M.ELNUM)),"LCCPVP",3,REPL("9",XACDIGI))
      =OFF_TMP()
   endif
CASE LC_DIJO="Facturas Propias"
   =opvia()
   set order to tag numero
   go bott
   maxvia=via.numero
   =oppro()
   =opccp()
   store nul to m.respuesta
   m.elnum=0
   TT="Facturas de "+alltrim(janname)+" "
   SELE PER
   SET ORDER TO TAG PROCOD
   SELE CCP
   SET ORDER TO TAG PROCOD
   SET RELA TO PROCOD INTO PER
   DO WHILE .T.
      M.OPTAR=XPRN(2)
      =PSPECODE("72")
      PRINT
         DO CASE
         CASE M.OPTAR=1
            repo form lcclR prev for empty(numero)
         CASE M.OPTAR=2
               repo form lcclR FOR EMPTY(NUMERO) to prin noconsole NOEJECT
         ENDCASE
      ENDP
      =RESETPR()
      IF EMPTY(M.OPTAR) .OR. M.OPTAR=3
         EXIT
      ENDIF
   ENDDO
   =OFF_RELA()
CASE LC_DIJO="Una Cuenta"
   =oppro()
   =opgas()
   =opccp()
   store nul to m.respuesta
   if eligas("a Listar",-1,1)
      ELGAS=LEFT(MIX.TEXTO2,11)
      tt="Cuenta:"+;
        alltrim(mix.texto1)+"-"+ALLTRIM(MIX.TEXTO2)
      SELE CCP
      DO WHILE .T.
         M.OPTAR=XPRN(2)
         DO CASE
         CASE M.OPTAR=1
            repo form lcclp prev for gas=ELGAS
         CASE M.OPTAR=2
            =PSPECODE("72")
            PRINT
               repo form lcclp to prin noconsole NOEJECT for gas=ELGAS
               =RESETPR()
            ENDP
         ENDCASE
         IF EMPTY(M.OPTAR) .OR. M.OPTAR=3
            EXIT
         ENDIF
      ENDDO
   endif
ENDCASE
=CABPAN1()
RETURN MEN_LIN(BOTOM)

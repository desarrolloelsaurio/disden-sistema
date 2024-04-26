PROCEDURE LPEND
PARAMETER PORPAN,L_TIPO,L_FEC
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
STORE .F. TO M.PLEIN
STORE NUL TO M.ELTOT
L_QUETIPO=IIF(L_TIPO=1,"Av¡os",IIF(L_TIPO=2,"Telas","Productos Terminados"))
IF L_FEC
   M.OPCION=3
   STORE {} TO M.FECINI,M.FECFIN
   M.OPCION=ENTRE_FE("L¡mites")
ELSE
   M.OPCION=ALGUN(40,"  Orden del Listado ",;
     "Por \<Art¡culo;Por ;
\<Descripci¢n;Por ;
\<Proveedor;Por ;
\<Orden de Requerimiento;Por ;
Proveedor \<y Orden de Req.;Opciones ;
de "+L_QUETIPO)
ENDIF
IF !EMPTY(M.OPCION)
   M.OPCION=IIF(L_FEC,3,M.OPCION)
   =WORKING()
   =DOTALK()
   =OPPRO()
   #IF "NOVO" $ CURD()
   =OPMER()
   #ELSE
   =OPAVIS()
   =OPTELS()
   =OPCOMS()
   #ENDIF
   =OPREQ()
   TMP=GENTMP()
   SELE REQ
   SET ORDER TO TAG NUMERO
   SELE REQX
   SET ORDER TO TAG NUMERO
   SET RELA TO NUMERO INTO REQ
   =FLOCK() .OR. FLOK()
   TT="Informe de Ordenes de Requerimiento "+IIF(L_FEC,"Emitidas","Pendientes")
   DO CASE
   CASE L_TIPO=1
      TT=TT+CRLF+"Av¡os"+crlf+;
        "Ordenado por "+;
        IIF(M.OPCION=1 .OR. M.OPCION=6,"Art¡culo",;
        iif(m.opcion=2,"Descripci¢n",;
        iif(m.opcion=3,"Proveedor",;
        iif(m.opcion=4,"Orden de Requerimiento","Proveedor y Orden de Req."))))
      IF L_FEC
         SORT ON AVICODPRO FOR ;
           !REQ.COMPLETO .AND. ;
           !EMPTY(AVICODPRO) .AND. ;
           REQ.FECHAPROM>=M.FECINI .AND. ;
           REQ.FECHAPROM<=M.FECFIN ;
           TO (TMP)
         TT=TT+;
           CRLF+;
           "entre el "+dtoc(m.fecini)+" y el "+dtoc(m.fecfin)
      ELSE
         SORT ON AVICODPRO FOR ;
           !REQ.COMPLETO .AND. ;
           PEDIDO#RECIBIDO .AND. ;
           !EMPTY(AVICODPRO) ;
           TO (TMP)
      ENDIF
   CASE L_TIPO=2
      TT=TT+CRLF+"Telas"+;
        crlf+;
        "Ordenado por "+;
        IIF(M.OPCION=1 .OR. M.OPCION=6,"Art¡culo",;
        iif(m.opcion=2,"Descripci¢n",;
        iif(m.opcion=3,"Proveedor",;
        iif(m.opcion=4,"Orden de Requerimiento","Proveedor y Orden de Req."))))
      IF L_FEC
         SORT ON TELCODPRO FOR ;
           !REQ.COMPLETO .AND. ;
           !EMPTY(TELCODPRO) .AND. ;
           REQ.FECHAPROM>=M.FECINI .AND. ;
           REQ.FECHAPROM<=M.FECFIN ;
           TO (TMP)
         TT=TT+;
           CRLF+;
           "entre el "+dtoc(m.fecini)+" y el "+dtoc(m.fecfin)
      else
         SORT ON TELCODPRO FOR ;
           !REQ.COMPLETO .AND. ;
           PEDIDO#RECIBIDO .AND. ;
           !EMPTY(TELCODPRO) ;
           TO (TMP)
      endif
   CASE L_TIPO=3 .OR. L_TIPO=4
      TT=TT+CRLF+"Productos Terminados"+;
        IIF(L_TIPO=3," (Agrupado)","")+;
        crlf+;
        "Ordenado por "+;
IIF(M.OPCION=1 .OR. M.OPCION=6,"Art¡culo",;
iif(m.opcion=2,"Descripci¢n",;
iif(m.opcion=3,"Proveedor",;
iif(m.opcion=4,"Orden de Requerimiento","Proveedor y Orden de Req."))))
      if l_fec
         SORT ON COMCODPRO FOR ;
           !REQ.COMPLETO .AND. ;
           !EMPTY(COMCODPRO) .AND. ;
           REQ.FECHAPROM>=M.FECINI .AND. ;
           REQ.FECHAPROM<=M.FECFIN ;
           TO (TMP)
         TT=TT+;
           CRLF+;
           "entre el "+dtoc(m.fecini)+" y el "+dtoc(m.fecfin)
      else
         SORT ON COMCODPRO FOR ;
           !REQ.COMPLETO .AND. ;
           PEDIDO#RECIBIDO .AND. ;
           !EMPTY(COMCODPRO) ;
           TO (TMP)
      endif
         CASE L_TIPO=6
      TT=TT+CRLF+"Mercader¡as"+;
        crlf+;
        "Ordenado por "+;
        IIF(M.OPCION=1 .OR. M.OPCION=6,"Art¡culo",;
        iif(m.opcion=2,"Descripci¢n",;
        iif(m.opcion=3,"Proveedor",;
        iif(m.opcion=4,"Orden de Requerimiento","Proveedor y Orden de Req."))))
      IF L_FEC
         SORT ON articulo FOR ;
           !REQ.COMPLETO .AND. ;
           !EMPTY(articulo) .AND. ;
           REQ.FECHAPROM>=M.FECINI .AND. ;
           REQ.FECHAPROM<=M.FECFIN ;
           TO (TMP)
         TT=TT+;
           CRLF+;
           "entre el "+dtoc(m.fecini)+" y el "+dtoc(m.fecfin)
      else
         SORT ON articulo FOR ;
           !REQ.COMPLETO .AND. ;
           PEDIDO#RECIBIDO .AND. ;
           !EMPTY(articulo) ;
           TO (TMP)
      endif
   OTHERWISE
      TT=TT+CRLF+"Completo"
      if l_fec
         SORT ON AVICODPRO FOR ;
           !REQ.COMPLETO .AND. ;
           REQ.FECHAPROM>=M.FECINI .AND. ;
           REQ.FECHAPROM<=M.FECFIN ;
           TO (TMP)
         TT=TT+;
           CRLF+;
           "entre el "+dtoc(m.fecini)+" y el "+dtoc(m.fecfin)
      else
         SORT ON AVICODPRO FOR ;
           !REQ.COMPLETO .AND. ;
           PEDIDO#RECIBIDO ;
           TO (TMP)
      endif
   ENDCASE
   =PRXAREA(.T.)
   USE (TMP) ALIAS TMP
   #IF "NOVO" $ CURD()
   REPL AVICODPRO WITH ARTICULO FOR !EMPTY(ARTICULO)
   #ELSE
   REPL AVICODPRO WITH TELCODPRO FOR !EMPTY(TELCODPRO)
   REPL AVICODPRO WITH COMCODPRO FOR !EMPTY(COMCODPRO)
   #ENDIF
   DO CASE
   CASE M.OPCION=1
      INDEX ON AVICODPRO+DTOC(REQ.FECHAPROM) TAG AVICODPRO
   CASE M.OPCION=2
      DO CASE
      CASE L_TIPO=1
         SET ORDER TO TAG AVICODPRO IN AVIS
         SET RELA TO AVICODPRO INTO AVIS ADDI
         INDEX ON AVIS.AVIO+DTOC(REQ.FECHAPROM) TAG AVICODPRO
      CASE L_TIPO=2
         SET ORDER TO TAG TELCODPRO IN TELS
         SET RELA TO TELCODPRO INTO TELS ADDI
         INDEX ON TELS.TELA+DTOC(REQ.FECHAPROM) TAG AVICODPRO
      CASE L_TIPO=3 .or. ;
           L_TIPO=4
         SET ORDER TO TAG COMCODPRO IN COMS
         SET RELA TO COMCODPRO INTO COMS ADDI
         INDEX ON COMS.COMPRA+DTOC(REQ.FECHAPROM) TAG AVICODPRO
      ENDCASE
   CASE M.OPCION=3 .or. M.OPCION=5
      SET ORDER TO TAG PROCOD IN PER
      DO CASE
      CASE L_TIPO=1
         SELE AVIS
         SET ORDER TO TAG AVICODPRO
         SET RELA TO PROCOD INTO PER ADDI
         SELE TMP
         SET RELA TO AVICODPRO INTO AVIS ADDI
         IF M.OPCION=3
            INDEX ON PER.CLIENTE+AVIS.AVIO+DTOC(REQ.FECHAPROM) TAG AVICODPRO
         ELSE
            INDEX ON PER.CLIENTE+str(numero) TAG AVICODPRO
         ENDIF
         IF L_FEC
            REPL ALL USUARIO WITH AVIS.PROCOD
         ENDIF
      CASE L_TIPO=2
         SELE TELS
         SET ORDER TO TAG TELCODPRO
         SET RELA TO PROCOD INTO PER ADDI
         SELE TMP
         SET RELA TO TELCODPRO INTO TELS ADDI
         IF M.OPCION=3
            INDEX ON PER.CLIENTE+TELS.TELA+DTOC(REQ.FECHAPROM) TAG AVICODPRO
         ELSE
            INDEX ON PER.CLIENTE+str(numero) TAG AVICODPRO
         ENDIF
         IF L_FEC
            REPL ALL USUARIO WITH TELS.PROCOD
         ENDIF
      CASE L_TIPO=3 .or. ;
           L_TIPO=4
         SELE COMS
         SET ORDER TO TAG COMCODPRO
         SET RELA TO PROCOD INTO PER ADDI
         SELE TMP
         SET RELA TO COMCODPRO INTO COMS ADDI
         IF M.OPCION=3
            INDEX ON PER.CLIENTE+COMS.COMPRA+DTOC(REQ.FECHAPROM) TAG AVICODPRO
         ELSE
            INDEX ON PER.CLIENTE+str(numero) TAG AVICODPRO
         ENDIF
         IF L_FEC
            REPL ALL USUARIO WITH COMS.PROCOD
         ENDIF
      OTHERWISE
         * CARGO EN USUARIO EL PROVEEDOR DE COMPRAS
         SELE COMS
         SET ORDER TO TAG COMCODPRO
         SET RELA TO PROCOD INTO PER
         SELE TMP
         SET RELA TO COMCODPRO INTO COMS
         REPL USUARIO WITH PER.CODCLI FOR !EMPTY(TMP.COMCODPRO)
         * CARGO EN USUARIO EL PROVEEDOR DE TELAS
         SELE TELS
         SET ORDER TO TAG TELCODPRO
         SET RELA TO PROCOD INTO PER
         SELE TMP
         SET RELA TO TELCODPRO INTO TELS
         REPL USUARIO WITH PER.CODCLI FOR !EMPTY(TMP.TELCODPRO)
         * CARGO EN USUARIO EL PROVEEDOR DE AVIOS
         SELE AVIS
         SET ORDER TO TAG AVICODPRO
         SET RELA TO PROCOD INTO PER
         SELE TMP
         SET RELA TO AVICODPRO INTO AVIS
         REPL USUARIO WITH PER.CODCLI FOR EMPTY(USUARIO)
         SET RELA TO USUARIO INTO PER
         IF M.OPCION=3
            INDEX ON PER.CLIENTE+AVIS.AVIO+DTOC(REQ.FECHAPROM) TAG AVICODPRO
         ELSE
            INDEX ON PER.CLIENTE+str(numero) TAG AVICODPRO
         ENDIF
      ENDCASE
   CASE M.OPCION=4
      INDEX ON str(numero)+AVICODPRO TAG AVICODPRO
   CASE M.OPCION=6
      DO CASE
      CASE L_TIPO=1
         INDEX ON AVICODPRO TAG AVICODPRO
         STORE TT TO TT_ANT
         STORE "" TO FISC,TT
         DO QUERYAVI.spr with .T.,.T.,.F.," L¡mites del Listado de Pendientes ","",.T.
         IF !EMPTY(FISC)
            =OFF_RELA()
            SELE AVIS
            SET ORDER TO TAG AVICODPRO
            SELE TMP
            SET RELA TO AVICODPRO INTO AVIS
            DELE ALL
            SET DELE OFF
            RECA FOR &FISC
            SET DELE ON
            TT=TT_ANT+;
              TT
         ELSE
            =NOSELEC("LIMITES DE AVIOS")
         ENDIF
      CASE L_TIPO=2
         INDEX ON AVICODPRO TAG AVICODPRO
         STORE TT TO TT_ANT
         STORE "" TO FISC,TT
         DO QUERYTEL.spr with .T.,.T.,.F.," L¡mites del Listado de Pendientes ","",.T.
         IF !EMPTY(FISC)
            =OFF_RELA()
            SELE TELS
            SET ORDER TO TAG TELCODPRO
            SELE TMP
            SET RELA TO AVICODPRO INTO TELS
            DELE ALL
            SET DELE OFF
            RECA FOR &FISC
            SET DELE ON
            TT=TT_ANT+;
              TT
         ELSE
            =NOSELEC("LIMITES DE TELAS")
         ENDIF
	CASE L_TIPO=3 .OR. L_TIPO=4
         INDEX ON AVICODPRO TAG AVICODPRO
         STORE TT TO TT_ANT
         STORE "" TO FISC,TT
         DO QUERYCOM.spr with .T.,.T.,.F.," L¡mites del Listado de Pendientes ","",.T.
         IF !EMPTY(FISC)
            =OFF_RELA()
            SELE COMS
            SET ORDER TO TAG COMCODPRO
            SELE TMP
            SET RELA TO AVICODPRO INTO COMS
            DELE ALL
            SET DELE OFF
            RECA FOR &FISC
            SET DELE ON
            TT=TT_ANT+;
              TT
         ELSE
            =NOSELEC("LIMITES DE PRODUCTOS TERMINADOS")
         ENDIF
      ENDCASE
   ENDCASE
   =OFF_RELA()
   SELE TMP
   SET ORDER TO TAG AVICODPRO
   SET RELA TO NUMERO INTO REQ
   =UNWORK()
   =UNTALK()
   ACLA=PAIP+;
     PADC("O. REQ.",IIF(PORPAN,6,10))+PAIP+;
     PADC("ARTICULO",20)+PAIP+;
     IIF(PORPAN,"",PADC("DESCRIPCION",30)+PAIP)+;
     IIF(L_FEC,"",PADC("PROVEEDOR",IIF(PORPAN,15,30))+PAIP)+;
     "F. PROM."+PAIP+;
     PADC("PEDIDO",XACDIGI)+PAIP+;
     PADC("RECIBIDO",XACDIGI)+PAIP+;
     PADC("PENDIENTE",XACDIGI)+PAIP+;
     IIF(ESJEFE(2),PADC("MONTO",XACDIGI)+PAIP+;
     IIF(l_fec,PADC("M.PEND",XACDIGI)+PAIP,""),"")
   IF L_TIPO=3
      GO TOP
      STORE COMCODPRO TO M.ELCOD
      STORE ELTEX() TO M.ELTEX
      STORE SAYPER(REQ.PROCOD,"PROCOD") TO M.ELPRO
      STORE REQ.FECHAPROM TO M.LAPROM
      STORE NUL TO M.TPEDIDO,M.TRECIBIDO,M.TMONTO
      STORE NUMERO TO M.ELNUM
      =IIF(PORPAN,LPENDCP(),LPENDCI())
   ELSE
      IF PORPAN
         DO CASE
         CASE L_FEC
            TTANT=TT
            DO LPENDFP
            ACLA=PAIP+;
              PADC("C. PROV.",10)+;
              PAIP+;
              PADC("PROVEEDOR",30)+;
              PAIP+;
              PADC("Ctd. PEND",XACDIGI)+;
              PAIP+;
              PADC("M. PEDIDO",XACDIGI)+;
              PAIP+;
              PADC("M. PEND",XACDIGI)+;
              PAIP
            TT=TTANT
            DO LPENDFP WITH .T.
         OTHER
            =LGRLP("TMP","LPEND1()","INF. PENDIENTE","LPENDI")
         ENDCASE
      ELSE
         DO CASE
         CASE L_FEC
            TTANT=TT
            DO LPENDFI
            TT=TTANT
            ACLA=PAIP+;
              PADC("C. PROV.",10)+;
              PAIP+;
              PADC("PROVEEDOR",30)+;
              PAIP+;
              PADC("Ctd. TOTAL",XACDIGI)+;
              PAIP+;
              PADC("Mto. TOTAL",XACDIGI)+;
              PAIP+;
              PADC("Mto. PEND.",XACDIGI)+;
              PAIP
            DO LPENDFI WITH .T.
         OTHER
            =LGRLI("TMP","LPEND1()","INF. PENDIENTE","LPENDI")
         ENDCASE
      ENDIF
   ENDIF
   =OFF_TMP()
   =OFF_RELA()
ELSE
   =NOSELEC("ORDEN DEL LISTADO")
ENDIF
RETURN MEN_LIN(BOTOM)

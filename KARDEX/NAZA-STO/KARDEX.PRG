* DERIVA A OPERACIONES DE KARDEX
* KARDEX.PRG
* 20/90/95
PROCEDURE KARDEX
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE PAIP   "|"                               && PAIP

EXTERNAL PROCEDURE LDEVPR0.PRG
KR_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE KR_DIJO="C.I.D."
   RESPUESTA="GECID#6#25#Men£ de Gesti¢n de C.I.D.#3;
#\<Ajuste de Stock;
#Telas al \<Corte;
#Te\<las p/Prototipos;
#A\<v¡os p/Prototipos;
#Av¡\<os a Dise¤o"
   RESPUESTA=RESPUESTA+";
#\<Devoluci¢n de Restos;
#Devoluci¢n de \<Talleres;
#\<Reserva;
#\<Entrega de Otros Productos;
#-;
#Listados;
#-;
#Reinde\<xa"
   =DEFPOP()
   ON SELE POPU GECID DO GECID
   ACTI POPU GECID
   RELE POPU GECID
CASE KR_DIJO="Remitos"
   RESPUESTA="REMTOS#6#25#Men£ de Gesti¢n de Remitos#3;
#\<Emisi¢n de Remitos;
#\<Anula Remito;
#Solicit\<ud Devoluci¢n;
#-;
#\<Modifica Av¡os;
#Modifica \<Talleres;
#-;
#\<Listados;
#\<Restaura Datos Pend en Talleres"
   =DEFPOP()
   ON SELE POPU REMTOS DO REMTOS
   ACTI POPU REMTOS
   RELE POPU REMTOS
CASE KR_DIJO="Kardex"
   RESPUESTA="KRDX#4#35#Men£ de Gesti¢n de Kardex#3;
#Un \<Av¡o;
#Una \<Tela;
#Un \<Producto Terminado;
#\<Otro Producto;
#-;
#Una Orden de \<Corte;
#Un \<Remito;
#Un C.\<I.D.;
#Ordenes de Re\<querimiento"
   =DEFPOP()
   ON SELE POPU KRDX DO KRDX
   ACTI POPU KRDX
   RELE POPU KRDX
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE GECID
CID_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE CID_DIJO="Reindexa"
   =xcid()
CASE CID_DIJO="Ajuste de Stock"
   RESPUESTA="AJSTK#8#35#Men£ de Ajuste de Stock#3;
#\<Av¡os;
#\<Telas;
#\<Productos Terminados;
#\<Otros Productos"
   =DEFPOP()
   ON SELE POPU AJSTK DO AJSTK
   ACTI POPU AJSTK
   RELE POPU AJSTK
CASE CID_DIJO="Telas al Corte"
   DO CID.spr WITH .F.,.T.," TELAS AL CORTE ",2,"T"
CASE CID_DIJO="Telas p/Prototipos"
   DO CID.spr WITH .F.,.T.," PROTOTIPOS ",3,"T"
CASE CID_DIJO="Av¡os p/Prototipos"
   DO CID.spr WITH .F.,.T.," AVIOS P/PROTOTIPOS ",7,"A"
CASE CID_DIJO="Av¡os a Dise¤o"
   DO CID.spr WITH .F.,.T.," AVIOS A DISE¥O ",8,"A"
CASE CID_DIJO="Devoluci¢n de Restos"
   DO CID.spr WITH .F.,.T.," DEVOLUCION DE RESTOS ",4,"T"
CASE CID_DIJO="Devoluci¢n de Talleres"
   RESPUESTA="DEVTAL#10#45#Devoluci¢n de Talleres#3;
#\<Av¡os;
#\<Telas"
   =DEFPOP()
   ON SELE POPU DEVTAL DO DEVTAL
   ACTI POPU DEVTAL
   RELE POPU DEVTAL
CASE CID_DIJO="Reserva"
   RESPUESTA="RESERV#10#45#Reserva de Telas#3;
#\<Reserva;
#\<Anulaci¢n de Reserva"
   =DEFPOP()
   ON SELE POPU RESERV DO RESERV
   ACTI POPU RESERV
   RELE POPU RESERV
CASE CID_DIJO="Entrega de Otros Productos"
   DO CID.spr WITH .F.,.T.," ENTRGA DE OTROS PRODUCTOS ",10,"O"
CASE CID_DIJO="Listados"
   RESPUESTA="LCIDX#12#55#Listado de C.I.D. por Impresora#3;
#\<Reimprime C.I.D.;
#\<Listados Comunes"
   =DEFPOP()
   ON SELE POPU LCIDX DO LCIDX
   ACTI POPU LCIDX
   RELE POPU LCIDX
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE AJSTK
AJ_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE AJ_DIJO="Av¡os"
   DO CID.spr WITH .F.,.T.," AJUSTES DE STOCK AVIOS ",1,"A"
CASE AJ_DIJO="Telas"
   DO CID.spr WITH .F.,.T.," AJUSTES DE STOCK TELAS ",1,"T"
CASE AJ_DIJO="Productos Terminados"
   DO CID.spr WITH .F.,.T.," AJUSTES DE STOCK PRODUCTOS TERMINADOS ",1,"C"
CASE AJ_DIJO="Otros Productos"
   DO CID.spr WITH .F.,.T.," AJUSTES DE STOCK OTROS PRODUCTOS ",1,"O"
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE DEVTAL
DV_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE DV_DIJO="Av¡os"
   DO CID.spr WITH .F.,.T.," DEVOLUCION DE AVIOS DE TALLERES ",5,"A"
CASE DV_DIJO="Telas"
   DO CID.spr WITH .F.,.T.," DEVOLUCION DE TELAS DE TALLERES ",5,"T"
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE RESERV
RV_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE RV_DIJO="Reserva"
   DO CID.spr WITH .F.,.T.," RESERVA ",6,"T"
CASE RV_DIJO="Anulaci¢n de Reserva"
   DO CID.spr WITH .F.,.T.," ANULACION DE RESERVA ",11,"T"
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LCIDX
LX_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE LX_DIJO="Reimprime C.I.D."
   DO RLCID
CASE LX_DIJO="Listados Comunes"
   do querycid.spr
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE RLCID
DIME ARTI[5], DESCR[5], CANTI[5], UNID[5]
=OPMER()
=OPCID()
=OPPRO()
=OPAVIS()
=OPTELS()
=OPCOMS()
=OPOTRS()
=OPCOR()
=OPMIX()
STORE NUL TO M.RESPUESTA
FINREQ=GETNU1("C.I.D.","FOXGRL")+1
IF !EMPTY(INFIC(FINREQ,"N§ de C.I.D. a Listar"))
   SELE CID
   SET ORDER TO TAG NUMERO
   IF SEEK(M.RESPUESTA)
      SCAT MEMV
      SELE CIX
      SET ORDER TO TAG NUMERO
      IF SEEK(M.NUMERO)
         M.XXZZ=1
         SCAN WHILE NUMERO=M.NUMERO
            ARTI[M.XXZZ]  = ELCOD()
            DESCR[M.XXZZ] = ELTEX()
            CANTI[M.XXZZ] = IIF(EMPTY(ENTRADA), SALIDA, ENTRADA)
            UNID[M.XXZZ]  = ELUNI()
            M.DETALLE=DETALLE
            M.XXZZ=M.XXZZ+1
         ENDSCAN
         DO LCID
      ELSE
         =CARTEL("NO SE HAN ENCONTRADO DATOS DE ARTICULO",;
           "EN EL C.I.D. N§ "+ALLTRIM(STR(M.NUMERO)),;
           "IMPOSIBLE REIMPRIMIR",;
           ENTERCON)
      ENDIF
   ELSE
      =NOSELEC("N§ DE C.I.D.")
   ENDIF
ELSE
   =NOSELEC("N§ DE C.I.D.")
ENDIF
RETURN
 
PROCEDURE REMTOS
RM_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
=OPCOR()
=OPTALS()
=OPAVIS()
=OPTELS()
=OPCOMS()
=OPOTRS()
=OPMER()
=OPKARS()
DO CASE
CASE RM_DIJO="Modifica Av¡os"
   DO ACTAVIS
CASE RM_DIJO="Modifica Talleres"
   DO ACTALLE
CASE RM_DIJO="Emisi¢n de Remitos"
   RESPUESTA="EMIREM#10#45#Emisi¢n de Remitos#3;
#Mercader¡a a \<Talleres;
#Remito de \<Orden de Corte;
#Remito de \<Pendientes;
#Devoluci¢n a P\<roveedores"
   =DEFPOP()
   ON SELE POPU EMIREM DO EMIREM
   ACTI POPU EMIREM
   RELE POPU EMIREM
CASE RM_DIJO="Solicitud Devoluci¢n"
   RESPUESTA="SOLIDEV#14#45#Solicitud de Devoluci¢n a Proveedores#3;
#\<Av¡os a Proveedores;
#\<Telas a Proveedores;
#Produ\<ctos Terminados a Proveedores;
#\<Otros Productos a Proveedores"
   =DEFPOP()
   ON SELE POPU SOLIDEV DO SOLIDEV
   ACTI POPU SOLIDEV
   RELE POPU SOLIDEV
CASE RM_DIJO="Anula Remito"   
   =OPREM()
   =IIF(ELIREM(),ANULREM(REM.REMITO),NOSELEC("REMITO"))
CASE RM_DIJO="Listados"
   RESPUESTA="LISTREM#14#45#Listados de Remitos#3;
#\<Imprime un Remito;
#\<Consulta un Remito;
#Listados de \<Av¡os Pendientes;
#Listados de Te\<las Pendientes;
#\<Devoluci¢n a Proveedores"
=DEFPOP()
   ON SELE POPU LISTREM DO LISTREM
   ACTI POPU LISTREM
   RELE POPU LISTREM
CASE RM_DIJO="Restaura Datos Pend en Talleres"
   =WORKING()
   =DOTALK()
   =OPTELS()
   SELE TELS
   =FLOCK() .OR. FLOK()
   REPL ALL STKRESPEN WITH NUL
   =OPAVIS()
   SELE AVIS
   =FLOCK() .OR. FLOCK()
   REPL ALL STKRESPEN WITH NUL   
   =OPPEN()
   SELE PEN
   =FLOCK() .OR. FLOK()
   SCAN FOR !DELE()
      =AJSTOCK(PEN.CANTIDAD-PEN.ENVIADA,600+ELCOD(.T.))
   ENDSCAN
   UNLO ALL
   =UNTALK()
   =UNWORK()
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE EMIREM
RI_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE RI_DIJO="Remito de Orden de Corte"
   DO GENREMI
CASE RI_DIJO="Remito de Pendientes"
   DO REMPEND
CASE RI_DIJO="Mercader¡a a Talleres"
   RESPUESTA="MERATAL#11#28#Mercader¡a a Talleres#3;
#\<Telas;
#\<Av¡os;
#-;
#Producci¢n \<Externa;
#-;
#So\<licitud Devol Telas;
#Sol\<icitud Devol Av¡os;
#Soli\<citud Devol P. Term.;
#Solicit\<ud Devol Otros P."
   =DEFPOP()
   ON SELE POPU MERATAL DO MERATAL
   ACTI POPU MERATAL
   RELE POPU MERATAL
CASE RI_DIJO="Devoluci¢n a Proveedores"
   RESPUESTA="DEVAPRO#16#35#Devoluci¢n a Proveedores#3;
#\<Av¡os;
#\<Telas;
#\<Productos Terminados;
#\<Otros Productos"
   =DEFPOP()
   ON SELE POPU DEVAPRO DO DEVAPRO
   ACTI POPU DEVAPRO
   RELE POPU DEVAPRO
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE MERATAL
MA_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE MA_DIJO="Producci¢n Externa"
   RESPUESTA="REMPEX#15#50#Remitos para Producci¢n Externa#3;
#\<Genera Remito;
#\<Autoriza Remito;
#A\<nula Remito;
#-;
#\<Imprime Remito"
   =DEFPOP()
   ON SELE POPU rempex DO rempex 
   ACTI POPU rempex 
   RELE POPU rempex 
CASE MA_DIJO="Telas"
   DO REMREPO.spr WITH 1,"T"
CASE MA_DIJO="Av¡os"
   DO REMREPO.spr WITH 1,"A"
CASE MA_DIJO="Solicitud Devol Telas"
   DO REMREPO.spr WITH 1,"T",.T.
CASE MA_DIJO="Solicitud Devol Av¡os"
   DO REMREPO.spr WITH 1,"A",.T.
CASE MA_DIJO="Solicitud Devol P. Term."
   DO REMREPO.spr WITH 1,"C",.T.
CASE MA_DIJO="Solicitud Devol Otros P."
   DO REMREPO.spr WITH 1,"O",.T.
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE DEVAPRO
MA_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE MA_DIJO="Av¡os"
   DO REMREPO.spr WITH 2,"A"
CASE MA_DIJO="Telas"
   DO REMREPO.spr WITH 2,"T"
CASE MA_DIJO="Productos Terminados"
   DO REMREPO.spr WITH 2,"C"
CASE MA_DIJO="Otros Productos"
   DO REMREPO.spr WITH 2,"O"
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE SOLIDEV
SO_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE SO_DIJO="Av¡os a Proveedores"
   DO REMREPO.SPR WITH 2,"A",.T.
CASE SO_DIJO="Telas a Proveedores"
   DO REMREPO.SPR WITH 2,"T",.T.
CASE SO_DIJO="Productos Terminados a Proveedores"
   DO REMREPO.SPR WITH 2,"C",.T.
CASE SO_DIJO="Otros Productos a Proveedores"
   DO REMREPO.SPR WITH 2,"O",.T.
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE KRDX
KR_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE KR_DIJO="Una Orden de Corte"
   DO LKAR1OC
CASE KR_DIJO="Un Remito"
   DO LKAR1RE
CASE KR_DIJO="Un C.I.D."
   DO LKAR1CI
CASE KR_DIJO="Ordenes de Requerimiento"
   RESPUESTA="LREQK#8#35#Men£ de Listado de Ordenes de Requerimiento por Kardex#3;
#\<Una Orden de Requerimiento;
#\<Diario por Fecha de Documento;
#Diario por Fecha de \<Alta;
#\<Mensual"
   =DEFPOP()
   ON SELE POPU LREQK DO LREQK
   ACTI POPU LREQK
   RELE POPU LREQK
OTHERWISE
   RESPUESTA="LKRDX#8#45#Men£ de Listado de Kardex de "+KR_DIJO+"#3;
#Desde a \<Hoy;
#\<Desde - Hasta"
   =DEFPOP()
   ON SELE POPU LKRDX DO LKRDX
   ACTI POPU LKRDX
   RELE POPU LKRDX
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LKRDX
SA_DIJO=ALLTRIM(PROMPT())
RESPUESTA="LKRDX1#10#45#Listado de "+KR_DIJO+" ("+SA_DIJO+")#3;
#\<"+KR_DIJO+";
#\<Entre C¢digos"
=DEFPOP()
ON SELE POPU LKRDX1 DO LKRDX1
ACTI POPU LKRDX1
RELE POPU LKRDX1
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LKRDX1
LK_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE LK_DIJO="Un Av¡o"
   DO LKAR1AR WITH 1,.T.,(SA_DIJO="Desde - Hasta"),1
CASE LK_DIJO="Una Tela"
   DO LKAR1AR WITH 2,.T.,(SA_DIJO="Desde - Hasta"),1
CASE LK_DIJO="Un Producto Terminado"
   DO LKAR1AR WITH 3,.T.,(SA_DIJO="Desde - Hasta"),1
CASE LK_DIJO="Otro Producto"
   DO LKAR1AR WITH 4,.T.,(SA_DIJO="Desde - Hasta"),1
OTHERWISE
   DO CASE
   CASE KR_DIJO="Un Av¡o"
      DO LKAR1AR WITH 1,.T.,(SA_DIJO="Desde - Hasta"),2
   CASE KR_DIJO="Una Tela"
      DO LKAR1AR WITH 2,.T.,(SA_DIJO="Desde - Hasta"),2
   CASE KR_DIJO="Un Producto Terminado"
      DO LKAR1AR WITH 3,.T.,(SA_DIJO="Desde - Hasta"),2
   CASE KR_DIJO="Otro Producto"
      DO LKAR1AR WITH 4,.T.,(SA_DIJO="Desde - Hasta"),2
   ENDCASE
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LREQK
LR_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE LR_DIJO="Una Orden de Requerimiento"
   DO LKAR1REQ
CASE LR_DIJO="Diario por Fecha de Documento" .OR. ;
     LR_DIJO="Diario por Fecha de Alta"
   RESPUESTA="LKRDX2#12#55#Listado de Kardex - "+LR_DIJO+"#3;
#\<Completo;
#\<Av¡os;
#\<Telas;
#\<Productos Terminados;
#\<Otros Productos;
#Telas \<y Av¡os;
#Telas\<, Av¡os y P. Term"
   =DEFPOP()
   ON SELE POPU LKRDX2 DO LKRDX2 WITH (LR_DIJO#"Diario por Fecha de Documento")
   ACTI POPU LKRDX2
   RELE POPU LKRDX2
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LKRDX2
PARAMETER EL_LOGIC
L2_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE L2_DIJO="Completo"
   DO INGDIAR WITH EL_LOGIC,5
CASE L2_DIJO="Av¡os"
   DO INGDIAR WITH EL_LOGIC,1
CASE L2_DIJO="Telas"
   DO INGDIAR WITH EL_LOGIC,2
CASE L2_DIJO="Productos Terminados"
   DO INGDIAR WITH EL_LOGIC,3
CASE L2_DIJO="Otros Productos"
   DO INGDIAR WITH EL_LOGIC,4
CASE L2_DIJO="Telas y Av¡os"
   DO INGDIAR WITH EL_LOGIC,6
CASE L2_DIJO="Telas, Av¡os y P. Term"
   DO INGDIAR WITH EL_LOGIC,7
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LISTREM
ULPR=HORA_ULP(PROGRAM())
LR_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LR_DIJO="Imprime un Remito"
   =OPREM()
   =OPREQ(.F.,.F.,.T.)
   =IIF(ELIREM(), LREMIC(REM.REMITO),NOSELEC("REMITO"))
   use in REX
   use in REQX
   use in REM
   use in REQ
CASE LR_DIJO="Consulta un Remito"
   =IIF(ELIREM(), MREMIF(REM.REMITO),NOSELEC("REMITO"))
CASE LR_DIJO="Listados de Av¡os Pendientes"
   do LREMPEND with "A"
CASE LR_DIJO="Listados de Telas Pendientes"
   do LREMPEND with "T"
CASE LR_DIJO="Devoluci¢n a Proveedores"
   RESPUESTA="LDEVPRO#16#55#Listados de Devoluci¢n a Proveedores#3;
#\<Completo;
#Un \<Av¡o;
#Una \<Tela;
#Un \<Producto Terminado;
#\<Otro Producto;
#Un P\<roveedor"
=DEFPOP()
   ON SELE POPU LDEVPRO DO LDEVPRO
   ACTI POPU LDEVPRO
   RELE POPU LDEVPRO
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LDEVPRO
ULPR=HORA_ULP(PROGRAM())
LD_DIJO=ALLTRIM(PROM())
DO CASE
CASE LD_DIJO="Completo"
CASE LD_DIJO="Un Av¡o"
   STORE NUL TO M.RESPUESTA
   IF ELIAVIS("a Listar",-1,1),
      FISC1="REX.AVICODPRO='"+AVIS.AVICODPRO+"'"
      TTan="Av¡o:"+alltrim(avis.avio)+" ("+alltrim(avis.avicodpro)+")"
      LAUN=SAYMIX(AVIS.UNIDAD,"MDDCOD")
      CPO="REX.AVICODPRO"
      =LDEVPR("A",AVIS.AVICODPRO)
   ELSE
      =NOSELEC("AVIO")
   ENDIF
CASE LD_DIJO="Una Tela"
CASE LD_DIJO="Un Producto Terminado"
CASE LD_DIJO="Otro Producto"
CASE LD_DIJO="Un Proveedor"
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LDEVPR
PARAMETER L_TIPO,L_COD
STORE {} TO M.FECINI,M.FECFIN
IF ENTRE_FE("a Listar")
   =OPREM()
   =DOTALK()
   =WORKING()
   SELE REM
   SET ORDER TO
   TMP=GENTMP()
   TMP1=GENTMP()
   =FLOCK() .OR. FLOK()
   SORT ON REMITO TO (TMP) FOR ;
     BETW(REM.FECHAOP,M.FECINI,M.FECFIN) .AND. !EMPTY(NUMREQ) 
   =UNLO_PRX("REM",TMP,"TMP")
   SELE REX
   SET ORDER TO TAG REMITO
   =FLOCK() .OR. FLOK()
   SELE TMP
   INDEX ON REMITO TAG REMITO
   SET ORDER TO TAG REMITO
   SELE REX
   SET RELA TO REMITO INTO TMP   
   SORT ON (CPO) TO (TMP1) FOR ;
     EVAL(FISC1) ;
     FIELD REMITO,CANTIDAD,;
     AVICODPRO,TELCODPRO,COMCODPRO,OTRCODPRO,REM.TALLER
     
   tt="Devoluci¢n de Materia Prima a Proveedores"+crlf+;
     TTAN+CRLF+;
     "Entre el "+dtoc(m.fecini)+" y el "+dtoc(m.fecfin)
   ACLA=PAIP+;
     PADC("REMITO",14)+PAIP+;
     PADC("PROVEEDOR",30)+PAIP+;
     "UNID"+PAIP+;
     PADC("CANTIDAD",XACDIGI)+PAIP
     =UNLO_PRX("REX",TMP1,"TMP1")
   =XPRN1(4,"TMP1","LDEVPR0()",TTAN,"LDEVPR"+L_TIPO)
   =UNTALK()
   =UNWORK()
   =OFF_TMP()
ENDIF
RETURN MEN_LIN(BOTOM)

PROCEDURE REMPEX
ULPR=HORA_ULP(PROGRAM())
RX_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE RX_DIJO="Genera Remito"
   DO REMTERM.SPR WITH " Remito de Materia Prima a Proveedores "
CASE RX_DIJO="Autoriza Remito"
   DO REMTERM.SPR WITH " Autoriza Remito a Proveedores ",.T.
CASE RX_DIJO="Anula Remito"
   DO REMTERM.SPR WITH " Anula Remito a Proveedores ",.T.,.T.
CASE RX_DIJO="Imprime Remito"
   =OPREM()
   =OPREQ(.F.,.F.,.T.)
   =IIF(ELIREM(), LREMIC(REM.REMITO),NOSELEC("REMITO"))
   use in REX
   use in REQX
   use in REM
   use in REQ
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)

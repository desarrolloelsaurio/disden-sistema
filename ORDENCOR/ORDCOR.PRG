************************************
*-- Programa: ORDCOR.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
************************************
#DEFINE PAIP   "|"                               && PAIP
#DEFINE NUL    0                                 && NUL

ULPR=PROGRAM()
CO_DIJO=ALLTRIM(PROMPT())
=CABPAN1()
=OPRUB()
DO CASE
CASE CO_DIJO=="Ordenes de "+korte+' (Mercader¡a)'
   =OPDOC()
   =OPMER()
   =OPSUE()
   =OPCOR()
   RESPUESTA='grl#4#45#Men£ de Ordenes de '+korte+' (Mercader¡as)#3;
#\<Ingresa - Agrega;
#\<Corrige;
#Corrige \<Fecha Finalizaci¢n;
#C\<orrige Tipo de Estructura;
#-;
#\<Anula;
#-;
#\<Lista por Impresora;
#Lista \<por Pantalla;
#-;
#Res\<taura el Archivo'
   =DEFPOP()
   ON SELE POPU GRL DO CO1
   ACTI POPU GRL
   RELE POPU GRL
CASE CO_DIJO=='Ordenes de '+korte+' (Cabecera)'
   =OPDOC()
   =OPMER()
   =OPCOR()
   RESPUESTA='grl#4#45#Men£ de Ordenes de '+korte+' (Cabecera)#3;
#\<Ingresa;
#-;
#\<Anula;
#-;
#\<Listado;
#L\<egajo;
#-;
#Res\<taura el Archivo'
   =DEFPOP()
   ON SELE POPU GRL DO COR
   ACTI POPU GRL
   RELE POPU GRL
CASE CO_DIJO='Inicia Orden de '+Favri
   =OPEST()
   =OPDES()
   =OPMER()
   =OPCOR()
   =OPFAB()
   DO fab.SPR WITH 'Orden de Corte a Iniciar', .T.
case CO_DIJO='Gesti¢n de '+Favri
   =OPAVI()
   =OPCOR()
   =OPDES()
   RESPUESTA='grl#4#45#Men£ de Gesti¢n de Ordenes de '+favri+'#3'
   =OPEMP()
   =OPEST()
   =OPFAB()
   RESPUESTA=RESPUESTA+';
#\<Emite Remito Com£n;
#\<Bifurca Remito'
   =OPKAR()
   =OPTALS()
   =OPMER()
   =OPPRC()
   RESPUESTA=RESPUESTA+';
#\<Registra Env¡o de Merc. a Taller;
#Re\<gistra Recepci¢n de Merc.de Taller'
   RESPUESTA=RESPUESTA+';
#\<Cambia Proceso'
   RESPUESTA=RESPUESTA+';
#-;
#Re\<mito de Reproceso;
#Rem\<ito de Producto Terminado;
#\<Solicitud de Preparaci¢n de Av¡os;
#Merc\<ader¡a en Taller;
#-;
#\<Lista por Impresora;
#Lista por \<Pantalla;
#-;
#Restaura \<Archivo'
   =DEFPOP()
   ON SELE POPU GRL DO GFAB
   ACTI POPU GRL
   RELE POPU GRL
CASE CO_DIJO='Finaliza Orden de '+Favri
   RESPUESTA='grl#4#45#Finalizaci¢n de Orden de '+favri+'#3;
#\<Ingresa Datos Parciales;
#\<Fin Orden;
#\<Muestra Datos Finales'
   =defpop()
   ON SELE POPU GRL DO FFAB
   ACTI POPU GRL
   RELE POPU GRL
case CO_DIJO='Hist¢ricos'
   RESPUESTA='grl#4#45#Men£ de Gesti¢n Hist¢rica de Ordenes de '+favri+'#3;
#\<Restaura Archivo'
   =DEFPOP()
   ON SELE POPU GRL DO HISTCOR
   ACTI POPU GRL
   RELE POPU GRL
CASE CO_DIJO='Reservas'
   RESPUESTA='reser#5#45#Men£ de Reservas#3;
#\<Reserva Materia Prima;
#\<Anula Reserva;
#-;
#\<Listados;
#-;
#R\<estaura Datos;
#Re\<staura el Archivo'
   =DEFPOP()
   ON SELE POPU RESER DO reser
   ACTI POPU reser
   RELE POPU reser
ENDCASE
ULPR=HORA_ULP(PROGRAM())
UNLO ALL
RETURN MEN_LIN(BOTOM)

PROCEDURE FFAB
* DERIVA A OPERACIONES DE FINALIZACION DE ORDENES DE CORTE
FF_DIJO=ALLTRIM(PROMPT())
=OPMER()
=OPPRC()
=OPEST()
=opcor()
=opfab()
DO CASE
CASE FF_DIJO='Ingresa Datos Parciales'
   STORE NUL TO RESPUESTA
   IF elicor("a Ingresar",-1,1,'N')
      IF ifin_fab()
         if CARTEL("La Orden de Corte N§ "+alltrim(str(cor.numero)),;
              "est  en condiciones de ser cerrada.",;
              "Pulse [ENTER] para entrar al programa de cierre",;
              "Pulse [ESC] para seguir operando normalmente")#27
            DO FIN_FAB
         endif
      ENDIF
   ENDIF
CASE FF_DIJO='Fin Orden'
   DO ICOR_DO.SPR WITH " A CERRAR",6
CASE FF_DIJO='Muestra Datos Finales'
   DO MFIN_FAB.SPR
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE RESER
ULPR=HORA_ULP(PROGRAM())
RE_DIJO=ALLTRIM(PROMPT())
=OPAVIS()
=OPTELS()
=OPRPV()
=OPDES()
=OPCOR()
DO CASE
CASE RE_DIJO='Reserva Materia Prima'
   DO ICOR_DO.SPR WITH  "PARA CARGAR RESERVA",4
CASE RE_DIJO='Anula Reserva'
   DO ICOR_DO.SPR WITH  "PARA ANULAR RESERVA",3
CASE RE_DIJO='Listados'
   RESPUESTA='Lreser#8#30#Listado de Reserva#3;
#\<Completo;
#Todos los \<Av¡os;
#Todas las \<Telas;
#\<Una Orden de Corte;
#Un A\<v¡o;
#Una T\<ela'
   =DEFPOP()
   ON SELE POPU LRESER DO LRESER
   ACTI POPU LRESER
   RELE POPU LRESER
CASE RE_DIJO=='Restaura Datos'
   =WORKING()
   =DOTALK()
   TMP=GENTMP()
   SELE RPV
   =FLOCK() .OR. FLOK()
   SELE COR
   =FLOCK() .OR. FLOCK()
   =OPTELS()
   SELE TELS
   =FLOCK() .OR. FLOK()
   =OPAVIS()
   SELE AVIS
   =FLOCK() .OR. FLOK()
   REPL ALL STOCKRES WITH NUL
   SELE TELS
   REPL ALL STOCKRES WITH NUL
   SELE COR
   REPL ALL RESERVA WITH .F.
   SELE RPV
   COPY TO (TMP) FOR !DELE()
   SET ORDER TO TAG NUMERO
   =PRXAREA(.T.)
   USE (TMP) ALIAS TMP EXCL
   INDEX ON NUMERO TAG NUMERO UNIQ
   SET ORDER TO TAG NUMERO
   SCAN
      IF XSEEK(TMP.NUMERO,"COR","NUMERO")
         =WNCL("ORDEN DE CORTE N§ "+ALLTRIM(STR(COR.NUMERO)))
         SELE RPV
         SEEK TMP.NUMERO
         SCAN WHILE RPV.NUMERO=TMP.NUMERO
            =AJSTOCK(RPV.CANTIDAD,500+ELCOD(.T.))
            SELE RPV
         ENDSCAN
         REPL COR.RESERVA WITH .T.
      ENDIF
      SELE TMP
   ENDSCAN
   UNLO ALL
   =WCL()
   =UNTALK()
   =UNWORK()
   =OFF_TMP()
CASE RE_DIJO='Restaura el Archivo'
   DO XRPV
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LRESER
EXTERNAL PROCEDURE LRPV0
ULPR=HORA_ULP(PROGRAM())
LR_DIJO=ALLTRIM(PROMPT())
=OPAVIS()
=OPTELS()
=OPCOR()
=OPRPV()
DO CASE
CASE LR_DIJO='Completo'
   =WORKING()
   =DOTALK()
   TMP=GENTMP()
   TMP1=GENTMP()
   SELE RPV
   =FLOCK() .OR. FLOK()
   COPY TO (TMP) FOR !DELE()
   =UNLO_PRX("RPV",TMP)
   INDEX ON AVICODPRO+TELCODPRO TAG AVICODPRO
   TOTAL ON AVICODPRO+TELCODPRO TO (TMP1) FIELD CANTIDAD
   =PRXAREA(.T.)
   USE (TMP1) ALIAS TMP1 EXCL
   =UNTALK()
   =UNWORK()
   TT="Listado de Reservas"
   ACLA=PAIP+;
     PADC("ARTICULO",20)+;
     PAIP+;
     PADC("DESCRIPCION",40)+;
     PAIP+;
     PADC("RESERVA",XACDIGI)+;
     PAIP
   =XPRN1(4,"TMP1","LRPV0()","RESERVA COMPLETA","LRPVC",.T.)
   =OFF_TMP()
CASE LR_DIJO='Todos los Av¡os'
   =WORKING()
   =DOTALK()
   TMP=GENTMP()
   TMP1=GENTMP()
   SELE RPV
   =FLOCK() .OR. FLOK()
   COPY TO (TMP) FOR !DELE() .and. !EMPTY(AVICODPRO)
   =UNLO_PRX("RPV",TMP)
   INDEX ON AVICODPRO TAG AVICODPRO
   TOTAL ON AVICODPRO TO (TMP1) FIELD CANTIDAD
   =PRXAREA(.T.)
   USE (TMP1) ALIAS TMP1 EXCL
   =UNTALK()
   =UNWORK()
   TT="Listado de Reservas de Av¡os"
   ACLA=PAIP+;
     PADC("ARTICULO",20)+;
     PAIP+;
     PADC("DESCRIPCION",40)+;
     PAIP+;
     PADC("RESERVA",XACDIGI)+;
     PAIP
   =XPRN1(4,"TMP1","LRPV0()","RESERVA COMPLETA AVIOS","LRPVCA",.T.)
   =OFF_TMP()
CASE LR_DIJO='Todas las Telas'
   =WORKING()
   =DOTALK()
   TMP=GENTMP()
   TMP1=GENTMP()
   SELE RPV
   =FLOCK() .OR. FLOK()
   COPY TO (TMP) FOR !DELE() .and. !EMPTY(TELCODPRO)
   =UNLO_PRX("RPV",TMP)
   INDEX ON TELCODPRO TAG TELCODPRO
   TOTAL ON TELCODPRO TO (TMP1) FIELD CANTIDAD
   =PRXAREA(.T.)
   USE (TMP1) ALIAS TMP1 EXCL
   =UNTALK()
   =UNWORK()
   TT="Listado de Reservas de Telas"
   ACLA=PAIP+;
     PADC("ARTICULO",20)+;
     PAIP+;
     PADC("DESCRIPCION",40)+;
     PAIP+;
     PADC("RESERVA",XACDIGI)+;
     PAIP
   =XPRN1(4,"TMP1","LRPV0()","RESERVA COMPLETA TELAS","LRPVCT",.T.)
   =OFF_TMP()
CASE LR_DIJO='Una Orden de Corte'
   DO ICOR_DO.SPR WITH  " - Listado de Reservas",5
CASE LR_DIJO='Un Av¡o'
   DO AVI_DO.SPR WITH .T.,2," Listado de Reserva por Accesorio "
CASE LR_DIJO='Una Tela'
   DO TEL_DO.SPR WITH .T.,2," Listado de Reserva por Tela "
ENDCASE
RETURN MEN_LIN(BOTOM)

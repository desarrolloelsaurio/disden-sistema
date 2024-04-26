PROCEDURE TELS
#DEFINE PAIP   "|"                               && PAIP
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE PICUMA1 "9,999,999,999,999"              && PICUMA1

* TRATARA DE DISPARAR ALGO
ULPR=HORA_ULP(PROGRAM())
A_DIJO=ALLTRIM(PROMPT())
ULPRANT=ULPR
DO CASE
CASE A_DIJO='Tela Madre'
   RESPUESTA="TELMAD#6#25#Men£ de Gesti¢n Tela Madre#3;
#\<Caracter¡sticas;
#\<Asigna Hijos;
#\<Listados;
#-;
#\<Reindexa"
   =DEFPOP()
   ON SELE POPU TELMAD DO TELMAD
   ACTI POPU TELMAD
   RELE POPU TELMAD
   ULPR=HORA_ULP(PROGRAM())
CASE A_DIJO='Caracter¡sticas'
   DO TEL_DO.spr
CASE A_DIJO='Datos Generales'
   DO TELS.SPR
CASE A_DIJO='Legajo'
   DO TEL_LEG.SPR with .T.
CASE A_DIJO='Stock'
   RESPUESTA="STKTEL#6#25#Men£ de Stock de "+tellas+"#3;
#\<Consulta Stock;
#Stock por \<Madre;
#-;
#\<Ajuste Stock de Control;
#-;
#Listado por \<Pantalla;
#Listado por \<Impresora"
   =DEFPOP()
   ON SELE POPU STKTEL DO STKTEL
   ACTI POPU STKTEL
   RELE POPU STKTEL
   ULPR=HORA_ULP(PROGRAM())
CASE A_DIJO='Kardex'
   RESPUESTA='KARTEL#6#25#Men£ de Kardex de '+tellas+'#3;
#Listado por \<Pantalla;
#Listado por \<Impresora'
   =DEFPOP()
   ON SELE POPU KARTEL DO KARTEL
   ACTI POPU KARTEL
   RELE POPU KARTEL
CASE A_DIJO='En qu‚ Orden ?'
   =ENQORDT("T")
CASE A_DIJO='Por Material'
   DO TEL_DO.SPR WITH .T.,1," Listado de Despiece por Tela"
CASE A_DIJO="Salida por Orden de Corte"
   DO MOD_STKT.SPR WITH "T",.T.,"X"
CASE A_DIJO=="Ajuste Stock s¢lo Kardex"
   DO MOD_STKT.SPR WITH "T",.F.,"K"
CASE A_DIJO=="Ajuste Stock s¢lo Stock"
   DO MOD_STKT.SPR WITH "T",.F.,"S"
CASE A_DIJO=="Modificaci¢n Stock"
   DO CID.spr WITH .F.,.T.," AJUSTES DE STOCK TELAS ",1,"T"
CASE A_DIJO="Presupuesto"
   DO INGPRS.SPR WITH "T"
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)

PROCEDURE STKTEL
* TRATARA DE DISPARAR LOS PROCESOS DE STOCK DE TELOS
STK_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE STK_DIJO=="Stock por Madre"
EXTERNAL PROCEDURE LTELM.PRG
=OPTMA()
=OPPRO()
=OPTELS()
   STORE NUL TO M.RESPUESTA
   IF ELITMA("a Listar",-1,1)
      =DOTALK()
      =WORKING()
      SELE TELS
      SET ORDER TO
      TMP=GENTMP()
      =FLOCK() .OR. FLOK()
      SORT ON TELA TO (TMP) FOR MADRE=TMA.CODMADRE
      =UNLO_PRX("TELS",TMP)
      ACLAPRN=PAIP+PADC("CODIGO",20)+PAIP+;
      PADC("TELA",30)+PAIP+;
      PADC("PROVEEDOR",20)+PAIP+;
      PADC("MONTO UN",XACDIGI)+PAIP+;
      PADC("STOCK",XACDIGI)+PAIP+;
      PADC("RESERVADO",XACDIGI)+PAIP+;
      PADC("COMPRADO",XACDIGI)+PAIP+;
      PADC("TOTAL",XACDIGI)+PAIP
      ACLAPAN=PAIP+PADC("CODIGO",20)+PAIP+;
      PADC("MONTO UN",XACDIGI)+PAIP+;
      PADC("STOCK",XACDIGI)+PAIP+;
      PADC("RESERVADO",XACDIGI)+PAIP+;
      PADC("COMPRADO",XACDIGI)+PAIP+;
      PADC("S.VIRT.",XACDIGI)+PAIP
		TT="Listado de Stock por Madre"+;
			crlf+;
			ALLTRIM(TMA.TELMADRE)+"("+ALLTRIM(TMA.CODMADRE)+" )"
		STORE .T. TO M.VIRTUAL
      =XPRN1(4,"TMP","LTELM()",TMA.TELMADRE,"LTELSM",4,RIGHT(PICUMA1,XACDIGI))
      =OFF_TMP()
      =UNTALK()
      =UNWORK()
   ENDIF
CASE STK_DIJO="Consulta Stock"
   DO MSTOCK_X.SPR WITH "T","Telas"
CASE STK_DIJO="Ajuste Stock de Control"
   DO MODSTKT-.SPR
CASE LEFT(STK_DIJO,7)="Listado"
   RESPUESTA="LSTKTEL#8#35#Men£ de Listado de Stock de "+tellas+"#3;
#Stock \<Actual;
#Stock menor que el M¡n\<imo;
#Stock mayor que el M \<ximo;
#Stock menor que \<X;
#Stock \<Virtual;
#\<Punto de Pedido;
#\<Valorizaci¢n;
#\<Totales por Unidad;
#\<Diferencias con Kardex"
   =DEFPOP()
   ON SELE POPU LSTKTEL DO LSTKTEL WITH STK_DIJO=("Listado por Pantalla")
   ACTI POPU LSTKTEL
   RELE POPU LSTKTEL
   ULPR=HORA_ULP(PROGRAM())
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LSTKTEL
PARAMETER PORPX
ULPR=HORA_ULP(PROGRAM())
LST_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LST_DIJO="Stock Virtual"
   =OPPRO()
   =OPMDD()
   =OPTELS()
   ttque="Listado de Stock Virtual de Telas"
   DO queryTEL.spr WITH PORPX,.T.,.F.," Stock Virtual ",".T.",.F.,.T.
CASE LST_DIJO="Stock Actual"
   =OPPRO()
   =OPMDD()
   =OPTELS()
   ttque="Listado de Stock de Telas"
   DO queryTEL.spr WITH PORPX,.T.,.F.," Stock Actual ",".T."
CASE LST_DIJO="Stock menor que el M¡nimo"
   =OPPRO()
   =OPMDD()
   =OPTELS()
   ttque="Listado de Stock de Telas"+crlf+;
     "Stock menor que el m¡nimo"
   DO queryTEL.spr WITH porpx,.T.,.F.," Stock Menor que el M¡nimo ","TELS.STOCK<TELS.STOCKMIN"
CASE LST_DIJO="Stock mayor que el M ximo"
   =OPPRO()
   =OPMDD()
   =OPTELS()
   ttque="Listado de Stock de Telas"+crlf+;
     "Stock mayor que el m ximo"
   DO queryTEL.spr WITH PORPX,.T.,.T.,.F.," Stock Mayor que el M ximo ","TELS.STOCK>TELS.STOCKMAX"
CASE LST_DIJO="Stock menor que X"
   STORE NUL TO RESPUESTA
   RESPUESTA=INFIC("Cantidad a Listar",999999)
   IF LAST()#27 .AND. !EMPTY(RESPUESTA)
      LACANT=RESPUESTA
      =OPPRO()
      =OPMDD()
      =OPTELS()
      ttque="Listado de Stock de Telas"+crlf+;
        "Stock menor que "+alltrim(str(lacant))
      DO QUERYTEL.SPR WITH PORPX,.T.,.F.," Stock Menor que "+alltrim(str(lacant)),"TELS.STOCK<"+alltrim(str(lacant))
   ENDIF
CASE LST_DIJO="Punto de Pedido"
   RESPUESTA="LSTKTELP#10#45#Men£ de Listado de Stock de '+tellas+'- Punto de Pedido#3;
#\<Completo;
#\<Por Proveedor"
   =DEFPOP()
   ON SELE POPU LSTKTELP DO LPUPED WITH "T",PORPX
   ACTI POPU LSTKTELP
   RELE POPU LSTKTELP
   ULPR=HORA_ULP(PROGRAM())
CASE LST_DIJO="Valorizaci¢n"
   RESPUESTA="LSTKAVL#10#45#Men£ de Listado de Valorizaci¢n de Stock de '+tellas+'#3;
#Listado \<Detallado;
#Por \<Rubro;
#Por \<Aplicaci¢n;
#Por \<Proveedor;
#Por \<Marca"
   =DEFPOP()
   ON SELE POPU LSTKAVL DO LSTKAVL
   ACTI POPU LSTKAVL
   RELE POPU LSTKAVL
   ULPR=HORA_ULP(PROGRAM())
CASE LST_DIJO="Totales por Unidad"
   RESPUESTA="LSTKTXU#10#45#Men£ de Listado de Valorizaci¢n de Stock de '+tellas+' - Totales por Unidad#3;
#Por \<Rubro;
#Por \<Aplicaci¢n;
#Por \<Proveedor;
#Por \<Marca"
   =DEFPOP()
   ON SELE POPU LSTKTXU DO LSTKTXU
   ACTI POPU LSTKTXU
   RELE POPU LSTKTXU
   ULPR=HORA_ULP(PROGRAM())
CASE LST_DIJO="Diferencias con Kardex"
   RESPUESTA="DIFCKAR#10#45#Listado de Diferencias con Kardex - '+tellas+'#3;
#\<Completo;
#\<S¢lo Diferencias"
   =defpop()
   ON SELE POPU DIFCKAR DO DIFCKAR WITH "T",BAR()=2
   ACTI POPU DIFCKAR
   RELE POPU DIFCKAR
   ULPR=HORA_ULP(PROGRAM())
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LSTKAVL
ULPR=HORA_ULP(PROGRAM())
LS1_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LS1_DIJO="Listado Detallado"
   =OPPRO()
   =OPMDD()
   =OPTELS()
   ttque="Listado de Stock de Telas"+crlf+;
     "Valorizaci¢n"
   DO queryTEL.spr WITH PORPX,.T.,.F.," Valorizaci¢n ",".T."
CASE LS1_DIJO="Por Rubro"
   DO SVALX WITH PORPX,"T","R","T"
CASE LS1_DIJO="Por Aplicaci¢n"
   DO SVALX WITH PORPX,"T","A","T"
CASE LS1_DIJO="Por Proveedor"
   DO SVALX WITH PORPX,"T","P","T"
CASE LS1_DIJO="Por Marca"
   DO SVALX WITH PORPX,"T","M","T"
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LSTKTXU
ULPR=HORA_ULP(PROGRAM())
LXU_DIJO=ALLTRIM(PROMPT())
RESPUESTA="LSTKTXU1#12#55#Tipo de Listado de Valorizaci¢n de Stock de '+tellas+' - Totales por Unidad#3;
#\<Reservado;
#\<Disponible (Sin Reserva);
#\<Total"
=DEFPOP()
ON SELE POPU LSTKTXU1 DO LSTKTXU1
ACTI POPU LSTKTXU1
RELE POPU LSTKTXU1
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)

PROCEDURE LSTKTXU1
ULPR=HORA_ULP(PROGRAM())
LXU1_DIJO=ALLTRIM(PROMPT())
LXU1_DIJO=IIF(LXU1_DIJO="Reservado","R",IIF(LXU1_DIJO="Disponible (Sin Reserva)","S","T"))
DO CASE
CASE LXU_DIJO="Por Rubro"
   DO SVALX WITH PORPX,"T","R",LXU1_DIJO
CASE LXU_DIJO="Por Aplicaci¢n"
   DO SVALX WITH PORPX,"T","A",LXU1_DIJO
CASE LXU_DIJO="Por Proveedor"
   DO SVALX WITH PORPX,"T","P",LXU1_DIJO
CASE LXU_DIJO="Por Marca"
   DO SVALX WITH PORPX,"T","M",LXU1_DIJO
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE KARTEL
K_DIJO=ALLTRIM(PROMPT())
RESPUESTA='LKARTEL#8#35#Men£ de Listado de Kardex de '+tellas+'#3;
#\<Ingresos del D¡a;
#\<Consumos del D¡a;
#Consumos \<Mensuales;
#Art¡culos \<Sin Consumo;
#Stock \<Hist¢rico'
=DEFPOP()
ON SELE POPU LKARTEL DO LKARTEL WITH (K_DIJO="Listado por Pantalla")
ACTI POPU LKARTEL
RELE POPU LKARTEL
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)

PROCEDURE LKARTEL
PARAMETER PORPX
ULPR=HORA_ULP(PROGRAM())
LK_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LK_DIJO="Ingresos del D¡a"
   RESPUESTA='LIND#10#45#Listado de Ingresos Diarios de '+tellas+'#3;
#Fecha de \<Documento;
#Fecha de \<Alta'
   =DEFPOP()
   ON SELE POPU LIND DO LIND
   ACTI POPU LIND
   RELE POPU LIND
   ULPR=HORA_ULP(PROGRAM())
CASE LK_DIJO="Consumos del D¡a"
   RESPUESTA='LCOND#10#45#Listado de Consumos Diarios de '+tellas+'#3;
#Por \<Art¡culo;
#Por \<Remito;
#Por \<Orden de Corte'
   =DEFPOP()
   ON SELE POPU LCOND DO LCOND
   ACTI POPU LCOND
   RELE POPU LCOND
   ULPR=HORA_ULP(PROGRAM())
CASE LK_DIJO="Consumos Mensuales"
   RESPUESTA='LCONSM#10#45#Listado de Consumos Mensuales de '+tellas+'#3;
#\<Consumo Mensual;
#\<Valorizado;
#-;
#Un \<Proveedor;
#Un Pro\<veedor Valorizado;
#Res\<umen Valorizado por Proveedor;
#-;
     Un \<Av¡o'
   =DEFPOP()
   ON SELE POPU LCONSM DO LCONSM
   ACTI POPU LCONSM
   RELE POPU LCONSM
   ULPR=HORA_ULP(PROGRAM())
CASE LK_DIJO="Art¡culos Sin Consumo"
   DO SINCONSU WITH PORPX,"T",.T.
CASE LK_DIJO="Stock Hist¢rico"
   DO STKHIS WITH PORPX,1
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LIND
ULPR=HORA_ULP(PROGRAM())
LKI_DIJO=ALLTRIM(PROMPT())
RESPUESTA='LIND1#12#55#Ingresos Diarios de '+tellas+' -'+LKI_DIJO+' #3;
#Por \<Art¡culo;
#Por Orden de Re\<querimiento'
=DEFPOP()
ON SELE POPU LIND1 DO RESP1
ACTI POPU LIND1
RELE POPU LIND1
LK1=ALLTRIM(PROMPT())
DO CASE
CASE LKI_DIJO="Fecha de Documento"
   DO INGDIA WITH PORPX,"T",.F.,IIF(LK1="Por Art¡culo",1,2)
CASE LKI_DIJO="Fecha de Alta"
   DO INGDIA WITH PORPX,"T",.F.,IIF(LK1="Por Art¡culo",1,2),.T.
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LCOND
ULPR=HORA_ULP(PROGRAM())
LC_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LC_DIJO="Por Art¡culo"
   DO INGDIA WITH PORPX,"T",.T.,1
CASE LC_DIJO="Por Remito"
   DO INGDIA WITH PORPX,"T",.T.,3
CASE LC_DIJO="Por Orden de Corte"
   DO INGDIA WITH PORPX,"T",.T.,2
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LCONSM
ULPR=HORA_ULP(PROGRAM())
LC_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LC_DIJO="Consumo Mensual"
   DO CONSMES WITH PORPX,"T"
CASE LC_DIJO="Valorizado"
   DO CONSMES WITH PORPX,"T",.T.
CASE LC_DIJO="Un Proveedor Valorizado"
   =OPPRO()
   DO WHILE ELIPRO()
      DO CONSMES WITH PORPX,"T",.T.,.T.
   ENDDO
CASE LC_DIJO="Un Proveedor"
   =OPPRO()
   DO WHILE ELIPRO()
      DO CONSMES WITH PORPX,"T",.F.,.T.
   ENDDO
CASE LC_DIJO="Resumen Valorizado por Proveedor"
   DO CONSPROV WITH PORPX
CASE LC_DIJO="Por Material"
   DO CONSAVI WITH PORPX,"T"
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE TELMAD
TM_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE TM_DIJO="Caracter¡sticas"
   DO ITMA.SPR
CASE TM_DIJO="Asigna Hijos"
   DO ITHI.SPR
CASE TM_DIJO="Reindexa"
   DO XTMA
CASE TM_DIJO="Listados"
   RESPUESTA="LTELMAD#8#35#Listados de Tela Madre#3;
#\<Telas Madre;
#\<Hijos de ...;
#\<Hermanos de ...;
#\<Madre de ...;
#H\<u‚rfanos"
   =DEFPOP()
   ON SELE POPU ltelmad DO ltelmad
   ACTI POPU ltelmad
   RELE POPU ltelmad
   ULPR=HORA_ULP(PROGRAM())
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)

PROCEDURE LTELMAD
ULPR=HORA_ULP(PROGRAM())
LT_DIJO=ALLTRIM(PROMPT())
=OPPRO()
=OPTELS()
=OPTMA()
DO CASE
CASE LT_DIJO="Telas Madre"
   =OPTMA()
   DO LTMA
CASE LT_DIJO="Hijos de ..."
   EXTERNAL PROCEDURE LTMA1
   STORE NUL TO M.RESPUESTA
   IF ELITMA("a Listar",-1,1)
      =DOTALK()
      =WORKING()
      SELE TELS
      TMP=GENTMP()
      =FLOCK() .OR. FLOK()
      SORT ON TELA TO (TMP) FOR MADRE=TMA.CODMADRE
      =UNLO_PRX("TELS",TMP)
      TT="Listado de Hijos"+;
        CRLF+;
        alltrim(tma.telmadre)+" ("+ALLTRIM(Tma.codmadre)+")"
      ACLA=PAIP+PADC("CODIGO",20)+PAIP+;
        PADC("DESCRIPCION",40)+PAIP+;
        PADC("PROVEEDOR",15)+PAIP
      =XPRN1(4,"TMP","LTMA1()","HIJOS "+ALLTRIM(TMA.TELMADRE),"LTMAHI")
      =OFF_TMP()
      =UNWORK()
      =UNTALK()
   ENDIF
CASE LT_DIJO="Hermanos de ..."
   DO TEL_DO.SPR WITH .T.,3," Listado de Hermanos "
CASE LT_DIJO="Madre de ..."
CASE LT_DIJO="Hu‚rfanos"
   =DOTALK()
   =WORKING()
   SELE TELS
   TMP=GENTMP()
   =FLOCK() .OR. FLOK()
   SORT ON TELA TO (TMP) FOR empty(MADRE)
   =UNLO_PRX("TELS",TMP)
   TT="Listado de Hu‚rfanos"
   ACLA=PAIP+PADC("CODIGO",20)+PAIP+;
     PADC("DESCRIPCION",40)+PAIP+;
     PADC("PROVEEDOR",15)+PAIP
   =XPRN1(4,"TMP","LTMA1()","Huerfanos","LTMAHU")
   =OFF_TMP()
   =UNWORK()
   =UNTALK()
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)

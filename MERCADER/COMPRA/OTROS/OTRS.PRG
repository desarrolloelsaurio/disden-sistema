PROCEDURE OTRS
* TRATARA DE OTROS PRODUCTOS
#DEFINE PAIP   "|"                               && PAIP
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
A_DIJO=ALLTRIM(PROMPT())
=OPPRO()
=OPOTRS()
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE A_DIJO="Presupuesto"
    DO INGPRS.SPR WITH "O"
CASE A_DIJO='Datos Generales'
   ULPRANT=ULPR
   DO OTRO.SPR
CASE A_DIJO='Legajo'
   ULPRANT=ULPR
   DO OTRO_LEG.SPR with .T.
CASE A_DIJO='Stock'
   RESPUESTA="STKOTR#6#25#Men£ de Stock de Otros Productos#3;
#\<Consulta Stock;
#-;
#\<Ajuste Stock de Control;
#-;
#Listado por \<Pantalla;
#Listado por \<Impresora"
   =DEFPOP()
   ON SELE POPU STKOTR DO STKOTR
   ACTI POPU STKOTR
   RELE POPU STKOTR
   ULPR=HORA_ULP(PROGRAM())
CASE A_DIJO='Kardex'
   RESPUESTA='KAROTR#6#25#Men£ de Kardex de Otros Productos#3;
#Listado por \<Pantalla;
#Listado por \<Impresora'
   =DEFPOP()
   ON SELE POPU KAROTR DO KAROTR
   ACTI POPU KAROTR
   RELE POPU KAROTR
   ULPR=HORA_ULP(PROGRAM())
CASE A_DIJO='En qu‚ Orden ?'
   =ENQORDT("O")
CASE A_DIJO='Por Accesorio'
    DO OTR_DO.SPR WITH .T.,1," Listado de Despiece por Accesorio "
CASE A_DIJO="Salida por Orden de Corte"
	DO MOD_STKC.SPR WITH "O"
CASE A_DIJO="Modificaci¢n Stock"
	DO CID.spr WITH .F.,.T.," AJUSTES DE STOCK OTROS PRODUCTOS ",1,"O"
CASE A_DIJO="Presupuesto"
    DO INGPRS.SPR WITH "O"
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)

PROCEDURE STKOTR
* TRATARA DE DISPARAR LOS PROCESOS DE STOCK DE OTRS PROD
STK_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE STK_DIJO="Consulta Stock"
   DO MSTOCK_X.SPR WITH "O", "Otros Productos"
CASE STK_DIJO="Ajuste Stock de Control"
*   DO MODSTKA-.SPR
CASE LEFT(STK_DIJO,7)="Listado"
   RESPUESTA="LSTKOTR#8#35#Men£ de Listado de Stock de "+"Otros Productos"+"#3;
#Stock \<Actual;
#Stock menor que el M¡n\<imo;
#Stock mayor que el M \<ximo;
#Stock menor que \<X;
#\<Punto de Pedido;
#\<Valorizaci¢n;
#\<Totales por Unidad;
#\<Diferencias con Kardex"
   =DEFPOP()
   ON SELE POPU LSTKOTR DO LSTKOTR WITH STK_DIJO=("Listado por Pantalla")
   ACTI POPU LSTKOTR
   RELE POPU LSTKOTR
   ULPR=HORA_ULP(PROGRAM())
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LSTKOTR
PARAMETER PORPX
ULPR=HORA_ULP(PROGRAM())
LST_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LST_DIJO="Stock Actual"
   =OPPRO()
   =OPMDD()
   =OPOTRS()
   ttque="Listado de Stock de Otros Productos"
   DO queryOTR.spr WITH PORPX,.T.,.F.," Stock Actual ",".T."
CASE LST_DIJO="Stock menor que el M¡nimo"
   =OPPRO()
   =OPMDD()
   =OPOTRS()
   ttque="Listado de Stock de Otros Productos"+crlf+;
     "Stock menor que el m¡nimo"
   DO queryOTR.spr WITH porpx,.T.,.F.," Stock Menor que el M¡nimo ","OTRS.STOCK<OTRS.STOCKMIN"
CASE LST_DIJO="Stock mayor que el M ximo"
   =OPPRO()
   =OPMDD()
   =OPOTRS()
   ttque="Listado de Stock de Otros Productos"+crlf+;
     "Stock mayor que el m ximo"
   DO queryOTR.spr WITH PORPX,.T.,.T.,.F.," Stock Mayor que el M ximo ","OTRS.STOCK>OTRS.STOCKMAX"
CASE LST_DIJO="Stock menor que X"
   STORE NUL TO RESPUESTA
   RESPUESTA=INFIC("Cantidad a Listar",999999)
   IF LAST()#27 .AND. !EMPTY(RESPUESTA)
      LACANT=RESPUESTA
      =OPPRO()
      =OPMDD()
      =OPOTRS()
      ttque="Listado de Stock de Otros Productos"+crlf+;
        "Stock menor que "+alltrim(str(lacant))
      DO QUERYOTR.SPR WITH PORPX,.T.,.F.," Stock Menor que "+alltrim(str(lacant)),"OTRS.STOCK<"+alltrim(str(lacant))
   ENDIF
CASE LST_DIJO="Punto de Pedido"
   RESPUESTA="LSTKOTRP#10#45#Men£ de Listado de Stock de Otros Productos - Punto de Pedido#3;
#\<Completo;
#\<Por Proveedor"
   =DEFPOP()
   ON SELE POPU LSTKOTRP DO LPUPED WITH "O",PORPX
   ACTI POPU LSTKOTRP
   RELE POPU LSTKOTRP
   ULPR=HORA_ULP(PROGRAM())
CASE LST_DIJO="Valorizaci¢n"
   RESPUESTA="LSTKOTL#10#45#Men£ de Listado de Valorizaci¢n de Stock de Otros Productos#3;
#Listado \<Detallado;
#Por \<Rubro;
#Por \<Aplicaci¢n;
#Por \<Proveedor;
#Por \<Marca"
   =DEFPOP()
   ON SELE POPU LSTKOTL DO LSTKOTL
   ACTI POPU LSTKOTL
   RELE POPU LSTKOTL
   ULPR=HORA_ULP(PROGRAM())
CASE LST_DIJO="Totales por Unidad"
   RESPUESTA="LSTKTXU#10#45#Men£ de Listado de Valorizaci¢n de Stock de Otros Productos - Totales por Unidad#3;
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
   solodif=.f.
   ULPR="DIFSKOTR"+IIF(PORPX,"P","I")
   =OPOTRS()
   SET ORDER TO TAG OTRCODPRO
   =OPKARS()
   =WORKING()
   =DOTALK()
   SET ORDER TO TAG OTRCODPRO
   sele kars
   set rela to OTRcodpro into OTRs
   =UNWORK()
   =UNTALK()
   IF PORPAN
      REPO form STKAROTR for !empty(OTRcodpro) ;
        PREV
   ELSE
      =IMPRESOR()
      REPO form STKAROTR for !empty(OTRcodpro) ;
        to prin ;
        noconsole noeject
   ENDIF
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LSTKOTL
ULPR=HORA_ULP(PROGRAM())
LS1_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LS1_DIJO="Listado Detallado"
   =OPPRO()
   =OPMDD()
   =OPOTRS()
   ttque="Listado de Stock de Otros Productos"+crlf+;
     "Valorizaci¢n"
   DO queryOTR.spr WITH PORPX,.T.,.F.," Valorizaci¢n ",".T."
CASE LS1_DIJO="Por Rubro"
   DO SVALX WITH PORPX,"O","R","N"
CASE LS1_DIJO="Por Aplicaci¢n"
   DO SVALX WITH PORPX,"O","A","N"
CASE LS1_DIJO="Por Proveedor"
   DO SVALX WITH PORPX,"O","P","N"
CASE LS1_DIJO="Por Marca"
   DO SVALX WITH PORPX,"O","M","N"
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LSTKTXU
ULPR=HORA_ULP(PROGRAM())
LXU_DIJO=ALLTRIM(PROMPT())
RESPUESTA="LSTKTXU1#12#55#Tipo de Listado de Valorizaci¢n de Stock de Otros Productos - Totales por Unidad#3;
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
   DO SVALX WITH PORPX,"O","R",LXU1_DIJO
CASE LXU_DIJO="Por Aplicaci¢n"
   DO SVALX WITH PORPX,"O","A",LXU1_DIJO
CASE LXU_DIJO="Por Proveedor"
   DO SVALX WITH PORPX,"O","P",LXU1_DIJO
CASE LXU_DIJO="Por Marca"
   DO SVALX WITH PORPX,"O","M",LXU1_DIJO
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE KAROTR
K_DIJO=ALLTRIM(PROMPT())
RESPUESTA='LKAROTR#8#35#Men£ de Listado de Kardex de Otros Productos#3;
#\<Ingresos del D¡a;
#\<Consumos del D¡a;
#Consumos \<Mensuales;
#Art¡culos \<Sin Consumo;
#Stock \<Hist¢rico'
=DEFPOP()
ON SELE POPU LKAROTR DO LKAROTR WITH (K_DIJO="Listado por Pantalla")
ACTI POPU LKAROTR
RELE POPU LKAROTR
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)

PROCEDURE LKAROTR
PARAMETER PORPX
ULPR=HORA_ULP(PROGRAM())
LK_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LK_DIJO="Ingresos del D¡a"
   RESPUESTA='LIND#10#45#Listado de Ingresos Diarios de Otros Productos#3;
#Fecha de \<Documento;
#Fecha de \<Alta'
   =DEFPOP()
   ON SELE POPU LIND DO LIND
   ACTI POPU LIND
   RELE POPU LIND
   ULPR=HORA_ULP(PROGRAM())
CASE LK_DIJO="Consumos del D¡a"
   RESPUESTA='LCOND#10#45#Listado de Consumos Diarios de Otros Productos#3;
#Por \<Art¡culo;
#Por \<Remito;
#Por \<Orden de Corte'
   =DEFPOP()
   ON SELE POPU LCOND DO LCOND
   ACTI POPU LCOND
   RELE POPU LCOND
   ULPR=HORA_ULP(PROGRAM())
CASE LK_DIJO="Consumos Mensuales"
   RESPUESTA='LCONSM#10#45#Listado de Consumos Mensuales de Otros Productos#3;
#\<Consumo Mensual;
#\<Valorizado;
#-;
#Un \<Proveedor;
#Un Pro\<veedor Valorizado;
#Res\<umen Valorizado por Proveedor;
#-;
     Un \<Otro Producto'
   =DEFPOP()
   ON SELE POPU LCONSM DO LCONSM
   ACTI POPU LCONSM
   RELE POPU LCONSM
   ULPR=HORA_ULP(PROGRAM())
CASE LK_DIJO="Art¡culos Sin Consumo"
   DO SINCONSU WITH PORPX,"O",.T.
CASE LK_DIJO="Stock Hist¢rico"
   DO STKHIS WITH PORPX,1
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LIND
ULPR=HORA_ULP(PROGRAM())
LKI_DIJO=ALLTRIM(PROMPT())
RESPUESTA='LIND1#12#55#Ingresos Diarios de Otros Productos -'+LKI_DIJO+' #3;
#Por \<Art¡culo;
#Por Orden de Re\<querimiento'
=DEFPOP()
ON SELE POPU LIND1 DO RESP1
ACTI POPU LIND1
RELE POPU LIND1
LK1=ALLTRIM(PROMPT())
DO CASE
CASE LKI_DIJO="Fecha de Documento"
   DO INGDIA WITH PORPX,"O",.F.,IIF(LK1="Por Art¡culo",1,2)
CASE LKI_DIJO="Fecha de Alta"
   DO INGDIA WITH PORPX,"O",.F.,IIF(LK1="Por Art¡culo",1,2),.T.
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LCOND
ULPR=HORA_ULP(PROGRAM())
LC_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LC_DIJO="Por Art¡culo"
   DO INGDIA WITH PORPX,"O",.T.,1
CASE LC_DIJO="Por Remito"
   DO INGDIA WITH PORPX,"O",.T.,3
CASE LC_DIJO="Por Orden de Corte"
   DO INGDIA WITH PORPX,"O",.T.,2
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LCONSM
ULPR=HORA_ULP(PROGRAM())
LC_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LC_DIJO="Consumo Mensual"
   DO CONSMES WITH PORPX,"O"
CASE LC_DIJO="Valorizado"
   DO CONSMES WITH PORPX,"O",.T.
CASE LC_DIJO="Un Proveedor Valorizado"
   =OPPRO()
   DO WHILE ELIPRO()
      DO CONSMES WITH PORPX,"O",.T.,.T.
   ENDDO
CASE LC_DIJO="Un Proveedor"
   =OPPRO()
   STORE NUL TO M.RESPUESTA
   DO WHILE ELIPRO()
      DO CONSMES WITH PORPX,"O",.F.,.T.
      STORE NUL TO M.RESPUESTA
   ENDDO
CASE LC_DIJO="Resumen Valorizado por Proveedor"
   DO CONSPROV WITH PORPX
CASE LC_DIJO="Un Otro Producto"
   DO CONSOTR WITH PORPX,"O"
ENDCASE
RETURN MEN_LIN(BOTOM)

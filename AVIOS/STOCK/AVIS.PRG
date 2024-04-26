PROCEDURE AVIS
* DISPARA PROCEDIMIENTOS DE AVIOS
* MODIFICACION 25/10/95 FUERZA EL PROMPT EN CASO DE LEYENDAS POCO ESPECIFICAS
*   TALES COMO "UN AVIO"
#DEFINE PAIP   "|"                               && PAIP
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE NUL    0                                 && NUL
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
PARAMETER DIJO_FUERZA
A_DIJO=IIF(EMPTY(DIJO_FUERZA),ALLTRIM(PROMPT()),DIJO_FUERZA)
=OPPRO()
=OPAVIS()
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE A_DIJO='Datos Generales'
   ULPRANT=ULPR
   DO AVI.SPR
CASE A_DIJO='Legajo'
   ULPRANT=ULPR
   DO AVI_LEG.SPR with .T.
CASE A_DIJO='Caracter¡sticas'
   DO AVI_DO.SPR with .f.,3," Gesti¢n de Caracter¡sticas "
CASE A_DIJO='Stock'
   RESPUESTA="STKAVI#6#25#Men£ de Stock de "+abios+"#3;
#\<Consulta Stock;
#Stock por \<Madre;
#-;
#\<Ajuste Stock de Control;
#-;
#Listado por \<Pantalla;
#Listado por \<Impresora"
   =DEFPOP()
   ON SELE POPU STKAVI DO STKAVI
   ACTI POPU STKAVI
   RELE POPU STKAVI
   ULPR=HORA_ULP(PROGRAM())
CASE A_DIJO='Kardex'
   RESPUESTA='KARAVI#6#25#Men£ de Kardex de '+abios+'#3;
#Listado por \<Pantalla;
#Listado por \<Impresora'
   =DEFPOP()
   ON SELE POPU KARAVI DO KARAVI
   ACTI POPU KARAVI
   RELE POPU KARAVI
   ULPR=HORA_ULP(PROGRAM())
CASE A_DIJO='En qu‚ Orden ?'
   =ENQORDT("A")
CASE A_DIJO='Por Accesorio'
    DO AVI_DO.SPR WITH .T.,1," Listado de Despiece por Accesorio "
CASE A_DIJO="Salida por Orden de Corte"
	DO MOD_STKA.SPR WITH "A",.T.,"X"
CASE A_DIJO=="Ajuste Stock s¢lo Stock"
	DO MOD_STKA.SPR WITH "A",.F.,"S"
CASE A_DIJO=="Ajuste Stock s¢lo Kardex"
	DO MOD_STKA.SPR WITH "A",.F.,"K"
CASE A_DIJO=="Modificaci¢n Stock"
	DO CID.spr WITH .F.,.T.," AJUSTES DE STOCK AVIOS ",1,"A"
CASE A_DIJO="Presupuesto"
    DO INGPRS.SPR WITH "A"
ENDCASE
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)

PROCEDURE STKAVI
* TRATARA DE DISPARAR LOS PROCESOS DE STOCK DE AVIOS
STK_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE STK_DIJO="Consulta Stock"
   DO MSTOCK_X.SPR WITH "A","Av¡os"
CASE STK_DIJO="Ajuste Stock de Control"
   DO MODSTKA-.SPR
CASE LEFT(STK_DIJO,7)="Listado"
   RESPUESTA="LSTKAVI#8#35#Men£ de Listado de Stock de "+abios+"#3;
#Stock \<Actual;
#Stock menor que el M¡n\<imo;
#Stock mayor que el M \<ximo;
#Stock menor que \<X;
#\<Punto de Pedido;
#\<Valorizaci¢n;
#\<Totales por Unidad;
#-;
#Stock \<Virtual;
#\<Diferencias con Kardex"
   =DEFPOP()
   ON SELE POPU LSTKAVI DO LSTKAVI WITH STK_DIJO=("Listado por Pantalla")
   ACTI POPU LSTKAVI
   RELE POPU LSTKAVI
   ULPR=HORA_ULP(PROGRAM())
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LSTKAVI
PARAMETER PORPX
ULPR=HORA_ULP(PROGRAM())
LST_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LST_DIJO="Stock Virtual"
   =OPPRO()
   =OPMDD()
   =OPAVIS()
   ttque="Listado de Stock Virtual de Av¡os"
   DO queryavi.spr WITH PORPX,.T.,.F.," Stock Virtual ",".T.",.F.,.T.
CASE LST_DIJO="Stock Actual"
   =OPPRO()
   =OPMDD()
   =OPAVIS()
   ttque="Listado de Stock de Av¡os"
   DO queryavi.spr WITH PORPX,.T.,.F.," Stock Actual ",".T."
CASE LST_DIJO="Stock menor que el M¡nimo"
   =OPPRO()
   =OPMDD()
   =OPAVIS()
   ttque="Listado de Stock de Av¡os"+crlf+;
     "Stock menor que el m¡nimo"
   DO queryavi.spr WITH porpx,.T.,.F.," Stock Menor que el M¡nimo ","AVIS.STOCK<AVIS.STOCKMIN"
CASE LST_DIJO="Stock mayor que el M ximo"
   =OPPRO()
   =OPMDD()
   =OPAVIS()
   ttque="Listado de Stock de Av¡os"+crlf+;
     "Stock mayor que el m ximo"
   DO queryavi.spr WITH PORPX,.T.,.T.,.F.," Stock Mayor que el M ximo ","AVIS.STOCK>AVIS.STOCKMAX"
CASE LST_DIJO="Stock menor que X"
   STORE NUL TO RESPUESTA
   RESPUESTA=INFIC("Cantidad a Listar",999999)
   IF LAST()#27 .AND. !EMPTY(RESPUESTA)
      LACANT=RESPUESTA
      =OPPRO()
      =OPMDD()
      =OPAVIS()
      ttque="Listado de Stock de Av¡os"+crlf+;
        "Stock menor que "+alltrim(str(lacant))
      DO QUERYAVI.SPR WITH PORPX,.T.,.F.," Stock Menor que "+alltrim(str(lacant)),"AVIS.STOCK<"+alltrim(str(lacant))
   ENDIF
CASE LST_DIJO="Punto de Pedido"
   RESPUESTA="LSTKAVIP#10#45#Men£ de Listado de Stock de "+abios+"- Punto de Pedido#3;
#\<Completo;
#\<Por Proveedor"
   =DEFPOP()
   ON SELE POPU LSTKAVIP DO LPUPED WITH "A",PORPX
   ACTI POPU LSTKAVIP
   RELE POPU LSTKAVIP
   ULPR=HORA_ULP(PROGRAM())
CASE LST_DIJO="Valorizaci¢n"
   RESPUESTA="LSTKAVL#10#45#Men£ de Listado de Valorizaci¢n de Stock de '+abios+'#3;
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
   RESPUESTA="LSTKTXU#10#45#Men£ de Listado de Valorizaci¢n de Stock de '+abios+' - Totales por Unidad#3;
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
   RESPUESTA="DIFCKAR#10#45#Listado de Diferencias con Kardex - '+abios+'#3;
#\<Completo;
#\<S¢lo Diferencias"
=defpop()
ON SELE POPU DIFCKAR DO DIFCKAR WITH "A",BAR()=2
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
   =OPAVIS()
   ttque="Listado de Stock de Av¡os"+crlf+;
     "Valorizaci¢n"
   DO queryavi.spr WITH PORPX,.T.,.F.," Valorizaci¢n ",".T."
CASE LS1_DIJO="Por Rubro"
   DO SVALX WITH PORPX,"A","R","T"
CASE LS1_DIJO="Por Aplicaci¢n"
   DO SVALX WITH PORPX,"A","A","T"
CASE LS1_DIJO="Por Proveedor"
   DO SVALX WITH PORPX,"A","P","T"
CASE LS1_DIJO="Por Marca"
   DO SVALX WITH PORPX,"A","M","T"
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LSTKTXU
ULPR=HORA_ULP(PROGRAM())
LXU_DIJO=ALLTRIM(PROMPT())
RESPUESTA="LSTKTXU1#12#55#Tipo de Listado de Valorizaci¢n de Stock de '+abios+' - Totales por Unidad#3;
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
   DO SVALX WITH PORPX,"A","R",LXU1_DIJO
CASE LXU_DIJO="Por Aplicaci¢n"
   DO SVALX WITH PORPX,"A","A",LXU1_DIJO
CASE LXU_DIJO="Por Proveedor"
   DO SVALX WITH PORPX,"A","P",LXU1_DIJO
CASE LXU_DIJO="Por Marca"
   DO SVALX WITH PORPX,"A","M",LXU1_DIJO
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE KARAVI
K_DIJO=ALLTRIM(PROMPT())
RESPUESTA='LKARAVI#8#35#Men£ de Listado de Kardex de '+abios+'#3;
#\<Ingresos del D¡a;
#\<Consumos del D¡a;
#Consumos \<Mensuales;
#Art¡culos \<Sin Consumo;
#Stock \<Hist¢rico'
=DEFPOP()
ON SELE POPU LKARAVI DO LKARAVI WITH (K_DIJO="Listado por Pantalla")
ACTI POPU LKARAVI
RELE POPU LKARAVI
ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LKARAVI
PARAMETER PORPX
ULPR=HORA_ULP(PROGRAM())
LK_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LK_DIJO="Ingresos del D¡a"
   RESPUESTA='LIND#10#45#Listado de Ingresos Diarios de '+abios+'#3;
#Fecha de \<Documento;
#Fecha de \<Alta'
   =DEFPOP()
   ON SELE POPU LIND DO LIND
   ACTI POPU LIND
   RELE POPU LIND
   ULPR=HORA_ULP(PROGRAM())
CASE LK_DIJO="Consumos del D¡a"
   RESPUESTA='LCOND#10#45#Listado de Consumos Diarios de '+abios+'#3;
#Por \<Art¡culo;
#Por \<Remito;
#Por \<Orden de Corte'
   =DEFPOP()
   ON SELE POPU LCOND DO LCOND
   ACTI POPU LCOND
   RELE POPU LCOND
   ULPR=HORA_ULP(PROGRAM())
CASE LK_DIJO="Consumos Mensuales"
   RESPUESTA='LCONSM#10#45#Listado de Consumos Mensuales de '+abios+'#3;
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
   DO SINCONSU WITH PORPX,"A",.T.
CASE LK_DIJO="Stock Hist¢rico"
   DO STKHIS WITH PORPX,1
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LIND
ULPR=HORA_ULP(PROGRAM())
LKI_DIJO=ALLTRIM(PROMPT())
RESPUESTA='LIND1#12#55#Ingresos Diarios de '+abios+' -'+LKI_DIJO+' #3;
#Por \<Art¡culo;
#Por Orden de Re\<querimiento'
=DEFPOP()
ON SELE POPU LIND1 DO RESP1
ACTI POPU LIND1
RELE POPU LIND1
LK1=ALLTRIM(PROMPT())
DO CASE
CASE LKI_DIJO="Fecha de Documento"
   DO INGDIA WITH PORPX,"A",.F.,IIF(LK1="Por Art¡culo",1,2)
CASE LKI_DIJO="Fecha de Alta"
   DO INGDIA WITH PORPX,"A",.F.,IIF(LK1="Por Art¡culo",1,2),.T.
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LCOND
ULPR=HORA_ULP(PROGRAM())
LC_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LC_DIJO="Por Art¡culo"
   DO INGDIA WITH PORPX,"A",.T.,1
CASE LC_DIJO="Por Remito"
   DO INGDIA WITH PORPX,"A",.T.,3
CASE LC_DIJO="Por Orden de Corte"
   DO INGDIA WITH PORPX,"A",.T.,2
ENDCASE
RETURN MEN_LIN(BOTOM)
 
PROCEDURE LCONSM
ULPR=HORA_ULP(PROGRAM())
LC_DIJO=ALLTRIM(PROMPT())
DO CASE
CASE LC_DIJO="Consumo Mensual"
   DO CONSMES WITH PORPX,"A"
CASE LC_DIJO="Valorizado"
   DO CONSMES WITH PORPX,"A",.T.
CASE LC_DIJO="Un Proveedor Valorizado"
   =OPPRO()
   DO WHILE ELIPRO()
      DO CONSMES WITH PORPX,"A",.T.,.T.
   ENDDO
CASE LC_DIJO="Un Proveedor"
   =OPPRO()
   STORE NUL TO M.RESPUESTA   
   DO WHILE ELIPRO()
      DO CONSMES WITH PORPX,"A",.F.,.T.
      STORE NUL TO M.RESPUESTA
   ENDDO
CASE LC_DIJO="Resumen Valorizado por Proveedor"
   DO CONSPROV WITH PORPX
CASE LC_DIJO="Un Av¡o"
   DO CONSAVI WITH PORPX,"A"
ENDCASE
RETURN MEN_LIN(BOTOM)

*       浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
*       � 07/24/95              STOCK.PRG               12:41:06  �
*       麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
*       � Author's Name: G. REINER                                �
*       � Description:   MENU DE COMPRAS/STOCK                    �
*       � This program was almost automatically generated by      �
*       � GENMENU, UND GOYO'S HELP                                �
*       藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
=SETEOS()
EXTERNAL PROCEDURE NADA.PRG
STORE "Stock Materia Prima" TO SSTM
STORE "STOCK" TO SSTM2
STORE "PILCHAS" TO SSTM1
STOR 36 TO rh
STOR 47 TO rp
STOR 'Accesorio' TO abio
STOR 'Accesorios' TO abios
STOR 'Material' TO tella
STOR 'Materiales' TO tellas
STOR "Color" to zuela
Stor "Colores" to zuelas
JANNAME="NASA"

=GETPATH()
STORE "GOYO" TO  M.USADOR
STORE 1 TO M.COEFSEG
STORE 80 TO M.XACANCHO,M.XACHOJA,M.LARGO,M.LARGOIM
STORE 10 TO M.XACDIGI
ULPR=PROGRAM()
***
=VAR_TAL()
=VAR_TMA()
STORE .T. TO TALPOP
STORE .T. TO TMAPOP
STORE 0 TO TALPOPR, TALPOPC
=VAR_AVI()
=var_apl()
=VAR_TEL()
STORE .T. TO AVIPOP
STORE .T. TO TELPOP
=VAR_MDD()
=VAR_MER()
=VAR_COR()
=VAR_DNI()
=VAR_CAG()
=VAR_PRC()
STORE .T. TO CAGPOP
=VAR_PAG()
STORE .T. TO PAGPOP
STORE 0 TO PAGPOPR, PAGPOPC
=VAR_PRO()
=VAR_CIU()
=VAR_CPRA()
=VAR_PRO()
=VAR_IVA()
=VAR_CIU()
=var_prv()
=VAR_SUE()
=VAR_RUB()
=VAR_RUS()
=VAR_SRU()
=VAR_OTRS()
=VAR_MAR()
STORE .T. TO RUBPOP
RELE XAUSS,XADOLS
PUBL XAUSS,XADOLS
***
COEFSEG=VAL(GETENV("COEFSEG"))
USADOR=GETENV("USERNAME")
DO CASE
CASE FILE("F:\USR\"+GETENV("USERNAME")+"\POSICSTK.MEM")
	REST FROM ("F:\USR\"+GETENV("USERNAME")+"\POSICSTK.MEM") ADDI
CASE FILE("C:\PUBLIC\"+GETENV("USERNAME")+"\POSICSTK.MEM")
	REST FROM ("C:\PUBLIC\"+GETENV("USERNAME")+"\POSICSTK.MEM") ADDI
OTHERWISE
	REST FROM POSICSTK ADDI
ENDCASE
=GETPATH()
IF ALLTRIM(USADOR)="GOYO"
	SET ESCA ON
ENDIF

***
USADOR=GETENV("USERNAME")
DO OPAUD
DO OPDOC
DO OPSEG
=OPMIX()
ORDTELS=iif(GETNU1(PADR(USADOR,10)+PADR("ORDTELS",20),"FOXPER")=0,.F.,.T.)
ORDAVIS=iif(GETNU1(PADR(USADOR,10)+PADR("ORDAVIS",20),"FOXPER")=0,.F.,.T.)
ORDCOMS=iif(GETNU1(PADR(USADOR,10)+PADR("ORDCOMS",20),"FOXPER")=0,.F.,.T.)
ORDOTRS=iif(GETNU1(PADR(USADOR,10)+PADR("ORDOTRS",20),"FOXPER")=0,.F.,.T.)
ORDPRO=iif(GETNU1(PADR(USADOR,10)+PADR("ORDPRO",20),"FOXPER")=0,.F.,.T.)
ORDRUB=iif(GETNU1(PADR(USADOR,10)+PADR("ORDRUB",20),"FOXPER")=0,.F.,.T.)
XACDIGI=GETNU1(PADR(USADOR,10)+PADR("XACDIGI",20),"FOXPER")
RELE SUCU
SUCU="0000"
* Inserted from DEFINES.PRG
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE FOLC  ".F."                              && FOLC
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE FOLL  .F.                                && FOLL
#DEFINE TRUC  ".T."                              && TRUC
#DEFINE TRUL  .T.                                && TRUL
#DEFINE IMPRIMIENDO  PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'�') && IMPRIMIENDO
#DEFINE ELYES  "SI"                              && ELYES
#DEFINE ELNOU  "NO"                              && ELNOU
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE THREE  3                                 && THREE
#DEFINE FOUR   4                                 && FOUR
#DEFINE TEX_EFES " - [F2] Popup - [F3] B�squeda" && TEX_EFES
#DEFINE TEX_CALC "CALCULANDO - ESPERE POR FAVOR" && TEX_CALC
#DEFINE GRABANDO PADC(' Grabando los datos ingresados - Espere por Favor ',80,"�")
#DEFINE NOVACIO "CAMPO DE INGRESO OBLIGATORIO - NO PUEDE ESTAR VACIO" && NOVACIO
#DEFINE NOFECHA "LAS FECHAS ESTAN ENTRE VALORES INACEPTABLES" && NOFECHA
#DEFINE ESPAOPC " - Barra Espac. para cambiar de Opci�n" && ESPAOPC
#DEFINE ESCANUL " - [ESC] para Anular"           && ESCANUL
#DEFINE ESCAMEN " - [ESC] para Men�"             && ESCAMEN
#DEFINE ESCAFIN " - [ESC] para Fin"              && ESCAFIN
#DEFINE NOACVAL "LOS VALORES INGRESADOS ESTAN ENTRE LIMITES INACEPTABLES" && NOACVAL
#DEFINE CONTIX  " Continuaci�n"                  && CONTIX
#DEFINE RH      36                               && RH
#DEFINE RP 47                                    && RP
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
#DEFINE ORQ      "Orden de Requerimiento"        && ORQ
#DEFINE ORQS     "Ordenes de Requerimiento"      && ORQS
#DEFINE NOSEL "NO SE HA SELECCIONADO"            && NOSEL
#DEFINE PIC30 "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"   && PIC30
#DEFINE T_REINGRE "Reingrese el DATO"            && T_REINGRE
*       浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
*       �                      Menu Definition                    �
*       藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
DEFI MENU main MESS 'MENU PRINCIPAL - SISTEMA DE CONTROL Compras/Stock' shad colo sche 3
DEFI PAD VARI OF MAIN PROM "\<Varios" COLO SCHE 3 AT 1,0
DEFI PAD PROVEE OF MAIN PROM "\<Proveedor" COLO SCHE 3 AT 1,8
DEFI PAD MPRIM OF MAIN PROM "\<Mat. Prima" COLO SCHE 3 AT 1,19
DEFI PAD OREQ OF MAIN PROM "\<O. Req." COLO SCHE 3 AT 1,31
DEFI PAD REMTO OF MAIN PROM "\<Remito" COLO SCHE 3 AT 1,40
DEFI PAD KRDEX OF MAIN PROM "\<Kardex" COLO SCHE 3 AT 1,48
DEFI PAD VRIAB OF MAIN PROM "Var\<iable" COLO SCHE 3 AT 1,56
DEFI PAD CHAU OF MAIN PROM "\<Chau" COLO SCHE 3 AT 1,66

ON PAD VARI OF MAIN ACTI POPU varios
ON PAD PROVEE OF MAIN ACTI POPU proveedor
ON PAD MPRIM OF MAIN ACTI POPU matpriMA
ON PAD OREQ OF MAIN ACTI POPU oreq
ON PAD REMTO OF MAIN ACTI POPU remito
ON PAD KRDEX OF MAIN ACTI POPU kardex
ON PAD VRIAB OF MAIN ACTI POPU variable
ON SELE PAD CHAU OF MAIN DO ADIOS.PRG

************ VARIOS
DEFINE POPU varios from 2,0 MARGIN SHAD COLO SCHE 4 RELA
DEFI BAR 1 OF varios PROM "\<Aplicaciones"
DEFI BAR 2 OF varios PROM "\<Ciudades"
DEFI BAR 3 OF varios PROM "Co\<lores"
DEFI BAR 4 OF varios PROM "C\<ondiciones de IVA"
DEFI BAR 5 OF varios PROM "Co\<ndici�n de Pago"
DEFI BAR 6 OF varios PROM "\<Provincias"
DEFI BAR 7 OF varios PROM "\<Rubros"
DEFI BAR 8 OF varios PROM "\<Tipo de Documento"
DEFI BAR 9 OF varios PROM "\<Unidades"
DEFI BAR 10 OF varios PROM "A\<grupaci�n"
DEFI BAR 11 OF varios PROM "Control de \<Impresoras"
DEFI BAR 12 OF varios PROM "CANCEL" ;
	KEY CTRL+F12, "CTRL+F12" ;
	SKIP FOR GETENV("USERNAME")#"GOYO" .AND. GETENV("USERNAME")#"BATA"
DEFI BAR 13 OF varios PROM "SUSPEND" ;
	KEY CTRL+F11, "CTRL+F11" ;
	SKIP FOR GETENV("USERNAME")#"GOYO" .AND. GETENV("USERNAME")#"BATA"

ON SELE BAR 1 OF varios DO APL
ON SELE BAR 2 OF varios DO DS_CIU
ON SELE BAR 3 OF varios DO SUE
ON SELE BAR 4 OF varios DO IVA
ON SELE BAR 5 OF varios DO pag
ON SELE BAR 6 OF varios DO PRV
ON BAR 6 OF varios ACTI POPU rubros
ON SELE BAR 8 OF varios DO DNI
ON SELE BAR 9 OF varios DO MDD
ON SELE BAR 10 OF varios DO CAG
ON SELE BAR 11 OF varios =OPCIMP()
ON SELE BAR 12 OF varios CANCEL
ON SELE BAR 13 OF varios DO _r260r6tf3

DEFINE POPU rubros MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF rubros PROM "\<Mercader�as"
DEFI BAR 2 OF rubros PROM "M\<aterias Primas"
ON SELE BAR 1 OF rubros DO RUB
ON BAR 2 OF rubros ACTI POPU materiaspr

DEFINE POPU materiaspr MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF materiaspr PROM "\<Rubros"
DEFI BAR 2 OF materiaspr PROM "\<Subrubros"
ON SELE BAR 1 OF materiaspr DO RUS
ON SELE BAR 2 OF materiaspr DO SRU.SPR


DEFINE POPU proveedor MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF proveedor PROM "Datos \<Administrativos"
DEFI BAR 2 OF proveedor PROM "\<Legajo"
DEFI BAR 3 OF proveedor PROM "A\<grupaci�n"
DEFI BAR 4 OF proveedor PROM "Datos de \<Producci�n"
DEFI BAR 5 OF proveedor PROM "Pres\<upuestos"
DEFI BAR 6 OF proveedor PROM "\-" SKIP FOR .T.
DEFI BAR 7 OF proveedor PROM "L\<istado de Art�culos"

ON SELE BAR 1 OF proveedor DO PRO
ON SELE BAR 2 OF proveedor DO PRO
ON SELE BAR 3 OF proveedor DO PRO
ON SELE BAR 4 OF proveedor DO TALS
ON SELE BAR 5 OF proveedor DO PRO
ON SELE BAR 7 OF proveedor DO LPROART

*******************
DEFINE POPU matprima MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF matprima PROM "\<Av�os"
DEFI BAR 2 OF matprima PROM "\<Telas"
DEFI BAR 3 OF matprima PROM "\<Productos Terminados"
DEFI BAR 4 OF matprima PROM "\<Otros Productos"

ON BAR 1 OF matprima ACTI POPU av�os
ON BAR 2 OF matprima ACTI POPU telas
ON BAR 3 OF matprima ACTI POPU productost
ON BAR 4 OF matprima ACTI POPU otrosprodu

DEFINE POPU av�os MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF av�os PROM "\<Datos Generales"
DEFI BAR 2 OF av�os PROM "Lega\<jo"
DEFI BAR 13 OF av�os AFTER 2 PROM "Pres\<upuesto"
DEFI BAR 3 OF av�os PROM "\-"   						SKIP FOR .T.
DEFI BAR 4 OF av�os PROM "Salida por Orden de Corte"
DEFI BAR 5 OF av�os PROM "\<Modificaci�n Stock"
DEFI BAR 6 OF av�os PROM "\-" 						 	SKIP FOR .T.
DEFI BAR 7 OF av�os PROM "\<Stock"
DEFI BAR 8 OF av�os PROM "\<Kardex"
DEFI BAR 9 OF av�os PROM "\<En qu� Orden ?" 		 	KEY ALT+A, "ALT+A"
DEFI BAR 10 OF av�os PROM "\-"   					 	SKIP FOR .T.
DEFI BAR 11 OF av�os PROM "Ajus\<te Stock s�lo Kardex"  SKIP FOR !esjefe()
DEFI BAR 12 OF av�os PROM "Ajuste St\<ock s�lo Stock"   SKIP FOR !ESJEFE()
ON SELE POPU av�os DO AVIS

DEFINE POPU telas MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF telas PROM "\<Datos Generales"
DEFI BAR 2 OF telas PROM "Lega\<jo"
DEFI BAR 13 OF telas AFTER 2 PROM "Pres\<upuesto"
DEFI BAR 14 OF telas AFTER 13 PROM "\<Caracter�sticas"
DEFI BAR 3 OF telas PROM "\-" SKIP FOR .T.
DEFI BAR 4 OF telas PROM "Salida por Orden de \<Corte"
DEFI BAR 5 OF telas PROM "\<Modificaci�n Stock"
DEFI BAR 6 OF telas PROM "\-" SKIP FOR .T.
DEFI BAR 7 OF telas PROM "\<Stock"
DEFI BAR 8 OF telas PROM "\<Kardex"
DEFI BAR 9 OF telas PROM "\<En qu� Orden ?" KEY ALT+T, "ALT+T"
DEFI BAR 10 OF telas PROM "\-" SKIP FOR .T.
DEFI BAR 11 OF telas PROM "Ajus\<te Stock s�lo Kardex" SKIP FOR !ESJEFE()
DEFI BAR 12 OF telas PROM "Ajuste St\<ock s�lo Stock"  SKIP FOR !ESJEFE()
ON SELE POPU telas DO TELS

DEFINE POPU productost MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF productost PROM "\<Datos Generales"
DEFI BAR 2 OF productost PROM "Lega\<jo"
DEFI BAR 9 OF productost AFTER 2 PROM "Pres\<upuesto"
DEFI BAR 3 OF productost PROM "\-" SKIP FOR .T.
DEFI BAR 4 OF productost PROM "\<Modificaci�n Stock"
DEFI BAR 5 OF productost PROM "\-" SKIP FOR .T.
DEFI BAR 6 OF productost PROM "\<Stock"
DEFI BAR 7 OF productost PROM "\<Kardex"
DEFI BAR 8 OF productost PROM "\<En qu� Orden ?" KEY ALT+C, "ALT+C"

ON SELE BAR 1 OF productost DO CPRA.SPR
ON SELE BAR 2 OF productost DO CPRA_LEG.SPR with .T.
ON SELE BAR 4 OF productost DO CID.spr WITH .F.,.T.," AJUSTES DE STOCK PRODUCTOS TERMINADOS ",1,"C"
ON BAR 6 OF productost ACTI POPU STKCOM
ON BAR 7 OF productost ACTI POPU _qyw0yffel
ON SELE BAR 8 OF productost DO ENQORDT WITH "C"
ON SELE BAR 9 OF productost DO INGPRS.SPR WITH "C"

DEFINE POPU STKCOM MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF STKCOM PROM "\<Consulta Stock" KEY CTRL+C, "CTRL+C"
DEFI BAR 2 OF STKCOM PROM "\-" 				 SKIP FOR .T.
DEFI BAR 3 OF STKCOM PROM "\<Ajuste Stock de Control"		 SKIP FOR .T.
DEFI BAR 4 OF STKCOM PROM "\-" 				 SKIP FOR .T.
DEFI BAR 5 OF STKCOM PROM "Listado por \<Pantalla"
DEFI BAR 6 OF STKCOM PROM "Listado por \<Impresora"

ON SELE BAR 1 OF STKCOM DO MSTOCK_X.SPR WITH "C", "Productos Terminados"
ON BAR 5 OF STKCOM ACTI POPU LISTKCOM
ON BAR 6 OF STKCOM ACTI POPU LISIKCOM

DEFINE POPU LISTKCOM MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF LISTKCOM PROM "Stock \<Actual"
DEFI BAR 2 OF LISTKCOM PROM "Stock menor que el M�n\<imo"
DEFI BAR 3 OF LISTKCOM PROM "Stock mayor que el m�\<ximo"
DEFI BAR 4 OF LISTKCOM PROM "Stock menor que \<X"
DEFI BAR 5 OF LISTKCOM PROM "\<Punto de Pedido"
DEFI BAR 6 OF LISTKCOM PROM "\<Valorizaci�n"
DEFI BAR 7 OF LISTKCOM PROM "\<Totales por Unidad"
*****DEFI BAR 8 OF LISTKCOM PROM "\<Diferencias con Kardex"
ON SELE BAR 1 OF LISTKCOM DO QUECOMP1
ON SELE BAR 2 OF LISTKCOM DO QUECOMP2
ON SELE BAR 3 OF LISTKCOM DO QUECOMP3
ON SELE BAR 4 OF LISTKCOM DO QUECOMP4
ON BAR 5 OF LISTKCOM ACTI POPU QUECOMP5
ON BAR 6 OF LISTKCOM ACTI POPU valorizCOM
ON BAR 7 OF LISTKCOM ACTI POPU totalesCOM
*****ON SELE BAR 8 OF LISTKCOM DO QUECOMP8

DEFINE POPU QUECOMP5 MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF QUECOMP5 PROM "\<Completo"
DEFI BAR 2 OF QUECOMP5 PROM "\<Por Proveedor"
ON SELE BAR 1 OF QUECOMP5 DO LPUPED WITH "C",.T.

DEFINE POPU VALORIZCOM MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF VALORIZCOM PROM "Listado \<Detallado"
DEFI BAR 2 OF VALORIZCOM PROM "Por \<Rubro"
DEFI BAR 3 OF VALORIZCOM PROM "Por \<Aplicaci�n"
DEFI BAR 4 OF VALORIZCOM PROM "Por \<Proveedor"
DEFI BAR 5 OF VALORIZCOM PROM "Por \<Marca"

ON SELE BAR 1 OF VALORIZCOM DO VALCOMCOM
ON SELE BAR 2 OF VALORIZCOM DO SVALX WITH .T.,"C","R"
ON SELE BAR 3 OF VALORIZCOM DO SVALX WITH .T.,"C","A"
ON SELE BAR 4 OF VALORIZCOM DO SVALX WITH .T.,"C","P"
ON SELE BAR 5 OF VALORIZCOM DO SVALX WITH .T.,"C","M"

DEFINE POPU TOTALESCOM MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF TOTALESCOM PROM "Por \<Rubro"
DEFI BAR 2 OF TOTALESCOM PROM "Por \<Aplicaci�n"
DEFI BAR 3 OF TOTALESCOM PROM "Por \<Proveedor"
DEFI BAR 4 OF TOTALESCOM PROM "Por \<Marca"
ON SELE BAR 1 OF TOTALESCOM DO SVALX WITH .T.,"C","R",.T.
ON SELE BAR 2 OF TOTALESCOM DO SVALX WITH .T.,"C","A",.T.
ON SELE BAR 3 OF TOTALESCOM DO SVALX WITH .T.,"C","P",.T.
ON SELE BAR 4 OF TOTALESCOM DO SVALX WITH .T.,"C","M",.T.

********************************
DEFINE POPU LISIKCOM MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF LISIKCOM PROM "Stock \<Actual"
DEFI BAR 2 OF LISIKCOM PROM "Stock menor que el M�n\<imo"
DEFI BAR 3 OF LISIKCOM PROM "Stock mayor que el m�\<ximo"
DEFI BAR 4 OF LISIKCOM PROM "Stock menor que \<X"
DEFI BAR 5 OF LISIKCOM PROM "\<Punto de Pedido"
DEFI BAR 6 OF LISIKCOM PROM "\<Valorizaci�n"
DEFI BAR 7 OF LISIKCOM PROM "\<Totales por Unidad"
*****DEFI BAR 8 OF LISIKCOM PROM "\<Diferencias con Kardex"
ON SELE BAR 1 OF LISIKCOM DO QUECOMI1
ON SELE BAR 2 OF LISIKCOM DO QUECOMI2
ON SELE BAR 3 OF LISIKCOM DO QUECOMI3
ON SELE BAR 4 OF LISIKCOM DO QUECOMI4
ON BAR 5 OF LISIKCOM ACTI POPU QUECOMI5
ON BAR 6 OF LISIKCOM ACTI POPU VAIorizCOM
ON BAR 7 OF LISIKCOM ACTI POPU totalesCOM
*****ON SELE BAR 8 OF LISIKCOM DO QUECOMI8

DEFINE POPU QUECOMI5 MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF QUECOMI5 PROM "\<Completo"
DEFI BAR 2 OF QUECOMI5 PROM "\<Por Proveedor"
ON SELE BAR 1 OF QUECOMI5 DO LPUPED WITH "C",.F.

DEFINE POPU VAIORIZCOM MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF VAIORIZCOM PROM "Listado \<Detallado"
DEFI BAR 2 OF VAIORIZCOM PROM "Por \<Rubro"
DEFI BAR 3 OF VAIORIZCOM PROM "Por \<Aplicaci�n"
DEFI BAR 4 OF VAIORIZCOM PROM "Por \<Proveedor"
DEFI BAR 5 OF VAIORIZCOM PROM "Por \<Marca"

ON SELE BAR 1 OF VAIORIZCOM DO VAICOMCOM
ON SELE BAR 2 OF VAIORIZCOM DO SVALX WITH .F.,"C","R"
ON SELE BAR 3 OF VAIORIZCOM DO SVALX WITH .F.,"C","A"
ON SELE BAR 4 OF VAIORIZCOM DO SVALX WITH .F.,"C","P"
ON SELE BAR 5 OF VAIORIZCOM DO SVALX WITH .F.,"C","M"

DEFINE POPU TOIALESCOM MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF TOIALESCOM PROM "Por \<Rubro"
DEFI BAR 2 OF TOIALESCOM PROM "Por \<Aplicaci�n"
DEFI BAR 3 OF TOIALESCOM PROM "Por \<Proveedor"
DEFI BAR 4 OF TOIALESCOM PROM "Por \<Marca"
ON SELE BAR 1 OF TOIALESCOM DO SVALX WITH .F.,"C","R",.T.
ON SELE BAR 2 OF TOIALESCOM DO SVALX WITH .F.,"C","A",.T.
ON SELE BAR 3 OF TOIALESCOM DO SVALX WITH .F.,"C","P",.T.
ON SELE BAR 4 OF TOIALESCOM DO SVALX WITH .F.,"C","M",.T.

DEFINE POPU _qyw0yffel MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF _qyw0yffel PROM "Por \<Pantalla"
DEFI BAR 2 OF _qyw0yffel PROM "Por \<Impresora"
ON BAR 1 OF _qyw0yffel ACTI POPU _qyw0yfqww
ON BAR 2 OF _qyw0yffel ACTI POPU _qyw0yfsft

DEFINE POPU _qyw0yfqww MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF _qyw0yfqww PROM "\<Ingresos del D�a"
DEFI BAR 2 OF _qyw0yfqww PROM "Stock \<Hist�rico"
ON BAR 1 OF _qyw0yfqww ACTI POPU _qyw0yhoew
ON SELE BAR 2 OF _qyw0yfqww DO STKHIS WITH .T.,3

DEFINE POPU _qyw0yhoew MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF _qyw0yhoew PROM "Fecha de \<Documento"
DEFI BAR 2 OF _qyw0yhoew PROM "Fecha de \<Alta"
ON BAR 1 OF _qyw0yhoew ACTI POPU _qzn0wmbw8
ON BAR 2 OF _qyw0yhoew ACTI POPU _qzn0wmylp

DEFINE POPU _qzn0wmbw8 MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF _qzn0wmbw8 PROM "Por \<Art�culo"
DEFI BAR 2 OF _qzn0wmbw8 PROM "Por Orden de Re\<querimiento"
ON SELE BAR 1 OF _qzn0wmbw8 DO INGDIA WITH .T.,"C",.F.,1
ON SELE BAR 2 OF _qzn0wmbw8 DO INGDIA WITH .T.,"C",.F.,2

DEFINE POPU _qzn0wmylp MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF _qzn0wmylp PROM "Por \<Art�culo"
DEFI BAR 2 OF _qzn0wmylp PROM "Por Orden de Re\<querimiento"
ON SELE BAR 1 OF _qzn0wmylp DO INGDIA WITH .T.,"C",.F.,1,.T.
ON SELE BAR 2 OF _qzn0wmylp DO INGDIA WITH .T.,"C",.F.,2,.T.

DEFINE POPU _qyw0yfsft MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF _qyw0yfsft PROM "\<Ingresos del D�a"
DEFI BAR 2 OF _qyw0yfsft PROM "\<Stock Hist�rico"
ON BAR 1 OF _qyw0yfsft ACTI POPU _qyw0yisrj
ON SELE BAR 2 OF _qyw0yfsft DO STKHIS WITH .F.,3

DEFINE POPU _qyw0yisrj MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF _qyw0yisrj PROM "Fecha de \<Documento"
DEFI BAR 2 OF _qyw0yisrj PROM "Fecha de \<Alta"
ON BAR 1 OF _qyw0yisrj ACTI POPU _qzn0wo2j8
ON BAR 2 OF _qyw0yisrj ACTI POPU _qzn0wo4nj

DEFINE POPU _qzn0wo2j8 MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF _qzn0wo2j8 PROM "Por \<Art�culo"
DEFI BAR 2 OF _qzn0wo2j8 PROM "Por Orden de Re\<querimiento"
ON SELE BAR 1 OF _qzn0wo2j8 DO INGDIA WITH .F.,"C",.F.,1
ON SELE BAR 2 OF _qzn0wo2j8 DO INGDIA WITH .F.,"C",.F.,2

DEFINE POPU _qzn0wo4nj MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF _qzn0wo4nj PROM "Por \<Art�culo"
DEFI BAR 2 OF _qzn0wo4nj PROM "Por Orden de Re\<querimiento"
ON SELE BAR 1 OF _qzn0wo4nj DO INGDIA WITH .F.,"C",.F.,1,.T.
ON SELE BAR 2 OF _qzn0wo4nj DO INGDIA WITH .F.,"C",.F.,2,.T.

DEFINE POPU otrosprodu MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF otrosprodu PROM "\<Datos Generales"
DEFI BAR 2 OF otrosprodu PROM "\<Legajo"
DEFI BAR 9 OF otrosprodu AFTER 2 PROM "Pres\<upuesto"
DEFI BAR 3 OF otrosprodu PROM "\-" SKIP FOR .T.
DEFI BAR 4 OF otrosprodu PROM "\<Modificaci�n Stock"           SKIP FOR .T.
DEFI BAR 5 OF otrosprodu PROM "\-"  SKIP FOR .T.
DEFI BAR 6 OF otrosprodu PROM "\<Stock"
DEFI BAR 7 OF otrosprodu PROM "\<Kardex"  
DEFI BAR 8 OF otrosprodu PROM "En \<qu� Orden ?"  		 	KEY ALT+O, "ALT+O"
ON SELE POPU otrosprodu DO OTRS

DEFINE POPU oreq MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF oreq PROM "\<Cabecera"
DEFI BAR 2 OF oreq PROM "\<Mercader�a"
DEFI BAR 3 OF oreq PROM "\-" SKIP FOR .T.
DEFI BAR 4 OF oreq PROM "L\<istado por Pantalla"
DEFI BAR 5 OF oreq PROM "Li\<stado por Impresora"
DEFI BAR 6 OF oreq PROM "\-" SKIP FOR .T.
DEFI BAR 7 OF oreq PROM "Pa\<gos"
DEFI BAR 8 OF oreq PROM "\-" SKIP FOR .T.
DEFI BAR 9 OF oreq PROM "Autori\<zaciones"
DEFI BAR 10 OF oreq PROM "\-" SKIP FOR .T.
DEFI BAR 11 OF oreq PROM "\<Borra O.R."
DEFI BAR 12 OF oreq PROM "Cambia \<Fecha de Promesa"
DEFI BAR 13 OF oreq PROM "\-" SKIP FOR .T.
DEFI BAR 14 OF oreq PROM "Restaura \<Datos"
ON SELE POPU OREQ DO REQUER

DEFINE POPU remito MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF remito PROM "\<Recibe Remito"
DEFI BAR 2 OF remito PROM "\<Legajo de Remito"
DEFI BAR 3 OF remito PROM "\-" SKIP FOR .T.
DEFI BAR 4 OF remito PROM "Lista \<por Pantalla"
DEFI BAR 5 OF remito PROM "Lista por \<Impresora"
DEFI BAR 6 OF remito PROM "\<Mira un Remito"
DEFI BAR 7 OF remito PROM "\-" SKIP FOR .T.
DEFI BAR 8 OF remito PROM "Reindex\<a"

ON SELE BAR 1 OF remito DO _r260r6zth
ON SELE BAR 2 OF remito DO _r260r6zua
ON SELE BAR 6 OF remito DO _r260r6zv5
ON SELE BAR 8 OF REMITO DO XREC

DEFINE POPU kardex MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF kardex PROM "\<C.I.D."
DEFI BAR 2 OF kardex PROM "\<Remitos"
DEFI BAR 3 OF kardex PROM "\<Kardex"

ON SELE POPU KARDEX DO KARDEX

DEFINE POPU variable MARGIN RELATIVE SHAD COLO SCHE 4
DEFI BAR 1 OF variable PROM "Cantidad de \<D�gitos"
DEFI BAR 2 OF variable PROM "\<POPUs a Utilizar"
DEFI BAR 3 OF variable PROM "Ancho de la \<Impresora"
DEFI BAR 4 OF variable PROM "Ancho de la \<Hoja"
DEFI BAR 5 OF variable PROM "\<Orden de los Listados"
ON SELE BAR 1 OF variable do acdigi
ON SELE BAR 2 OF variable DO ACPOPU.SPR
ON SELE BAR 3 OF variable DO ACANCHO.SPR
ON SELE BAR 4 OF variable DO ACHOJA.SPR
ON SELE BAR 5 OF variable DO ORDMER.SPR


*       崢陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*       �                                                         �
*       �                 Cleanup Code & Procedures               �
*       �                                                         �
*       喞陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*
DO WHILE .T.
	=CABPAN1()
	ACTI MENU MAIN
	UNLO ALL
ENDDO

*       崢陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*       �                                                         �
*       � DS_CIU  ON SELE BAR 2 OF POPU varios          �
*       � DISPARA PROGRAMA DE CIUDADES                            �
*       � Procedure Origin:                                       �
*       �                                                         �
*       � From Menu:  STOCK.MPR,            Record:    6          �
*       � Called By:  ON SELE BAR 2 OF POPU varios          �
*       � PROM:     Ciudades                                    �
*       � Snippet:    2                                           �
*       �                                                         �
*       喞陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*
PROCEDURE DS_CIU
	=OPPRV()
	=OPCIU()
	DO GRL WITH 4,5,'Men� de Ciudades'
	ON SELE POPU grl DO ciu
	ACTI POPU grl
	RELE POPU grl
RETURN


*       崢陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*       �                                                         �
*       � _R260R6TF3  ON SELE BAR 11 OF POPU varios         �
*       �                                                         �
*       � Procedure Origin:                                       �
*       �                                                         �
*       � From Menu:  STOCK.MPR,            Record:   21          �
*       � Called By:  ON SELE BAR 11 OF POPU varios         �
*       � PROM:     SUSPEND                                     �
*       � Snippet:    3                                           �
*       �                                                         �
*       喞陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*
PROCEDURE _r260r6tf3
	PUSH KEY CLEA
	SUSPEND
RETURN

*       崢陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*       �                                                         �
*       � _R260R6YKE  ON SELE BAR 4 OF POPU otrosprodu      �
*       �                                                         �
*       � Procedure Origin:                                       �
*       �                                                         �
*       � From Menu:  STOCK.MPR,            Record:  317          �
*       � Called By:  ON SELE BAR 4 OF POPU otrosprodu      �
*       � PROM:     Modificaci�n Stock                          �
*       � Snippet:    38                                          �
*       �                                                         �
*       喞陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*
PROCEDURE _r260r6yke
	*IF ESJEFE()
	DO MOD_STKC.SPR WITH "O"
	*ENDIF
RETURN

*       崢陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*       �                                                         �
*       � rq_modpre  ON SELE BAR 3 OF POPU oreq            �
*       �                                                         �
*       � Procedure Origin:                                       �
*       �                                                         �
*       � From Menu:  STOCK.MPR,            Record:  326          �
*       � Called By:  ON SELE BAR 3 OF POPU oreq            �
*       � PROM:     Modifica Precios                            �
*       � Snippet:    39                                          �
*       �                                                         �
*       喞陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*
PROCEDURE rq_modpre
	IF ESJEFE(2)
		STORE .T. TO ESPROPIO
		DO MODPREQ.SPR WITH .T.,.T.," Modifica Precios Orden de Requerimiento "
	ELSE
		=IAUDI()
	ENDIF
RETURN

*       崢陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*       �                                                         �
*       � rq_cierord  ON SELE BAR 4 OF POPU oreq            �
*       �                                                         �
*       � Procedure Origin:                                       �
*       �                                                         �
*       � From Menu:  STOCK.MPR,            Record:  327          �
*       � Called By:  ON SELE BAR 4 OF POPU oreq            �
*       � PROM:     Cierra Orden                                �
*       � Snippet:    40                                          �
*       �                                                         �
*       喞陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*
PROCEDURE rq_cierord
	STORE .T. TO ESPROPIO
	DO CLOSORD.SPR WITH .T.,.T.," Cierra Orden de Requerimiento "
RETURN

*       崢陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*       �                                                         �
*       � _R260R6ZTH  ON SELE BAR 1 OF POPU remito          �
*       �                                                         �
*       � Procedure Origin:                                       �
*       �                                                         �
*       � From Menu:  STOCK.MPR,            Record:  407          �
*       � Called By:  ON SELE BAR 1 OF POPU remito          �
*       � PROM:     Recibe Remito                               �
*       � Snippet:    41                                          �
*       �                                                         �
*       喞陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*
PROCEDURE _r260r6zth
	STORE .T. TO ESPROPIO
	DO IREM.SPR WITH .T.,.T.
RETURN

*       崢陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*       � _R260R6ZUA  ON SELE BAR 2 OF POPU remito          �
*       喞陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
PROCEDURE _r260r6zua
	STORE .F. TO ESPROPIO
	DO REM_LEG.SPR
RETURN

*       崢陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*       � _R260R6ZV5  ON SELE BAR 6 OF POPU remito          �
*       喞陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳陳�
*
PROCEDURE _r260r6zv5
	IF PRO()
		DO MREC.SPR
	ENDIF
RETURN

CLEA
=hazbmp()
MODI WIND SCREEN TITL "GESTION DE MERCADERIAS - DIS DEN ODONTOLOGIA / G. REINER"
MODI WIND SCREEN FONT "ARIAL",8
=SETEOS()
=GETPATH2()
=OPMIX()
=OPAUD()
=OPSEG()
=var_prv()
=VAR_CLI()
=VAR_CTD()
=var_dni()
=var_iva()
=var_cag()
=var_pro()
=VAR_AGE()
=VAR_DOLA()
RELE SSTM,JANNAME,USADOR,COEFSEG,XACANCHO,XACHOJA,SSTM1,LARGO,LARGOIM
RELE IVA09,IVA18,IVA118,IVA109,PC9,PC18,PC27,IVA127,pct09
RELE ULPR,RESPUESTA,ENASCII
PUBL SSTM,JANNAME,USADOR,COEFSEG,XACANCHO,XACHOJA,SSTM1,LARGO,LARGOIM
PUBL IVA09,IVA18,IVA118,IVA109,PC9,PC18,PC27,IVA127,PCT09
PUBL ULPR,RESPUESTA,ENASCII
*** DEFINICION DE VARIABLES
IF GETENV("EQUIPO")="MICASA"
   rest from d:\sistemas\ventas\novogar\posic ADDI
ELSE
   rest from posic ADDI
ENDIF
=GETPATH2()
SSTM="VENTAS"
SSTM1="DIS-DEN"
JANNAME="DIS-DEN Odontología"
USADOR=GETENV("USERNAME")
LARGOIM=80
COEFSEG=1
IVA09=10.5/100
IVA109=1+IVA09
PC9="10.5 %"
IVA18=21/100
IVA118=1+IVA18
PC18="21 %"
PC09="10.5 %"
PC27="31.5 %"
IVA127=1.315
XACANCHO=GETNU1(PADR(USADOR,10)+PADR("XACANCHO",20),"FOXPER")
XACHOJA=GETNU1(PADR(USADOR,10)+PADR("XACHOJA",20),"FOXPER")
ULPR=PROGRAM()
* Inserted from DEFINES.PRG
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
#DEFINE FOLC  ".F."                              && FOLC
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE FOLL  .F.                                && FOLL
#DEFINE TRUC  ".T."                              && TRUC
#DEFINE TRUL  .T.                                && TRUL
#DEFINE IMPRIMIENDO  PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'°') && IMPRIMIENDO
#DEFINE ELYES  "SI"                              && ELYES
#DEFINE ELNOU  "NO"                              && ELNOU
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE THREE  3                                 && THREE
#DEFINE FOUR   4                                 && FOUR
#DEFINE TEX_EFES " - [F2] Popup - [F3] B£squeda" && TEX_EFES
#DEFINE TEX_CALC "CALCULANDO - ESPERE POR FAVOR" && TEX_CALC
#DEFINE GRABANDO PADC(' Grabando los datos ingresados - Espere por Favor ',80,"°")
#DEFINE NOVACIO "CAMPO DE INGRESO OBLIGATORIO - NO PUEDE ESTAR VACIO" && NOVACIO
#DEFINE NOFECHA "LAS FECHAS ESTAN ENTRE VALORES INACEPTABLES" && NOFECHA
#DEFINE ESPAOPC " - Barra Espac. para cambiar de Opci¢n" && ESPAOPC
#DEFINE ESCANUL " - [ESC] para Anular"           && ESCANUL
#DEFINE ESCAMEN " - [ESC] para Men£"             && ESCAMEN
#DEFINE ESCAFIN " - [ESC] para Fin"              && ESCAFIN
#DEFINE NOACVAL "LOS VALORES INGRESADOS ESTAN ENTRE LIMITES INACEPTABLES"    && NOACVAL
#DEFINE CONTIX  " Continuaci¢n"                  && CONTIX
#DEFINE RH      36 								 && RH
#DEFINE RP 		47 								 && RP
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
#DEFINE ORQ      "Orden de Requerimiento"        && ORQ
#DEFINE ORQS     "Ordenes de Requerimiento"      && ORQS
#DEFINE NOSEL "NO SE HA SELECCIONADO"            && NOSEL
#DEFINE PIC30 "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"	 && PIC30
#DEFINE T_REINGRE "Reingrese el DATO"	 		 && T_REINGRE
* End of inserted lines
STORE .T. TO CAGPOP,CIUPOP,CTDPOP,CLIPOP,IVACOD,MERPOP,PRVPOP,PROPOP,DNIPOP,ZONPOP,AGEPOP
camino2="\\Bochi\zip\ventasa"

*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º                      Menu Definition                    º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*

=defpomix()
=opmer()
=opcom()
set orde to articulo in com
sele mer
scan
	if !seek(mer.articulo, "com")
		scatt memv
		insert into com from memv
	endif
endscan


SET SYSMENU OFF

DEFINE MENU MAIN
DEFINE PAD _r220z2mma OF MAIN PROM "\<Comisiones" COLOR SCHEME 3
DEFINE PAD _r220z2mqu OF MAIN PROM "\<Salida" COLOR SCHEME 3
ON PAD _r220z2mma OF MAIN ACTI POPUP MODIFICOMI
ON SELE PAD _r220z2mqu OF MAIN cancel

DEFINE POPUP MODIFICOMI MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF MODIFICOMI PROM "Por \<Rubro" skip for gete("ADELANTE")="SI"
DEFINE BAR 2 OF MODIFICOMI PROM "\<Por Proveedor" skip for gete("ADELANTE")="SI"
DEFINE BAR 3 OF MODIFICOMI PROM "Por \<Teclado" skip for gete("ADELANTE")="SI"
DEFINE BAR 4 OF MODIFICOMI PROM "\<Completo" skip for gete("ADELANTE")="SI"

ON SELE BAR 1 OF MODIFICOMI DO MODICOM1
ON SELE BAR 2 OF MODIFICOMI DO MODICOM2
ON SELE BAR 3 OF MODIFICOMI DO MODICOM3
ON SELE BAR 4 OF MODIFICOMI DO MODICOM4

DO WHILE .T.
   ACTI MENU MAIN
   IF GETENV("USERNAME")="GOYO" .AND. ;
      LAST()=27
      EXIT
    ENDIF
ENDDO
SET SYSM TO DEFA
RETURN




PROCEDURE MODICOM1
=OPMER()
=OPRUB()
store nul to respuesta
if !empty(elirub("a Consultar",-1,1))
   sele mer
   fisc="mer.rubro='"+left(mix.texto2,3)+"'"
   tt=" Por Rubro: "+alltrim(mix.texto1)+" "
   do ABMCOMIS
endif

PROCEDURE MODICOM2
=OPMER()
=OPPRO()
store nul to respuesta
if !empty(eliPRO("a Consultar",-1,1))
   sele mer
   fisc="mer.proveedor='"+per.codcli+"'"
   tt=" Por Proveedor: "+alltrim(per.cliente)+" "
   do ABMCOMIS
endif


PROCEDURE MODICOM3
=OPMER()
store "" to ELTEX
IF intex("Descripción a Listar",20)
   sele mer
   fisc="'"+alltrim(ELTEX)+"' $ mer.merca"
   tt=" Por Texto: "+alltrim(ELTEX)+" "
   DO ABMCOMIS
endif


PROCEDURE MODICOM4
=OPMER()
store nul to respuesta
   sele mer
   fisc=".T."
   tt=" Completo "
   DO ABMCOMIS



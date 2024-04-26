CLEAR
=SETEOS()
=GETPATH2()
publ camino, camino2
camino="f:\sistemas\ventas\ventasa"
camino2="\\Bochi\zip\ventasa"
RELE SSTM,JANNAME,USADOR,COEFSEG,XACANCHO,XACHOJA,SSTM1,LARGO,LARGOIM,SUCU
RELE IVA09,IVA18,IVA118,IVA109,PC9,PC18,PC27,IVA127
rele xacdigi,ULPR
PUBL SSTM,JANNAME,USADOR,COEFSEG,XACANCHO,XACHOJA,SSTM1,LARGO,LARGOIM,SUCU,FAC_CTD
RELE IVA09,IVA18,IVA118,IVA109,PC9,PC18,PC27,IVA127
publ xacdigi,ULPR
=OPMIX()
=OPAUD()
=OPSEG()
=OPDOC()
=var_prv()
=VAR_CLI()
=var_dni()
=var_iva()
=var_cag()
**=VAR_CTD()
=VAR_PAG()
=VAR_MER()
=VAR_PRO()
=VAR_DOLA()

rest from posic ADDI
=GETPATH2()
*** DEFINICION DE VARIABLES
SSTM="VENTAS"
SSTM1="DIS-DEN"
JANNAME="DIS-DEN Odontología"
USADOR=GETENV("USERNAME")
LARGOIM=80
COEFSEG=1
XACANCHO=GETNU1(PADR(USADOR,10)+PADR("XACANCHO",20),"FOXPER")
XACHOJA=GETNU1(PADR(USADOR,10)+PADR("XACHOJA",20),"FOXPER")
SUCU="0001-"
IVA09=10.5/100
IVA109=1+IVA09
PC9="10.5 %"
IVA18=21/100
IVA118=1+IVA18
PC18="21 %"
PC27="31.5 %"
IVA127=1.315
STORE .T. TO CAGPOP,CIUPOP,CTDPOP,IVACOD,PRVPOP,PROPOP,DNIPOP,ZONPOP
STORE .T. TO CLIPOP, CTDPOP

*       *********************************************************
*       *                      Menu Definition
*       *********************************************************

**************
**	SUSP
***************
publ camino, camino2
camino="f:\sistemas\ventas\ventasa"
camino2="\\Bochi\zip\ventasa"

DEFI MENU MAIN
DEFI PAD _r270u1y3g OF MAIN PROMPT "\<Pantalla" COLOR SCHEME 3 
DEFI PAD _r270u1y5t OF MAIN PROMPT "\<Impresora" COLOR SCHEME 3 
DEFI PAD _r270u1y73 OF MAIN PROMPT "\<Salida" COLOR SCHEME 3 

ON PAD _r270u1y3g OF MAIN ACTI POPUP panta
ON PAD _r270u1y5t OF MAIN ACTI POPUP impre
ON SELE PAD _r270u1y73 OF MAIN CANCEL

DEFI POPUP panta MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF panta PROMPT "Cuenta Corriente un Cliente"
DEFI BAR 2 OF panta PROMPT "Histórico por Pantalla"
ON SELE BAR 1 OF panta do cli
ON SELE BAR 2 OF panta do cli

DEFI POPUP impre MARGIN RELATIVE SHADOW COLOR SCHEME 4
DEFI BAR 1 OF impre PROMPT "Resumen de Cta un Cliente" skip for gete("ADELANTE")="SI"
DEFI BAR 2 OF impre PROMPT "Histórico por Impresora"   skip for gete("ADELANTE")="SI"
ON SELE BAR 1 OF impre do cli
ON SELE BAR 2 OF impre do cli




*       *********************************************************
*       *                 Cleanup Code & Procedures
*       *********************************************************

DO WHILE .T.
   UNLO ALL
   ACTI MENU MAIN
   IF LAST()=27 .AND. ;
      (GETENV("USERNAME")="GOYO" or GETENV("USERNAME")="BATA")
      IF INKEY(0)=27
         EXIT
      ENDIF
   ENDIF
ENDDO
SET SYSM TO DEFA
RETURN


* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INICIO.PRG           บ
* บ COMENTARIO    :                      บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 08-25-93                บ
* บ HORA       : 10:55:11pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
SET TALK OFF
SET ESCA OFF
CLEA
=bigCHARS(2,10,'FACTURAS')
=bigchars(15,12,'NOVOGAR',12)
store 0 to nul
=men_lin("TECLA PARA CONTINUAR")
=inkey(0,'HM')
do while !empty(wontop())
   rele wind (wontop())
enddo
DO FACTURA
RETURN
PROCEDURE FACTURA
*****************************************************************************
*-- Programa: VENTAS.PRG
*-- Fecha   : 07/01/91 10:55am
*-- Version : G. REINER
*-- Notas   : MENU SISTEMA DE VENTAS
********************************************************************************
=SETEOS()
=getfuser()
ulpr=PROGRAM()
CLEA
set colo to w+
@ 0,0,24,79 BOX REPL("ฐ",9)
set colo to
RELE PATH,pathpro,PATHFAC,PATHVEN,PATHSEG
PUBL PATH,pathpro,PATHFAC,PATHVEN,PATHSEG
=GETPATH()
IF GETENV("EQUIPO")="MICASA" .OR. ;
GETENV("EQUIPO")="GOYOLAP"
   PATHSEG='C:\PUBLIC\'
ELSE
   PATHSEG='F:\PUBLIC\'
ENDIF
IF EMPTY(GETENV("EQUIPO")) .OR. ;
GETENV("EQUIPO")='MICASA' .OR. ;
GETENV("EQUIPO")="GOYOLAP"
   REST FROM path ADDI
ELSE
   IF GETENV("EQUIPO")='ARROYO'
      REST FROM C:\SISTEMAS\VENTAS\VENTASA\path ADDI
   ELSE
      REST FROM ("F:\PUBLIC\PATHFAC") ADDI
   ENDIF
ENDIF
*************************** INICIO comercializacion **************************
@ 0,0 SAY REPLICATE("Û",80) COLO W
@ 0,1 SAY PADC('Ventas',20) COLO I
@ 0,23 SAY '|'
@ 0,25 SAY DATE() COLO I
@ 0,34 SAY '|'
@ 0,36 SAY TIME() COLO I
@ 0,45 SAY '|'
@ 0,47 SAY PADC("FACTURAS",10) COLO I
@ 0,58 SAY '|'
set shad on
=genvar()
=genvar1()
DO opaud
DO opseg
DO OPDOC
ULPR=PROGRAM()
=CABPAN1()
************************** inicio facturaciขn punto de venta
DO WHILE .T.
   DEAC WIND ALL
   STORE 0 TO USER_NO
   =MOVEWIN(10,20,18,60,'PASS_WIN','SU PASSWORD')
   USADOR=SEGURIDA(PATHSEG+"MONDAY.PAS")
   store 0 to access
   =RELEWIN("PASS_WIN")
   IF !EMPTY(USADOR) .AND. USADOR#' / '
      coefseg=access
      STORE PADR(ALLTRIM(SUBSTR(USADOR,AT("/",USADOR)+1)),10) TO M.VENDEDOR
		=CABPAN1()
      SALIDA=POPMENU(6,23,'OPERACION A REALIZAR POR '+ALLTRIM(USADOR),;
        "FACTURAS COMUNES",;
        "FACTURAS BIEN DE USO ",;
        "CONSULTA DE PRECIOS",;
        "REIMPRIME FACTURA",;
        "CONSULTA SERVICE",;
        "CAMBIO DE PALABRA CLAVE",;
        "SALIDA DEL SISTEMA")
      DO CASE
      CASE SALIDA=1
         =OPESFAC()
         DO fac.SPR
      CASE SALIDA=2
         =OPESFAC()
         DO fac.SPR with .t.
      CASE SALIDA=3
         STORE .T. TO RUBPOP,SRUPOP
         DO OPCAR
			=OPRUB()
			=OPCIU()
         =OPMER()
         respuesta='nada#6#28#Consultas de Precios#3#Popup \<Completo#\<Popup Parcial#Por \<Teclado'
         =defpop()
         popant=merpop
         pop1ant=merpop1
         ON SELE POPU nada DO CONSUL
         ACTI POPU nada
         RELE POPU nada
         merpop=popant
         merpop1=pop1ant
         STORE .T. TO RUBPOP,SRUPOP
			=OPRUB()
         STORE .F. TO MERPOP
         =OPMER()
      CASE SALIDA=4
         =WORKING()
         =DOTALK()
         =OPCLI()
         SET ORDER TO TAG CODCLI IN PER
			=OPFAC()
         SELE FAC
         SET ORDER TO
         SET RELA TO CODCLI INTO PER
         TMP=GENTMP()
         =FLOCK() .OR. FLOK()
         SORT TO (TMP) ;
           ON FACTURA ;
           FIELD FAC.FACTURA, PER.CLIENTE ;
           FOR FAC.FECHA=DATE() .AND. FAC.USUARIO=LEFT(USADOR,10)
         UNLO IN FAC
         SELE 0
         USE (TMP) ALIAS TMP EXCL
         USE IN FAC
         USE IN PER
         =UNTALK()
         =UNWORK()
         GO TOP
         IF !EOF()
            =DEFPOGRL(2,20,"NADA","FACTURA+'/'+CLIENTE",40,"Factura a Reimprimir")
            STORE NUL TO RESPUESTA
            SELE TMP
            ACTI POPU NADA
            IF !empty(respuesta)
               M.LAF=TMP.FACTURA
               =OPESFAC()
               eltipo='A'
               SELE FAC
               SET ORDER TO TAG FACTURA
               IF SEEK(M.LAF) .AND. XSEEK(M.LAF,'FAX','FACTURA') .AND. CARTEL("UBIQUE EL FORMULARIO",;
               "Nง "+M.LAF+" EN LA IMPRESORA",;
               "Y OPRIMA [ENTER] PARA IMPRIMIR",;
               "O [ESC] PARA ANULAR")#27
                  =IIF(LEFT(M.LAF,1)="A",lfacia(.F.,.f.),lfaciB(.F.,.f.))
               ENDIF
            ENDIF
         ENDIF
         =OFF_TMP()
      CASE SALIDA=5
		=OPCIU()
      STORE .T. TO MARPOP
		=OPMAR()
      DO OPSER
      STORE NUL TO RESPUESTA
      IF ELIMAR("a Listar",-1,1)
         FISC="PER.FILTRO='S' .AND. !EMPTY(AT('"+LEFT(MI1.TEXTO2,2)+"/',PER.CAG))"
         TT="Listado de Services"+chr(13)+chr(10)+"Marca "+alltrim(mi1.texto1)
         DO LSERMARP
      ENDIF
      =CLOSDBF("PER")
      CASE SALIDA=6
         =CH_PASS(PATHSEG+'MONDAY.PAS')
      CASE SALIDA=7
         EXIT
      ENDCASE
   ENDIF
ENDDO
******************** FIN facturacion **********************************
RETURN
PROCEDURE GENVAR
*:*********************************************************************
*:
*:        Program: GENVAR.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/19/91     11:54
*:
*:      Called by: COMER.PRG
*:
*:      Documented 09/26/91 at 11:43               FoxDoc  version 2.01
*:*********************************************************************
=VAR_ALI()
=VAR_CAR()
=VAR_CIU()
=VAR_CLI()
=VAR_COL()
=VAR_SER()
PUBL iremc,iremr,ireman,iremla
PUBL ifacc,ifacr,ifacan,ifacla
=VAR_GRU()
=VAR_LIN()
=VAR_MAR()
PUBL merpop,merpopc,merpopr,merpop1
=VAR_PAG()
=VAR_PRO()
publ ipedr,ipedc,ipedan,ipedla
=VAR_PRV()
=VAR_RUB()
=VAR_OPK()
PUBL Srupop,Srupopc,Srupopr
publ talpop,talpopr,talpopc
=VAR_TAR()
PUBL marpop,marpopr,marpopc
PUBL merpop,merpopr,merpopc
=VAR_VIA()
=VAR_VIX()
=VAR_ZON()
PUBL maxciva,unid[30],xaciva[15,7],xaci[3],xanum[3,12]
PUBL ruvro,ruvros,llinea,llineas,janname,coefseg,usador,xacancho,xachoja,acdigi,xaus,xauss,xacdigi,korte,xanumcor
PUBL genped,genrem
PUBL rh,rp,x10,X15,x20,x30,xadol,xadols,xamoneda,xacotiz
PUBL xatalmin,xatalmax,xatalstep,xatalan,xalis1,xalis2,xalis3,xalis4
PUBL xap1,xap2,xap3,xap4,xas1,xas2,xas3,xas4,xanulis
=GETPATH()
DO CASE
CASE EMPTY(GETENV("EQUIPO")) .OR. ;
   GETENV("EQUIPO")='MICASA' .OR. ;
   GETENV("EQUIPO")='GOYOLAP'
   REST FROM (PATH+'\posic') ADDI
CASE GETENV("EQUIPO")='ARROYO'
      REST FROM C:\SISTEMAS\VENTAS\VENTASA\POSIC ADDI
CASE FILE('F:\PUBLIC\POSICFAC.MEM')
     REST FROM F:\PUBLIC\POSICFAC.MEM ADDI
OTHERWISE
     REST FROM ('F:\usr\'+getenv("username")+"\posicFAC") ADDI
ENDCASE
Release     ordali,ordCOL,ordGRU,ordLIN,ordmar,ordMER,ordOPK,ordPRo,ordrub,ordSru,ordzon,ordciu,ordprv,ordpag,ordcli
public      ordali,ordCOL,ordGRU,ordLIN,ordmar,ordMER,ordOPK,ordPRo,ordrub,ordSru,ordzon,ordciu,ordprv,ordpag,ordcli
stor .f. to ordali,ordCOL,ordGRU,ordLIN,ordmar,ordMER,ordOPK,ordPRo,ordrub,ordSru,ordzon,ordciu,ordprv,ordpag,ordcli
RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,BIAJA,BIAJAS,NUL,BOTOM,PAIP,tecmen,SUCU,ENASCII,probe,probes,cant_empre,JANPOP,JANPOPR,JANPOPC,SSTM1
PUBL sstm,ulpr,ESPERE,GRABANDO,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,BIAJA,BIAJAS,NUL,BOTOM,PAIP,tecmen,SUCU,ENASCII,probe,probes,cant_empre,JANPOP,JANPOPR,JANPOPC,SSTM1

	RELE ABA,TEX_EFES,SSTM2,ESARROYO
	PUBL ABA,TEX_EFES,SSTM2,ESARROYO

  ESARROYO=(GETENV("EQUIPO")='ARROYO')
  TEX_EFES=" - [F2] Popup - [F3] Bฃsqueda"
  SSTM2="PUBLICO"
  ABA="Abriendo Base de "
cant_empre=1
probe="Proveedor"
probes="Proveedores"
PAIP='|'
botom="  "+repl("ฐ",78)
SSTM=padc('Facturas',19)
SSTM1="HOGAR"
SSTM2="PUBLICO"

store 0 to nul
DO CASE
CASE GETENV("EQUIPO")='NOVOGAR'
   JANNAME='NOVOGAR'
   SUCU='0001'
CASE GETENV("EQUIPO")='EQUIPA'
   JANNAME='EQUIPA HOGAR'
   SUCU='0003'
OTHERWISE
   JANNAME='ARROYOGAR'
   SUCU='0002'
ENDCASE
ESPERE=padc(' Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ',80,"ฐ")
GRABANDO=padc(' Grabando los datos ingresados - Espere por Favor ',80,"ฐ")
tratando=PADC(" Tratando de Bloquear el Registro a Utilizar ",80,"ฐ")
imprimiendo=PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'ฐ')
TEN='Existe - [ENTER] para Continuar'
TECMEN="[ENTER] para Menฃ"
nlq=chr(27)+chr(120)+chr(1)+chr(27)+chr(107)+chr(0)
offnlq=chr(27)+chr(120)+chr(0)+chr(18)+chr(27)+chr(113)+chr(0)
UNDER=CHR(27)+CHR(45)+CHR(1)
OFFUNDER=CHR(27)+CHR(45)+CHR(0)
WIDE=CHR(27)+CHR(87)+CHR(1)
OFFWIDE=CHR(27)+CHR(87)+CHR(0)

RELE IVA09,IVA109,PC9,IVA18,IVA118,PC18,PC27,IVA127
PUBL IVA09,IVA109,PC9,IVA18,IVA118,PC18,PC27,IVA127
IVA09=10.5/100
IVA109=1+IVA09
PC9="10.5 %"
IVA18=21/100
IVA118=1+IVA18
PC18="21 %"
PC27="31.5 %"
IVA127=1.315

RETURN GETPATH()


PROCEDURE GENVAR1
*:*********************************************************************
*:        Program: GENVAR1.PRG
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/10/91     11:17
*:      Called by: COMER.PRG
*:*********************************************************************
STORE 36 TO rh
STORE 47 TO rp
STORE REPL("!",10) TO x10
STORE REPL("!",15) TO x15
STORE REPL("!",20) TO x20
STORE REPL("!",30) TO x30
=GETGENE()
coefseg=1
usador=GETENV("USERNAME")
rele pds
PUBL pds[2]
pds[1]=132
pds[2]=233
genped=.F.
genrem=.F.
BIAJA='Vendedor'
BIAJAS='Vendedores'
RETURN GETPATH()

FUNCTION OPESFAC
STORE .F. TO VIAPOP
STORE .T. TO CLIPOP
=opcli()
=OPVIA()
=OPCIU()
=OPRUB()
=OPMAR()
DO oppag
=OPCCL()
=OPMER()
=OPKAR()
=opfac()
RETURN

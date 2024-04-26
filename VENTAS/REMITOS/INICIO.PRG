* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : INICIO.PRG                                               บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 08-25-93                                                    บ
* บ HORA       : 10:55:11pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
SET TALK OFF
SET ESCA OFF
CLEA
=bigCHARS(2,15,'REMITOS')
=bigchars(17,15,'Novogar',8)
store 0 to nul
=men_lin("TECLA PARA CONTINUAR")
=inkey(0,'HM')
do while !empty(wontop())
   rele wind (wontop())
enddo
DO REMITOX
RETURN
PROCEDURE REMITOX
*****************************************************************************
*-- Programa: VENTAS.PRG
*-- Fecha   : 07/01/91 10:55am
*-- Version : G. REINER
*-- Notas   : MENU SISTEMA DE VENTAS
********************************************************************************
=GETFUSER()
=SETEOS()
ulpr=PROGRAM()
CLEA
set colo to w+
@ 0,0,24,79 BOX REPL("ฐ",9)
set colo to
RELE PATH,pathpro,PATHFAC,PATHVEN,PATHSEG
PUBL PATH,pathpro,PATHFAC,PATHVEN,PATHSEG
IF GETENV("EQUIPO")="MICASA"
PATHSEG='\PUBLIC\'
ELSE
PATHSEG='F:\PUBLIC\'
ENDIF
IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("EQUIPO")='MICASA'
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
@ 0,47 SAY PADC("REMITOS",10) COLO I
@ 0,58 SAY '|'
set shad on
DO genvar
DO genvar1
DO opaud
DO opseg
DO OPDOC
ULPR=PROGRAM()
=CABPAN1()
************************** inicio remitos de punto de ventas
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
        "REMITO A FACTURAR",;
        "REMITO A SUCURSALES",;
        "FACTURA DE REMITO",;
        "CONSULTA DE PRECIOS",;
        "REIMPRIME FACTURA",;
        "SALIDA DEL SISTEMA")
      DO CASE
      CASE SALIDA=1
        DO OPESREM
    	DO REMD WITH 'V'
     CASE SALIDA=2
	    DO OPSUC
	    DO OPESREM
	    DO REMD WITH 'I'
      CASE SALIDA=3
      STORE "A" TO ELTIPO
	    DO OPESREM
		 =OPCCL()
	=OPFAC()
   if elirem("a Facturar","V")
      IF EMPTY(REM.FACTURADO)
      if eltipo='A'
         IF xseek(rem.codcli,'PER','codclia')
            DO facar
         ELSE
            =cartel("EL CLENTE ELEGIDO",;
              "NO PUEDE SER FACTURADO EN UNA FACTURA",;
              "TIPO 'A'",;
              "POR FAVOR REINTENTE CON FACTURAS 'B'")
         ENDIF
      else
         IF xseek(rem.codcli,'PER','codcliB')
            do facbr
         ELSE
            =cartel("EL CLENTE ELEGIDO",;
              "NO PUEDE SER FACTURADO EN UNA FACTURA",;
              "TIPO 'B'",;
              "POR FAVOR REINTENTE CON FACTURAS 'A'")
         ENDIF
      endif
      ELSE
      =ERR_REM("FACTURARLO")
      ENDIF
   endif
      CASE SALIDA=4
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
      CASE SALIDA=5
         =WORKING()
         =DOTALK()
			=OPCLI()
         SET ORDER TO TAG CODCLI
			=OPFAC()
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
               "O [ESC] PARA ANULAR")
               IF LAST()#27
                  IF LEFT(M.LAF,1)="A"
                     DO lfacia WITH .F.,.f.
                  ELSE
                     DO lfaciB WITH .F.,.f.
                  ENDIF
               ENDIF
               ENDIF
            ENDIF
         ENDIF
         IF USED("TMP")
            USE IN TMP
         ENDIF
         IF FILE(TMP)
            ERASE (TMP)
         ENDIF
      CASE SALIDA=6
         EXIT
      ENDCASE
   ENDIF
ENDDO
******************** FIN REMITO **********************************
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
=VAR_SUC()
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
IF EMPTY(GETENV("EQUIPO")) .OR. GETENV("EQUIPO")="DESARROLLO" .OR. GETENV("EQUIPO")='MICASA'
   REST FROM (PATH+'\posic') ADDI
ELSE
   IF GETENV("EQUIPO")='ARROYO'
      REST FROM C:\SISTEMAS\VENTAS\VENTASA\POSIC ADDI
   ELSE
      IF FILE('F:\PUBLIC\POSICFAC.MEM')
         REST FROM F:\PUBLIC\POSICFAC.MEM ADDI
      ELSE
        REST FROM ('F:\usr\'+getenv("username")+"\posicFAC") ADDI
      ENDIF
   ENDIF
ENDIF
release     ordali,ordCOL,ordGRU,ordLIN,ordmar,ordMER,ordOPK,ordPRo,ordrub,ordSru,ordzon,ordciu,ordprv,ordpag,ordcli
public      ordali,ordCOL,ordGRU,ordLIN,ordmar,ordMER,ordOPK,ordPRo,ordrub,ordSru,ordzon,ordciu,ordprv,ordpag,ordcli
stor .f. to ordali,ordCOL,ordGRU,ordLIN,ordmar,ordMER,ordOPK,ordPRo,ordrub,ordSru,ordzon,ordciu,ordprv,ordpag,ordcli
RELE sstm,ulpr,espere,grabando,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,BIAJA,BIAJAS,NUL,BOTOM,PAIP,tecmen,SUCU,ENASCII,probe,probes,cant_empre,JANPOP,JANPOPR,JANPOPC,SSTM1
PUBL sstm,ulpr,ESPERE,GRABANDO,tratando,IMPRIMIENDO,LARGOIM,LINEA,LARGO,TEN,nlq,offnlq,UNDER,OFFUNDER,WIDE,OFFWIDE,BIAJA,BIAJAS,NUL,BOTOM,PAIP,tecmen,SUCU,ENASCII,probe,probes,cant_empre,JANPOP,JANPOPR,JANPOPC,SSTM1
STORE .T. TO SUCPOP

	RELE ABA,TEX_EFES,SSTM2
	PUBL ABA,TEX_EFES,SSTM2

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
IF GETENV("EQUIPO")='NOVOGAR'
   JANNAME='NOVOGAR'
   SUCU='0005'
ELSE
   JANNAME='ARROYOGAR'
   SUCU='0004'
ENDIF
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
RETURN
*: EOF: GENVAR.PRG
PROCEDURE GENVAR1
*:*********************************************************************
*:
*:        Program: GENVAR1.PRG
*:
*:         System: SYSTEMA DE COMERCIALIZACION
*:         Author: GOYO REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 09/10/91     11:17
*:
*:      Called by: COMER.PRG
*:
*:      Documented 09/26/91 at 11:43               FoxDoc  version 2.01
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
RETURN

FUNCTION OPESREM
=OPCLI()
=OPVIA()
=OPCIU()
=OPRUB()
=OPMAR()
DO oppag
=OPMER()
=OPKAR()
do opREM
RETURN

FUNCTION OPESFAC
STORE .F. TO VIAPOP
=OPCLI()
=OPVIA()
=OPCIU()
=OPRUB()
=OPMAR()
DO oppag
=OPCCL()
=OPMER()
=OPKAR()
=OPFAC()
RETURN

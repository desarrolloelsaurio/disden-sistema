********************************
*-- Programa: CTACTEP.PRG
*-- Fecha   : 06/05/91 03:09pm
*-- Version : G. REINER
*-- Notas   : MENU VARIOS
********************************
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
#DEFINE NUL    0                                 && NUL

ct_dijo=ALLTRIM(prompt())
=cabpan1()
=OPPRO()
do opccp
d1=1
d2=15
d3=24
d4=30
d5=35
d6=46
d7=63
DO CASE
case ct_dijo='Estado de Cuenta'
DO PRO WITH "CCLPRP"
*
*	=OPCIU()
*	respuesta='nada#7#20#Estado de Cuenta#3#\<Deuda a Proveedores#\<Falta de Env¡o de Pagos'
*	=DEFPOP()
*	ON SELE POPU nada DO ctactep1 WITH .T.
*	ACTI POPU nada
*	RELE POPU nada
case ct_dijo='Estado de Cuenta por Impresora'
*DO PRO WITH "CCLPRI"
*	=OPCIU()
*	respuesta='nada#7#20#Estado de Cuenta#3#\<Deuda a Proveedores#\<Falta de Env¡o de Pagos'
*	=DEFPOP()
*	ON SELE POPU nada DO ctactep1
*	ACTI POPU nada
*	RELE POPU nada
CASE ct_dijo='Notas de D‚bito'
	DO OPEMP
	=OPPAG()
	DO oppec
	DO opfar
	=OPGAS()
		respuesta='nadaX#7#20#Notas de D‚bito de Proveedores#3#Recepci¢n \<Nota de D‚bito#-#Listado \<por Pantalla#\<Listado por Impresora'
		=DEFPOP()
		ON SELE POPU nadax DO ndebc
		ACTI POPU nadax
		RELE POPU nadax
case ct_dijo='Notas de Cr‚dito'
	DO OPEMP
	=OPPAG()
	DO oppec
	DO opfar
	=OPGAS()
    respuesta='nadaX#7#20#Notas de Cr‚dito de Proveedores#3#Recepci¢n \<Nota de Cr‚dito#-#Listado \<por Pantalla#\<Listado por Impresora'
		=defpop()
		ON SELE POPU nadax DO ncrec
		ACTI POPU nadax
		RELE POPU nadax
case ct_dijo='Ordenes de Pago'
    respuesta='OPAGX#7#20#Gesti¢n de Ordenes de Pago#3;
#\<Factura de Proveedores;
#\<Reposici¢n de Caja;
#-;
#Listados por \<Pantalla;
#Listados por \<Impresora'
		=defpop()
		on sele popu OPAGX DO OPAGX
		ACTI POPU OPAGX
		RELE POPU OPAGX
case ct_dijo='Cheques Emitidos'
*DEFI POPUP chequesemi MARGIN RELATIVE SHADOW COLOR SCHEME 4
*DEFI BAR 1 OF chequesemi PROMPT "Por \<Pantalla"
*DEFI BAR 2 OF chequesemi PROMPT "Por \<Impresora"
*ON BAR 1 OF chequesemi ACTI POPUP porpantall
*ON SELE BAR 2 OF chequesemi DO LCCHPP

*DEFI POPUP porpantall MARGIN RELATIVE SHADOW COLOR SCHEME 4
*DEFI BAR 1 OF porpantall PROMPT "\<Completo"
*DEFI BAR 2 OF porpantall PROMPT "Por \<Proveedor"
*DEFI BAR 3 OF porpantall PROMPT "Por \<Imputaci¢n"
*ON SELE BAR 1 OF porpantall DO LCCHPP WITH .T.,1
*ON SELE BAR 2 OF porpantall DO LCCHPP WITH .T.,2
*ON SELE BAR 3 OF porpantall DO LCCHPP WITH .T.,3

ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE OPAGX
OP_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE OP_DIJO="Factura de Proveedores"
=OPFAR()
=OPCCP()
=OPPRO()
STORE NUL TO M.RESPUESTA
IF ELIPRO("",-1,1)
   IF XSEEK(PER.CODCLI,"FAR","CODCLI")
   SELE FAR
   SET ORDER TO 
   =FLOCK() .OR. FLOK()
   TMP=GENTMP()
   SORT ON FECHAEM,CONDPAGO TO (TMP) ;
   FOR CODCLI=PER.CODCLI .AND. !PAGADA
   =UNLO_PRX("FAR",TMP,"FAPAG")
   =MEN_LIN("[F10] Marca/Desmarca - [TAB] Confirma Selecci¢n - [ESC] Anula")
   DEFI WIND PAG3 FROM 1,1 TO 3,25 TITL " Total Cheques " IN SCREEN
   ACTI WIND PAG3
   store nul to m.tmarca
   @ 0,1 say "Marcado:"
   @ 0,9 say m.tmarca pict "99,999,999.99"

   =MOVEWIN(5,9,15,70,"WIN"," Facturas de"+dosspac(alltrim(per.cliente)),janname)
   ON KEY LABEL TAB DO PAGFA1
   ON KEY LABEL F10 DO PAGNOPAG
   BROW FIEL ;
   PGA=IIF(PAGADA,"[X]","[ ]"):H="PAGA" ,;
   FECHAEM:H="  FECHA " ,;
   FACTURA:H=PADC("FACTURA",14) ,;
   CONPA=SAYMIX(CONDPAGO,"PAGCOD"):H=PADC("CONDICION PAGO",20) ,;
   MONTONET:P="99,999.99":H="MONTO" ;
   NOEDIT NOMENU NODELETE NOAPPEND IN WIN 
   =RELEWIN("WIN")
   ELSE
   =CARTEL("NO SE HAN ENCONTRADO FACTURAS",;
   "DEL CLIENTE "+ALLTRIM(PER.CLIENTE),;
   "POR FAVOR, VERIFIQUE EL PROVEEDOR O CARGUE LA FACTURA",;
   ENTERCON)
   ENDIF
ENDIF
=RELEWIN("PAG3")
ON KEY LABEL F10 
ON KEY LABEL TAB
CASE OP_DIJO="Reposici¢n de Caja"
DO ORPAG2.SPR
CASE OP_DIJO="Listados por Pantalla" .OR. ;
OP_DIJO="Listados por Impresora"
respuesta='LOPAG#11#30#Listado de Ordenes de Pago#3;
#\<Completo;
#Reposici¢n de Ca\<ja;
#Por \<Viaje;
#\<Por Proveedor;
#Por \<Imputaci¢n'
=DEFPOP()
ON SELE POPU LOPAG DO LOPAG WITH (OP_DIJO="Listados por Pantalla")
ACTI POPU LOPAG
RELE POPU LOPAG
ENDCASE
RETURN MEN_LIN(BOTOM)

PROCEDURE LOPAG
PARAMETER PORPAN
LO_DIJO=ALLTRIM(PROMPT())
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE LO_DIJO="Completo"
DO LORP1 WITH PORPAN,1
CASE LO_DIJO="Reposici¢n de Caja"
DO LORP1 WITH PORPAN,5
CASE LO_DIJO="Por Viaje"
DO LORP1 WITH PORPAN,2
CASE LO_DIJO="Por Proveedor"
DO LORP1 WITH PORPAN,3
CASE LO_DIJO="Por Imputaci¢n"
DO LORP1 WITH PORPAN,4
ENDCASE
RETURN MEN_LIN(BOTOM)

FUNCTION PAGFA1
ON KEY LABEL TAB 
ON KEY LABEL F10 
IF LAST()#27 
  =RELEWIN("PAG3")
  =RELEWIN("WIN")
   SELE FAPAG
   CALC SUM(MONTOnet) TO M.TOTALFAC FOR PAGADA
   IF !EMPTY(M.TOTALFAC)
      SELE FAPAG
      SCAN FOR PAGADA
         SCAT MEMV
         EXIT
      ENDSCAN
      DO ORPAG1.SPR
   ELSE
      =NOSELEC("FACTURAS A PAGAR")
   ENDIF
ENDIF
=RELEWIN("PAG3")
RETURN RELEWIN("WIN")

FUNCTION PAGNOPAG
IF PAGADA
   REPL PAGADA WITH .F.
   TMARCA=TMARCA-MONTONET   
ELSE
   REPL PAGADA WITH .T.
   TMARCA=TMARCA+MONTONET      
ENDIF
ACTI WIND PAG3
@ 0,9 say m.tmarca pict "99,999,999.99"
ACTI WIND WIN
KEYB "{DNARROW}"
RETURN .T.

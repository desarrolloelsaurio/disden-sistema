*******************************************
*-- PROGRAMA: GFAB.PRG
*-- FECHA   : 06/06/91 02:13PM
*-- VERSION : G. REINER
*-- NOTAS   : MENU DE GESTION DE PRODUCCION
*******************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
GF_DIJO=ALLTRIM(PROMPT())
ULPR=PROGRAM()
=CABPAN1()
DO CASE
CASE GF_DIJO="Cambia Proceso"
STORE NUL TO RESPUESTA
IF ELIREM()
   =OPTALS()
   =OPTELS()
   SELE FAX
   SET ORDER TO TAG REMTRU
   IF SEEK(REM.REMITO)
      =FLOCK("FAX") .OR. FLOK("FAX")
      =MOVEWIN(10,8,19,72,"WIN"," Cambia Proceso ")
      @ 1,1 say "O.C. N§"
      @ 2,1 say "Art¡culo"
      @ 3,1 say "Remito N§"
      @ 4,1 say "Proceso"
      @ 6,1 say "Nuevo Proceso"

      @ 1,20 say fax.numero COLOR I/W
      =XSEEK(FAX.NUMERO,"COR","NUMERO")
      @ 2,20 say COR.articulo COLOR I/W
      @ 2,32 SAY SAYGRL(COR.ARTICULO,"MER","ARTIRED","MER.MERCA") COLOR I/W
      @ 3,20 SAY FAX.REMITO COLOR I/W
      @ 4,20 SAY FAX.PRC COLOR I/W
      @ 4,32 SAY SAYGRL(FAX.PRC,"PRC","PRCCOD","PRC.PROCFAB") COLOR I/W
      STORE NUL TO RESPUESTA
      IF !EMPTY(ELIPRC("Nuevo Proceso",6,20))
         @ 6,20 SAY PRC.PRCCOD COLOR I/W
         @ 6,32 SAY PRC.PROCFAB COLOR I/W
         IF CONFIRMA("Modificaci¢n de Proceso",.t.,20,10)
            REPL FAX.PRC WITH PRC.PRCCOD
            =IAUD(ALLTRIM(STR(FAX.NUMERO))+"->"+PRC.PROCFAB)
         ENDIF
      ENDIF
      =RELEWIN("WIN")
      UNLO IN FAX
   ENDIF
ENDIF
CASE GF_DIJO="Emite Remito Com£n"
	=OPREM()
	=OPTALS()
	=OPAVIS()
	=OPTELS()
	=OPCOR()
	STORE NUL TO RESPUESTA
*	=IIF(EMPTY(ELICOR("p/Remito ",-1,10,'k')),.T.,gremX())
do gremx.spr with "Generacion de Remitos",.T.,.F.,.F.,.T.
CASE GF_DIJO="Remito de Producto Terminado"
=OPREM()
=OPTALS()
=OPTELS()
	STORE NUL TO RESPUESTA
	=Iif(empty(elicor("p/Remito ",-1,10,'k')),.T.,gremu())
CASE GF_DIJO="Bifurca Remito"
=OPTALS()
=OPTELS()
  	 IF ELIREM()
		ELREMITO=REM.REMITO
		SET ORDER TO TAG remito IN FAX
		IF XSEEK(ELREMITO,'FAX','REMITO')
			REGISTRO=STR(RECNO("FAX"))
			=RLOCK("FAX") .OR. LOK("FAX")
			DO ABREREM.SPR WITH .T.,"Bifurca Remito"
			UNLO IN FAX
		ENDIF
	ENDIF
CASE GF_DIJO="Remito de Reproceso"
=OPTALS()
=OPTELS()
  	 IF ELIREM()
		ELREMITO=REM.REMITO
		SET ORDER TO TAG remito IN FAX
		if xseek(elremito,'FAX','remito')
			REGISTRO=STR(RECNO("FAX"))
			=RLOCK("FAX") .OR. LOK("FAX")
			DO REMREPRO.SPR WITH .F.,"Remito de Reproceso"
			UNLO IN FAX
		ENDIF
	ENDIF
CASE GF_DIJO="Solicitud de Preparaci¢n de Av¡os"
   STORE NUL TO RESPUESTA
   M.NROCO=infic(999999,"Orden de Corte a Preparar Av¡os")
   IF OPOCO(M.NROCO)
   	  TT='SOLICITUD DE PREPARACION DE AVIOS '+CRLF+'ORDEN DE CORTE Nø'+STR(M.NROCO)
	  acla=paip+PADC('C¢digo',20)+paip+PADC(abio,30)+paip+PADC('Cantidad',10)+paip+PADC('Unidad',10)+paip
	  TMP=GENTMP()
	  SORT ON TALLER,AVICODPRO TO (TMP)
	  =PRXAREA(.T.)
	  USE (TMP) ALIAS TMP
      DO LGRLCI WITH "TMP", "PREPAV()","TALCOD","'TALLER : '+TALLER",STR(M.NROCO),"PREPAV",.F.,2
      =OFF_TMP()
      =CLOSDBF("OCO")
   ENDIF
CASE GF_DIJO="Mercader¡a en Taller"
   =MEN_LIN(BOTOM)
   STORE NUL TO RESPUESTA
   IF ELITALS(" a Consultar",10,10)
   		tmp=gentmp()
   		SELE COR
   		SET ORDE TO TAG ARTICULO IN MER
   		SELE FAX
   		=WORKING()
   		=DOTALK()
   		SORT ON TALLER TO (TMP) FOR TALLER=per.codcli
		=prxarea(.T.)
   		USE (TMP) ALIAS TMP
		DELE FOR EMPTY(ef) OR !empty(sf)
   		=UNTALK()
   		=UNWORK()
   		SELE COR
   		SET RELA TO ARTICULO INTO MER
   		SELE TMP
   		SET ORDE TO TAG NUMERO IN COR
   		SET RELA TO NUMERO INTO COR ADDI
   		=MEN_LIN('[TAB] PARA SALIR')
   		ON KEY LABEL TAB KEYBOARD "{CTRL+W}"
   		DEFI WIND CONS FROM 2,0 TO 23,79 NONE
   		ACTI WIND CONS
		BROW FIEL REMITO:H='REMITO',;
				 EEC:H='CANTIDAD' ,;
				 NUMERO:H='O.C.':6,;
				 PRC:H='PRC':5,;
				 EF:H='INGRESO',;
				 COR.ARTICULO:H='ARTICULO',;
				 MER.MERCA:H='DESCRIPCION':15 ;
				 NOMO NOAPP NOME FREE REMITO ;
				 TITL "ART. EN TALLER "+ALLT(PER.CLIENTE) IN CONS
		RELE WIND CONS
		ON KEY LABEL TAB
		=OFF_TMP()
		=OFF_RELA()
	   =MEN_LIN(BOTOM)
   ENDIF
CASE GF_DIJO="Registra Env¡o de Merc. a Taller" .OR. ;
     GF_DIJO="Registra Recepci¢n de Merc.de Taller"
	=OPTALS()
	=OPCOR()
	=OPTELS()
  	 IF ELIREM()
		ELREMITO=REM.REMITO
		SET ORDER TO TAG remito IN FAX
		IF XSEEK(ELREMITO,'FAX','REMITO')
			REGISTRO=STR(RECNO("FAX"))
			=RLOCK("FAX") .OR. LOK("FAX")
			DO CREM WITH GF_DIJO="Registra Env¡o de Merc. a Taller"
			UNLO IN FAX
		ENDIF
	ENDIF
case GF_DIJO="Lista por Impresora"
=OPREM()
=OPTALS()
=OPTELS()
	RESPUESTA=GFABPOP()
	=DEFPOP()
	ON SELE POPU GFAB DO LGFABI WITH .F.
	ACTI POPU GFAB
	RELE POPU GFAB
case GF_DIJO="Lista por Pantalla"
=OPREM()
=OPTALS()
=OPTELS()
	RESPUESTA=GFABPOP()
	=DEFPOP()
	ON SELE POPU GFAB DO LGFABI WITH .T.
	ACTI POPU GFAB
	RELE POPU GFAB
CASE GF_DIJO='Restaura Archivo'
	=XFAB()
ENDCASE
ULPR=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)

FUNCTION GFABPOP
LCOSA='GFAB#7#20#Listados de Gesti¢n de Fabricaci¢n#3;
#\<Estado de una Orden;
#Estado de \<varias ¢rdenes;
#O. Corte \<Pendientes;
#Procesos \<Terminados;
#\<Finales Previstos;
#-'
LCOSA=LCOSA+';
#\<Balance de Talleres;
#\<Rendimiento;
#\<Consistencia;
#\<Informe de Segunda;
#-;
#\<Listado de Remitos;
#\<Materiales Enviados'
RETURN LCOSA

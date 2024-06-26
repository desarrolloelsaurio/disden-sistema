*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º 09/17/95              ICREP.PRG                18:11:09 º
*       º                                                         º
*       ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
*       º                                                         º
*       º GREGORIO REINER                                         º
*       º                                                         º
*       º Copyright (c) 1995 GOYO REINER                          º
*       º MITRE 1480 '4' B§                                       º
*       º ROSARIO, SF  2000                                       º
*       º                                                         º
*       º Description:                                            º
*       º This program was automatically generated by GENSCRN.    º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½

PARAMETERS decredi

*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º           ICREP/MS-DOS Setup Code - SECTION 1           º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*

#REGION 1
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
=OPCCP()
** Start of inserted file \SISTEMAS\DEFINES.PRG ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄstart
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE NUL    0                                 && NUL
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX
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

** End of inserted file \SISTEMAS\DEFINES.PRG ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄend

TX1="N. "
TIWIN=" Ajuste de Cta Cte a favor "
IF DECREDI
   m.cart_cred=TX1+"Crd. "
   M.TC="ND"
   TIWIN=TIWIN+"del Propietario "
ELSE
   m.cart_cred=TX1+"Db. "
   M.TC="NC"
   TIWIN=TIWIN+"de la Administracion "
ENDIF
RELE MIX_VARI,MIX_T1,MIX_R1,MIX_C1,MIX_COD,MIX_IND,MIX_R2,MIX_C2,MIX_ALIAS,MIX_CAMPO,MIX_LARGO
PUBL MIX_VARI,MIX_T1,MIX_R1,MIX_C1,MIX_COD,MIX_IND,MIX_R2,MIX_C2,MIX_ALIAS,MIX_CAMPO,MIX_LARGO
ELERROR=0

#REGION 0
REGIONAL m.currarea, m.talkstat, m.compstat

IF SET("TALK") = "ON"
	SET TALK OFF
	m.talkstat = "ON"
ELSE
	m.talkstat = "OFF"
ENDIF
m.compstat = SET("COMPATIBLE")
SET COMPATIBLE FOXPLUS

*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º                MS-DOS Window definitions                º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*

IF NOT WEXIST("icrep") ;
	OR UPPER(WTITLE("ICREP")) == "ICREP.PJX" ;
	OR UPPER(WTITLE("ICREP")) == "ICREP.SCX" ;
	OR UPPER(WTITLE("ICREP")) == "ICREP.MNX" ;
	OR UPPER(WTITLE("ICREP")) == "ICREP.PRG" ;
	OR UPPER(WTITLE("ICREP")) == "ICREP.FRX" ;
	OR UPPER(WTITLE("ICREP")) == "ICREP.QPR"
	=MOVEWIX("icrep",	INT((SROW()-10)/2), INT((SCOL()-71)/2), INT((SROW()-10)/2)+9, INT((SCOL()-71)/2)+70, ;
	 ' '+TIWIN+' '		,' '+JANNAME+' ')		
ENDIF


*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º               ICREP/MS-DOS Screen Layout                º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*

#REGION 1
IF WVISIBLE("icrep")
	ACTIVATE WINDOW icrep SAME
ELSE
	ACTIVATE WINDOW icrep NOSHOW
ENDIF
@ 2,1 SAY "Propietario" ;
	SIZE 1,11, 0
@ 3,1 SAY "Inmueble" ;
	SIZE 1,8, 0
@ 4,1 SAY m.cart_cred+" N§" ;
	SIZE 1,15
@ 5,1 SAY "Importe" ;
	SIZE 1,7, 0
@ 6,1 SAY "Detalle" ;
	SIZE 1,7, 0
@ 1,1 SAY "Fecha" ;
	SIZE 1,5, 0
@ 1,17 GET m.fecha ;
	SIZE 1,8 ;
	DEFAULT {  /  /  } ;
	WHEN _r3p12z8zd()
@ 2,17 GET m.procod ;
	SIZE 1,10 ;
	DEFAULT " " ;
	PICTURE "!!!!!!!!!!" ;
	WHEN last()#27 .and. !empty(m.FECHA) .AND.  GRL_F2("M.PROCOD","Del Inmueble",2,17,30,"PER","PROPIETA","PRPCOD","PROPIETA",2,28) ;
	VALID LAST()=27 .OR. (XSEEK(M.PROCOD,"PER","PRPCOD") .AND. SGET("ICREP")) ;
	MESSAGE "Propietario "+tex_efes ;
	ERROR "PROPIETARIO NO EXISTE"
@ 2,28 SAY iif(empty(m.procod),"",SAYPER(m.procod,"PRPCOD")) ;
	SIZE 1,30 ;
	PICTURE "@!"
@ 3,17 GET m.CODINM ;
	SIZE 1,10 ;
	DEFAULT " " ;
	PICTURE "!!!!!!!!!!" ;
	WHEN last()#27 .and. !empty(m.PROCOD) .AND.  GRL_F2("M.CODINM","",3,17,40,"INM","DOMICILIO","CODINM","DOMICILIO",3,28) ;
	VALID _r3p12z935() ;
	MESSAGE "Inmueble "+tex_efes ;
	ERROR IIF(ELERROR=1,"INMUEBLE NO EXISTE","EL INMUEBLE NO ES DEL PROPIETARIO")
@ 3,28 SAY iif(empty(m.codINM),"",SAYGRL(m.CODINM,"INM","CODINM","INM.DOMICILIO")) ;
	SIZE 1,40 ;
	PICTURE "@!"
@ 4,17 GET M.COMPR ;
	SIZE 1,14 ;
	DEFAULT " " ;
	PICTURE "!!!!!!!!!!!!!!" ;
	WHEN OFF_F2() .AND. LAST()#27 .AND. !EMPTY(CODINM) ;
	VALID _r3p12z96i() ;
	MESSAGE "N£mero de Comprobante" ;
	ERROR "DEBE TENER UN NUMERO DE COMPROBANTE"
@ 5,17 GET M.MONTO ;
	SIZE 1,9 ;
	DEFAULT 0 ;
	PICTURE "99,999.99" ;
	WHEN LAST()#27 .AND. !EMPTY(M.COMPR) ;
	VALID LAST()=27 .OR. M.MONTO>0 ;
	MESSAGE "Monto de la "+m.cart_cred ;
	ERROR NOMENOR("0")
@ 6,17 GET m.detalle ;
	SIZE 1,30 ;
	DEFAULT " " ;
	PICTURE "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" ;
	WHEN last()#27 .AND. M.MONTO>0 ;
	MESSAGE "Detalle de la "+m.cart_cred
@ 6,55 GET M.OPCION ;
	PICTURE "@*HN \<OK;\<NO" ;
	SIZE 1,4,1 ;
	DEFAULT 1 ;
	VALID _r3p12z9ar()

IF NOT WVISIBLE("icrep")
	ACTIVATE WINDOW icrep
ENDIF

READ CYCLE ;
	SHOW _r3p12z9dz()

=RELEWIN("icrep")

#REGION 0
IF m.talkstat = "ON"
	SET TALK ON
ENDIF
IF m.compstat = "ON"
	SET COMPATIBLE ON
ENDIF


*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º                ICREP/MS-DOS Cleanup Code                º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*

#REGION 1
ELSE
=IAUDI()
ENDIF
RELE MIX_VARI,MIX_T1,MIX_R1,MIX_C1,MIX_COD,MIX_IND,MIX_R2,MIX_C2,MIX_ALIAS,MIX_CAMPO,MIX_LARGO
RETURN MEN_LIN(BOTOM)

*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º _R3P12Z8ZD           m.fecha WHEN                       º
*       º                                                         º
*       º Function Origin:                                        º
*       º                                                         º
*       º From Platform:       MS-DOS                             º
*       º From Screen:         ICREP,     Record Number:    8     º
*       º Variable:            m.fecha                            º
*       º Called By:           WHEN Clause                        º
*       º Object Type:         Field                              º
*       º Snippet Number:      1                                  º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*
FUNCTION _r3p12z8zd     &&  m.fecha WHEN
#REGION 1
STORE DATE() TO M.FECHA
RETURN .T.

*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º _R3P12Z935           m.CODINM VALID                     º
*       º                                                         º
*       º Function Origin:                                        º
*       º                                                         º
*       º From Platform:       MS-DOS                             º
*       º From Screen:         ICREP,     Record Number:   11     º
*       º Variable:            m.CODINM                           º
*       º Called By:           VALID Clause                       º
*       º Object Type:         Field                              º
*       º Snippet Number:      2                                  º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*
FUNCTION _r3p12z935     &&  m.CODINM VALID
#REGION 1
IF LAST()=27
   RETURN .T.
ENDIF
IF XSEEK(M.CODINM,"INM","CODINM")
   IF INM.PROCOD=M.PROCOD
      RETURN SGET("ICREP")
   ELSE
      ELERROR=2
      RETURN .F.
   ENDIF
ENDIF
ELERROR=1
RETURN .F.




*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º _R3P12Z96I           M.COMPR VALID                      º
*       º                                                         º
*       º Function Origin:                                        º
*       º                                                         º
*       º From Platform:       MS-DOS                             º
*       º From Screen:         ICREP,     Record Number:   13     º
*       º Variable:            M.COMPR                            º
*       º Called By:           VALID Clause                       º
*       º Object Type:         Field                              º
*       º Snippet Number:      3                                  º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*
FUNCTION _r3p12z96i     &&  M.COMPR VALID
#REGION 1
IF LAST()=27
   RETURN .T.
ENDIF
IF !EMPTY(M.COMPR)
   M.COMPR=Q_FAC(M.COMPR)
   RETURN SGET("ICREP")
ENDIF
RETURN .F.

*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º _R3P12Z9AR           M.OPCION VALID                     º
*       º                                                         º
*       º Function Origin:                                        º
*       º                                                         º
*       º From Platform:       MS-DOS                             º
*       º From Screen:         ICREP,     Record Number:   16     º
*       º Variable:            M.OPCION                           º
*       º Called By:           VALID Clause                       º
*       º Object Type:         Push Button                        º
*       º Snippet Number:      4                                  º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*
FUNCTION _r3p12z9ar     &&  M.OPCION VALID
#REGION 1
IF M.OPCION=1
   IF LAST()#27 .AND. ;
   !EMPTY(M.PROCOD) .AND. ;
   !EMPTY(M.CODINM) .AND. ;
   M.MONTO>0
     STORE M.FECHA TO M.FECHAOP,M.FECHAVE
     M.COMPRRE=M.TC
     =AGRABAR("CCP")
     =IAUD(M.TC+" "+M.COMPR+" "+M.PROCOD)
     M.NUMERORE=M.TC+" "+M.COMPR
     M.PROPI=SAYPER(M.PROCOD,"PRPCOD")
     M.MONEDA="P"
     =LCREI()
   ENDIF
ENDIF
CLEA READ
RETURN .T.

*       ÖÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
*       º                                                         º
*       º _R3P12Z9DZ           Read Level Show                    º
*       º                                                         º
*       º Function Origin:                                        º
*       º                                                         º
*       º                                                         º
*       º From Platform:       MS-DOS                             º
*       º From Screen:         ICREP                              º
*       º Called By:           READ Statement                     º
*       º Snippet Number:      5                                  º
*       º                                                         º
*       ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
*
FUNCTION _r3p12z9dz     && Read Level Show
PRIVATE currwind
STORE WOUTPUT() TO currwind
*
* Show Code from screen: ICREP
*
#REGION 1
IF SYS(2016) = "ICREP" OR SYS(2016) = "*"
	ACTIVATE WINDOW icrep SAME
	@ 2,28 SAY iif(empty(m.procod),"",SAYPER(m.procod,"PRPCOD")) ;
		SIZE 1,30, 0 ;
		PICTURE "@!"
	@ 3,28 SAY iif(empty(m.codINM),"",SAYGRL(m.CODINM,"INM","CODINM","INM.DOMICILIO")) ;
		SIZE 1,40, 0 ;
		PICTURE "@!"
ENDIF
IF NOT EMPTY(currwind)
	ACTIVATE WINDOW (currwind) SAME
ENDIF
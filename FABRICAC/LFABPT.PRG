*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � 07/29/96             LFABPT.PRG                09:16:29 �
*       �                                                         �
*       픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � Author's Name                                           �
*       �                                                         �
*       � Copyright (c) 1996 Company Name                         �
*       � Address                                                 �
*       � City,     Zip                                           �
*       �                                                         �
*       � Description:                                            �
*       � This program was automatically generated by GENSCRN.    �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

PARAMETERS ppan

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �          LFABPT/MS-DOS Setup Code - SECTION 1           �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
** Start of inserted file \SISTEMAS\DEFINES.PRG 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴start
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE NUL    0                                 && NUL
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX
#DEFINE PICUMA1 "9,999,999,999,999"              && PICUMA1
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
#DEFINE TEX_EFES " - [F2] Popup - [F3] B즧queda" && TEX_EFES
#DEFINE TEX_CALC "CALCULANDO - ESPERE POR FAVOR" && TEX_CALC
#DEFINE GRABANDO PADC(' Grabando los datos ingresados - Espere por Favor ',80,"�")
#DEFINE NOVACIO "CAMPO DE INGRESO OBLIGATORIO - NO PUEDE ESTAR VACIO" && NOVACIO
#DEFINE NOFECHA "LAS FECHAS ESTAN ENTRE VALORES INACEPTABLES" && NOFECHA
#DEFINE ESPAOPC " - Barra Espac. para cambiar de Opci줻" && ESPAOPC
#DEFINE ESCANUL " - [ESC] para Anular"           && ESCANUL
#DEFINE ESCAMEN " - [ESC] para Men�"             && ESCAMEN
#DEFINE ESCAFIN " - [ESC] para Fin"              && ESCAFIN
#DEFINE NOACVAL "LOS VALORES INGRESADOS ESTAN ENTRE LIMITES INACEPTABLES"    && NOACVAL
#DEFINE CONTIX  " Continuaci줻"                  && CONTIX
#DEFINE RH      36 								 && RH
#DEFINE RP 		47 								 && RP
#DEFINE ENTERCON "PULSE [ENTER] PARA CONTINUAR"  && ENTERCON
#DEFINE ORQ      "Orden de Requerimiento"        && ORQ
#DEFINE ORQS     "Ordenes de Requerimiento"      && ORQS
#DEFINE NOSEL "NO SE HA SELECCIONADO"            && NOSEL
#DEFINE PIC30 "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"	 && PIC30
#DEFINE T_REINGRE "Reingrese el DATO"	 		 && T_REINGRE

** End of inserted file \SISTEMAS\DEFINES.PRG 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴end

STORE 1 TO FILCOR,FILMER,FILTAL,FILFECI,FILFECE,FILFECS,FILPRC
STORE "" TO TTCOR,TTMER,TTTAL,TTFECI,TTFECE,TTFECS,FISC,TTQUE,TTPRC
STORE ".T." TO QUECOR,QUEMER,QUETAL,QUEFECI,QUEFECS,QUEFECE,QUEPRC
STORE 1 TO MINOBJ
STORE 2 TO MAXOBJ
STORE .F. TO HUBORES

CANT_MAX=10
DIME TEXTO[CANT_MAX,2],VARIABLE[CANT_MAX],HABILITADO[CANT_MAX],HABILANT[CANT_MAX]

TEXTO[1,1]='N� O. '+UPPER(KORTE)
TEXTO[2,1]='ARTICULO'
TEXTO[3,1]='DENOMINACION'
TEXTO[4,1]='TALLER'
TEXTO[5,1]='F.RECEP'
TEXTO[6,1]='F.DEVOL'
TEXTO[7,1]='DIAS'
TEXTO[8,1]='C.RECIBIDA'
TEXTO[9,1]='C.DEVUELTA'
TEXTO[10,1]='DIFERENCIA'

TEXTO[1,2]=10
TEXTO[2,2]=10
TEXTO[3,2]=30
TEXTO[4,2]=30
TEXTO[5,2]=8
TEXTO[6,2]=8
TEXTO[7,2]=XACDIGI
TEXTO[8,2]=XACDIGI
TEXTO[9,2]=XACDIGI
TEXTO[10,2]=XACDIGI

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

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �                MS-DOS Window definitions                �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

=MOVEWIX("lfabnt",	INT((SROW()-16)/2), INT((SCOL()-75)/2), INT((SROW()-16)/2)+15, INT((SCOL()-75)/2)+74, ;
 " Listado de Ordenes de Corte - Procesos Terminados "		,' '+janname+' ')		


*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �               LFABPT/MS-DOS Screen Layout               �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
IF WVISIBLE("lfabnt")
	ACTIVATE WINDOW lfabnt SAME
ELSE
	ACTIVATE WINDOW lfabnt NOSHOW
ENDIF
@ 5,5 SAY "INICIO CORTE" ;
	SIZE 1,12, 0
@ 5,28 SAY "ENTRADA TALLER" ;
	SIZE 1,14, 0
@ 5,54 SAY "SALIDA TALLER" ;
	SIZE 1,13, 0
@ 1,1 GET m.filor ;
	PICTURE "@*RVN \<Todas las Ordenes;\<Opciones" ;
	SIZE 1,21,0 ;
	DEFAULT 1 ;
	WHEN BETW(_CUROBJ,MINOBJ,MAXOBJ) ;
	VALID VAL_OBJ(.F.,2) ;
	MESSAGE "L죑ites por Orden de "+favri
@ 1,24 GET m.filmer ;
	PICTURE "@*RVN \<Todos los Art죅ulos;\<Opciones" ;
	SIZE 1,23,0 ;
	DEFAULT 1 ;
	WHEN BETW(_CUROBJ,MINOBJ,MAXOBJ) ;
	VALID VAL_OBJ(.F.,2) ;
	MESSAGE "L죑ites de Productos"
@ 1,50 GET m.filtal ;
	PICTURE "@*RVN \<Todos los Talleres;\<Un Taller" ;
	SIZE 1,22,0 ;
	DEFAULT 1 ;
	WHEN BETW(_CUROBJ,MINOBJ,MAXOBJ) ;
	VALID VAL_OBJ(.F.,2) ;
	MESSAGE "L죑ites de Taller"
@ 6,1 GET m.filfeci ;
	PICTURE "@*RVN \<Todas las Fechas;\<Entre Fechas" ;
	SIZE 1,20,0 ;
	DEFAULT 1 ;
	WHEN BETW(_CUROBJ,MINOBJ,MAXOBJ) ;
	VALID _rcj0jvotq() ;
	MESSAGE "L죑ite de Fechas de Inicio de Corte"
@ 6,24 GET m.filfece ;
	PICTURE "@*RVN \<Todas las Fechas;\<Entre Fechas" ;
	SIZE 1,20,0 ;
	DEFAULT 1 ;
	WHEN BETW(_CUROBJ,MINOBJ,MAXOBJ) ;
	VALID _rcj0jvozx() ;
	MESSAGE "L죑ite de Fechas de Entrada a Taller"
@ 6,50 GET m.filfecs ;
	PICTURE "@*RVN \<Todas las Fechas;\<Entre Fechas" ;
	SIZE 1,20,0 ;
	DEFAULT 1 ;
	WHEN BETW(_CUROBJ,MINOBJ,MAXOBJ) ;
	VALID _rcj0jvp68() ;
	MESSAGE "L죑ite de Fechas de Salida de Taller"
@ 10,1 GET m.filprc ;
	PICTURE "@*RVN \<Todos los Procesos;\<Opciones" ;
	SIZE 1,22,0 ;
	DEFAULT 1 ;
	WHEN BETW(_CUROBJ,MINOBJ,MAXOBJ) ;
	VALID VAL_OBJ(.F.,2) ;
	MESSAGE "L죑ite de Procesos"
@ 11,37 GET m.opcion ;
	PICTURE "@*HN \!Acepta;\?Rechaza" ;
	SIZE 1,10,3 ;
	DEFAULT 1 ;
	VALID _rcj0jvpdg()

IF NOT WVISIBLE("lfabnt")
	ACTIVATE WINDOW lfabnt
ENDIF

READ CYCLE


#REGION 0
IF m.talkstat = "ON"
	SET TALK ON
ENDIF
IF m.compstat = "ON"
	SET COMPATIBLE ON
ENDIF


*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �               LFABPT/MS-DOS Cleanup Code                �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
=RELEWIN("LFABNT")
RETURN .T.

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � _RCJ0JVOTQ           m.filfeci VALID                    �
*       �                                                         �
*       � Function Origin:                                        �
*       �                                                         �
*       � From Platform:       MS-DOS                             �
*       � From Screen:         LFABPT,     Record Number:    8    �
*       � Variable:            m.filfeci                          �
*       � Called By:           VALID Clause                       �
*       � Object Type:         Radio Button                       �
*       � Snippet Number:      1                                  �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*
FUNCTION _rcj0jvotq     &&  m.filfeci VALID
#REGION 1
IF M.FILFECI=2
   STORE ".T." TO QUEFEC
   STORE ""  TO TTFEC
   STORE FILFECI TO FILFEC
   =qw_FEC(8,1,'COR.FECHAINI')
   STORE QUEFEC TO QUEFECI
   STORE TTFEC  TO TTFECI
ENDIF
RETURN VAL_OBJ(.F.,2)

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � _RCJ0JVOZX           m.filfece VALID                    �
*       �                                                         �
*       � Function Origin:                                        �
*       �                                                         �
*       � From Platform:       MS-DOS                             �
*       � From Screen:         LFABPT,     Record Number:    9    �
*       � Variable:            m.filfece                          �
*       � Called By:           VALID Clause                       �
*       � Object Type:         Radio Button                       �
*       � Snippet Number:      2                                  �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*
FUNCTION _rcj0jvozx     &&  m.filfece VALID
#REGION 1
IF FILFECE=2
   STORE ".T." TO QUEFEC
   STORE ""  TO TTFEC
   STORE FILFECE TO FILFEC
   HABILITADO[5]=qw_FEC(8,24,'FAX.EF')
   STORE QUEFEC TO QUEFECE
   STORE TTFEC  TO TTFECE
ENDIF
RETU VAL_OBJ(.F.,2)

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � _RCJ0JVP68           m.filfecs VALID                    �
*       �                                                         �
*       � Function Origin:                                        �
*       �                                                         �
*       � From Platform:       MS-DOS                             �
*       � From Screen:         LFABPT,     Record Number:   10    �
*       � Variable:            m.filfecs                          �
*       � Called By:           VALID Clause                       �
*       � Object Type:         Radio Button                       �
*       � Snippet Number:      3                                  �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*
FUNCTION _rcj0jvp68     &&  m.filfecs VALID
#REGION 1
IF FILFECS=2
   STORE ".T." TO QUEFEC
   STORE ""  TO TTFEC
   STORE FILFECS TO FILFEC
   HABILITADO[6]=qw_FEC(8,50,'FAX.SF')
   STORE QUEFEC TO QUEFECS
   STORE TTFEC  TO TTFECS
ENDIF
RETU VAL_OBJ(.F.,2)

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � _RCJ0JVPDG           m.opcion VALID                     �
*       �                                                         �
*       � Function Origin:                                        �
*       �                                                         �
*       � From Platform:       MS-DOS                             �
*       � From Screen:         LFABPT,     Record Number:   12    �
*       � Variable:            m.opcion                           �
*       � Called By:           VALID Clause                       �
*       � Object Type:         Push Button                        �
*       � Snippet Number:      4                                  �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*
FUNCTION _rcj0jvpdg     &&  m.opcion VALID
#REGION 1
IF M.OPCION=2
	CLEA READ
	RETURN .T.
ENDIF

IF READKEY()=15 .OR. READKEY()=271 .OR. READKEY()=5 .OR. READKEY()=261
	STORE .T. TO HABILITADO
	STORE QW_MER(3,24,"MER.ARTICULO") TO HABILITADO[2],HABILITADO[3]
	STORE QW_TALS(3,50,'FAX.TALLER') TO HABILITADO[4]
	STORE {} TO M.NUINI,NUFIN
	=qw_prc(12,1,"FAX.PRC")
	***** FISC
	FISC="!EMPTY(FAX.SF) .AND. !EMPTY(FAX.EF)"
	FISC=qw_fisc(FISC,quemer)
	FISC=qw_FISC(FISC,queTAL)
	FISC=qw_FISC(FISC,quefecI)
	FISC=qw_FISC(FISC,quefecE)
	FISC=qw_FISC(FISC,quefecS)
	FISC=qw_FISC(FISC,queprc)
	TTFECI=IIF(EMPTY(TTFECI),""," (Inicio de Corte) "+TTFECI)
	TTFECE=IIF(EMPTY(TTFECE),""," (Entrada a Taller) "+TTFECE)
	TTFECS=IIF(EMPTY(TTFECS),""," (Salida de Taller) "+TTFECS)
	****** TITULOS
	TTQUE=QW_TT(TTMER)+QW_TT(TTTAL);
		+QW_TT(TTFECI)+QW_TT(TTFECE)+QW_TT(TTFECS)+QW_TT(TTPRC)
	=WORKING()
	=DOTALK()
	SET ORDER TO TAG NUMERO IN CO1
	SET ORDER TO TAG NUMERO IN COR
	SET ORDER TO TAG TALCOD IN PER
	SET ORDER TO TAG ARTIRED IN MER
	SELE COR
	SET RELA TO NUMERO INTO CO1
	SET RELA TO ARTICULO INTO MER ADDI
	SELE FAX
	SET RELA TO NUMERO INTO COR ADDI
	SET RELA TO TALLER INTO PER ADDI
	SET ORDER TO
	TMP=GENTMP()
	OPTAR=ALGUN(40," Orden de Listado ","Por Orden de \<Corte;Por \<Fecha;Por \<Art죅ulo")
IF !EMPTY(M.OPTAR)
	DO CASE
	CASE OPTAR=1
		TTOR="Ordenado por N� de Orden de Corte"
		SORT ON NUMERO TO (TMP) FOR &FISC ;
			FIELD NUMERO,;
			COR.ARTICULO,;
			MER.MERCA,;
			PER.CLIENTE,;
			EF,;
			SF,;
			EEC,;
			SSC
	CASE OPTAR=2
		TTOR="Ordenado por Fecha"
		SORT ON SF,NUMERO TO (TMP) FOR &FISC ;
			FIELD NUMERO,;
			COR.ARTICULO,;
			MER.MERCA,;
			PER.CLIENTE,;
			EF,;
			SF,;
			EEC,;
			SSC
	OTHERWISE
		TTOR="Ordenado por Art죅ulo"
		SORT ON MER.ARTICULO,NUMERO TO (TMP) FOR &FISC ;
			FIELD NUMERO,;
			COR.ARTICULO,;
			MER.MERCA,;
			PER.CLIENTE,;
			EF,;
			SF,;
			EEC,;
			SSC
	ENDCASE
	SELE FAX
	=UNTALK()
	=UNWORK()
	=ACOPY(HABILITADO,HABILANT)
	USE (TMP) ALIAS TMP EXCL
	DO WHILE CFGFAC()
		RELE TTL,CTRL
		DIME TTL[CANT_MAX],CTRL[CANT_MAX]
		STORE .F. TO HAY
		=TTLCHEQ(8)
		ACLA=HAZ_ACLA()
		M.LINEA=REPL("=",LEN(ACLA))
		TT="Listado de Estado de Ordenes de Fabricaci줻"+;
			CRLF+"Procesos Terminados"+iif(!empty(ttque),ttque,"")+;
			CRLF+TTOR
		STORE NUL TO CASOS,TEEC,TSSC
		=IIF(PPAN, LFABPTP(), LFABPTI())
		=ACOPY(HABILANT,HABILITADO)
		STORE .F. TO VARIABLE
	ENDDO
	ENDIF
	=OFF_TMP()
	=REOPCOR()
	=REOPFAB()
	=REOPREM()
ENDIF
ACTI WIND LFABNT
CLEA
STORE 1 TO FILOR,FILMER,FILTAL,FILFECI,FILFECE,FILFECS,FILPRC
STORE "" TO TTCOR,TTMER,TTTAL,TTFECI,TTFECE,TTFECS,FISC,TTQUE,TTPRC
STORE ".T." TO QUECOR,QUEMER,QUETAL,QUEFECI,QUEFECS,QUEFECE,QUEPRC
_CUROBJ=1
STORE 1 TO MINOBJ
STORE 2 TO MAXOBJ
RETURN SGET("LFABNT")

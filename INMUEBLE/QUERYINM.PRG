*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � 09/17/95            QUERYINM.PRG               18:07:53 �
*       �                                                         �
*       픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � GREGORIO REINER                                         �
*       �                                                         �
*       � Copyright (c) 1995 GOYO REINER                          �
*       � MITRE 1480 '4' B�                                       �
*       � ROSARIO, SF  2000                                       �
*       �                                                         �
*       � Description:                                            �
*       � This program was automatically generated by GENSCRN.    �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

PARAMETERS q_porpan,tipolis

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �         QUERYINM/MS-DOS Setup Code - SECTION 1          �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
STORE "" TO ttinm, ttprp, tttip, ttciu, ttest, TTUNI
STORE 1  TO filinm,filprp,filtip,filciu,filest,FILUNI
STORE "" TO queinm,queprp,quetip,queciu,queest,QUEUNI
store 1 to minobj
store 3 to maxobj
STORE .F. TO M.HUBORES

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

IF NOT WEXIST("queryinm") ;
	OR UPPER(WTITLE("QUERYINM")) == "QUERYINM.PJX" ;
	OR UPPER(WTITLE("QUERYINM")) == "QUERYINM.SCX" ;
	OR UPPER(WTITLE("QUERYINM")) == "QUERYINM.MNX" ;
	OR UPPER(WTITLE("QUERYINM")) == "QUERYINM.PRG" ;
	OR UPPER(WTITLE("QUERYINM")) == "QUERYINM.FRX" ;
	OR UPPER(WTITLE("QUERYINM")) == "QUERYINM.QPR"
	DEFINE WINDOW queryinm ;
		FROM INT((SROW()-13)/2),INT((SCOL()-77)/2) ;
		TO INT((SROW()-13)/2)+12,INT((SCOL()-77)/2)+76 ;
		TITLE " L죑ites del Listado " ;						
		FOOTER ' '+JANNAME+' ' ;
		NOFLOAT ;
		NOCLOSE ;
		SHADOW ;
		NOMINIMIZE ;
		DOUBLE ;
		COLOR SCHEME 1
ENDIF


*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �              QUERYINM/MS-DOS Screen Layout              �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
IF WVISIBLE("queryinm")
	ACTIVATE WINDOW queryinm SAME
ELSE
	ACTIVATE WINDOW queryinm NOSHOW
ENDIF
@ 1,1 GET m.filinm ;
	PICTURE "@*RVN \<Todos los Inmuebles;\<Un Inmueble;\<Opciones" ;
	SIZE 1,23,0 ;
	DEFAULT 1 ;
	WHEN betw(_curobj,minobj,maxobj) ;
	VALID _r3p12v1pv()
@ 1,26 GET m.filprp ;
	PICTURE "@*RVN \<Todos los Propietar.;\<Opciones;\<Resumen" ;
	SIZE 1,24,0 ;
	DEFAULT 1 ;
	WHEN FILINM=3 .AND. betw(_curobj,minobj,maxobj) ;
	VALID VAL_OBJ1() ;
	MESSAGE "Propietarios"
@ 1,51 GET m.filtip ;
	PICTURE "@*RVN \<Todo Tipo de Unidad ;\<Opciones;\<Resumen" ;
	SIZE 1,24,0 ;
	DEFAULT 1 ;
	WHEN M.FILINM=3 .AND. betw(_curobj,minobj,maxobj-IIF(M.HUBORES,1,0)) ;
	VALID VAL_OBJ1() ;
	MESSAGE "Tipo de Unidad"
@ 6,1 GET m.filciu ;
	PICTURE "@*RVN \<Todas las Ciudades ;\<Opciones;\<Resumen" ;
	SIZE 1,23,0 ;
	DEFAULT 1 ;
	WHEN M.FILINM=3 .AND. betw(_curobj,minobj,maxobj-IIF(M.HUBORES,1,0)) ;
	VALID VAL_OBJ1() ;
	MESSAGE "Localidades"
@ 6,51 GET m.filest ;
	PICTURE "@*RVN \<Todos los Estados;\<Opciones;\<Resumen" ;
	SIZE 1,21,0 ;
	DEFAULT 1 ;
	WHEN FILINM=3 .AND. betw(_curobj,minobj,maxobj-IIF(M.HUBORES,1,0)) ;
	VALID VAL_OBJ1(.T.) ;
	MESSAGE "Estado"

IF NOT WVISIBLE("queryinm")
	ACTIVATE WINDOW queryinm
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
*       �              QUERYINM/MS-DOS Cleanup Code               �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
=opgar()
=opprp()
IF LAST()#27
   FISC=".T."
   tt='Listado de Inmuebles'
   if TIPOLIS=1
      CANT_MAX=7
   ELSE
      IF TIPOLIS=2
         CANT_MAX=15
      ENDIF
   ENDIF
   DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
   IF TIPOLIS=1
      TEXTO[1,1]='CODIGO INMUEBLE'
      TEXTO[2,1]='TIPO UNIDAD'
      TEXTO[3,1]='DOMICILIO'
      TEXTO[4,1]='LOCALIDAD'
      TEXTO[5,1]='PROPIETARIO'
      TEXTO[6,1]='FECHA INGRESO'
      TEXTO[7,1]='ESTADO'

      TEXTO[1,2] =10
      TEXTO[2,2] =10
      TEXTO[3,2] =40
      TEXTO[4,2] =10
      TEXTO[5,2] =20
      TEXTO[6,2] =8
      TEXTO[7,2] =10
   ELSE
      TEXTO[1,1]='CODIGO INMUEBLE'
      TEXTO[2,1]='DOMICILIO'
      TEXTO[3,1]='LOCALIDAD'
      TEXTO[1,2] =10
      TEXTO[2,2] =40
      TEXTO[3,2] =20
      IF TIPOLIS=2
         TEXTO[4,1]='N� MUNICIPAL COMPLETO'
         TEXTO[5,1]='N� MUNICIPAL PARCIAL'
         TEXTO[6,1]='RECIBE MUNICIPAL'
         TEXTO[7,1] ='% MUNICIPAL'
         TEXTO[8,1]='N� INMOBILIARIO COMPLETO'
         TEXTO[9,1]='N� INMOBILIARIO PARCIAL'
         TEXTO[10,1]='RECIBE INMOBILIARIO'
         TEXTO[11,1] ='% INMOBILIARIO'
         TEXTO[12,1]='N� DIPOS COMPLETO'
         TEXTO[13,1]='N� DIPOS PARCIAL'
         TEXTO[14,1]='RECIBE DIPOS'
         TEXTO[15,1] ='% DIPOS'

         TEXTO[4,2]=30
         TEXTO[5,2]=15
         TEXTO[6,2]=2
         TEXTO[7,2]=6
         TEXTO[8,2]=30
         TEXTO[9,2]=15
         TEXTO[10,2]=2
         TEXTO[11,2]=6
         TEXTO[12,2]=30
         TEXTO[13,2]=15
         TEXTO[14,2]=2
         TEXTO[15,2]=6
      ENDIF
   ENDIF

   store "" to ttque
   store .t. to habilitado
   *  STORE !XAREC_IMP TO HABILITADO[19], HABILITADO[15], HABILITADO[11]
   IF FILINM=1
      TTQUE=QW_TT("Todos los Inmuebles")
   ELSE
      HABILITADO[2]=qw_TIP(4,51,'INM.TIPOUNID') .or. xinm
      HABILITADO[5]=qw_PRP(4,26,'INM.PROCOD',.T.) .or. xinm
      HABILITADO[4]=qw_CIU('INM.LOCALIDAD') .or. xinm
      HABILITADO[7]=qw_EST(9,52,'INM.ESTADO') .or. xinm

      ***** FISC
      QUETIP=QUEUNI
      FILTIP=FILUNI
      TTTIP=TTUNI
      FISC=qw_FISC(FISC,queinm)
      FISC=qw_FISC(FISC,quetip)
      FISC=qw_FISC(FISC,queprp)
      FISC=qw_FISC(FISC,queciu)
      FISC=qw_FISC(FISC,queest)
      FISC=IIF(EMPTY(FISC),'.T.',FISC)
      ***** TITULOS
      store "Resumen por " to ressu
      TTQUE=QW_TT(ttinm)+QW_TT(tttip)+;
        QW_TT(ttprp)+QW_TT(ttciu)+QW_TT(ttest)
   ENDIF
   =RELEWIN("queryinm")
   **** AL FIN LISTADOS
   =acopy(habilitado,habilant)
   do while CFGFAC()
      =IIF(Q_PORPAN,LINMP(),LINMI())
      =KTRUCH()
      store .f. to variable
   ENDdo
   store .f. to variable
   =acopy(habilant,habilitado)
ENDIF
=RELEWIN("queryinm")
RETURN LAST()#27 .AND. FILINM#2


*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � _R3P12V1PV           m.filinm VALID                     �
*       �                                                         �
*       � Function Origin:                                        �
*       �                                                         �
*       � From Platform:       MS-DOS                             �
*       � From Screen:         QUERYINM,     Record Number:    2  �
*       � Variable:            m.filinm                           �
*       � Called By:           VALID Clause                       �
*       � Object Type:         Radio Button                       �
*       � Snippet Number:      1                                  �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*
FUNCTION _r3p12v1pv     &&  m.filinm VALID
#REGION 1
IF READKEY()=15 .OR. READKEY()=271
   if _curobj=2
      do inm.spr WITH .F.,.T.
      _CUROBJ=1
	  store 1 to filinm
      =sget("QUERYINM")
   else
      MINOBJ=CEIL(_CUROBJ/3)*3+1
      MAXOBJ=MINOBJ+2
      _CUROBJ=MINOBJ
   endif
ENDIF
RETURN .T.
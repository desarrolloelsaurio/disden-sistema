*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � 06/27/95              LARA.PRG                 23:13:35 �
*       �                                                         �
*       픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � GREGORIO REINER                                         �
*       �                                                         �
*       � Copyright (c) 1995 G. REINER                            �
*       � MITRE 1480 4� 'B'                                       �
*       � ROSARIO, S.FE  2000                                       �
*       �                                                         �
*       � Description:                                            �
*       � This program was automatically generated by GENSCRN.    �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

PARAMETERS porpan

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �           LARA/MS-DOS Setup Code - SECTION 1            �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
STORE "" TO ttara, ttuni, tttar,fisc,ttque,tt
STORE 1  TO filara,filuni,filtar
STORE "" TO queara,queuni,quetar
store 1 to minobj
store 3 to maxobj
STORE .F. TO M.HUBORES,M.CONRES




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

IF NOT WEXIST("lara") ;
	OR UPPER(WTITLE("LARA")) == "LARA.PJX" ;
	OR UPPER(WTITLE("LARA")) == "LARA.SCX" ;
	OR UPPER(WTITLE("LARA")) == "LARA.MNX" ;
	OR UPPER(WTITLE("LARA")) == "LARA.PRG" ;
	OR UPPER(WTITLE("LARA")) == "LARA.FRX" ;
	OR UPPER(WTITLE("LARA")) == "LARA.QPR"
	=MOVEWIX("lara",	INT((SROW()-8)/2), INT((SCOL()-76)/2), INT((SROW()-8)/2)+7, INT((SCOL()-76)/2)+75," L죑ites del Listado "		)	
ENDIF


*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �                LARA/MS-DOS Screen Layout                �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
IF WVISIBLE("lara")
	ACTIVATE WINDOW lara SAME
ELSE
	ACTIVATE WINDOW lara NOSHOW
ENDIF
@ 1,1 GET m.filara ;
	PICTURE "@*RVN \<Todos los Aranceles;\<Un Arancel;\<Opciones" ;
	SIZE 1,23,0 ;
	DEFAULT 1 ;
	WHEN betw(_curobj,minobj,maxobj) ;
	VALID _r1f1ds773() ;
	MESSAGE "L죑ites del Listado de Aranceles"
@ 1,25 GET m.filtar ;
	PICTURE "@*RVN \<Todo Tipo de Arancel;\<Opciones;\<Resumen" ;
	SIZE 1,24,0 ;
	DEFAULT 1 ;
	WHEN M.FILARA=3 .AND. betw(_curobj,minobj,maxobj-IIF(M.HUBORES,1,0)) ;
	VALID _r1f1ds7gk() ;
	MESSAGE "L죑ites de Tipo de Arancel"
@ 1,50 GET m.filuno ;
	PICTURE "@*RVN \<Todas las Unidades ;\<Opciones;\<Resumen" ;
	SIZE 1,23,0 ;
	DEFAULT 1 ;
	WHEN M.FILARA=3 .AND. betw(_curobj,minobj,maxobj-IIF(M.HUBORES,1,0)) ;
	VALID VAL_OBJ1(.T.) ;
	MESSAGE "L죑ites de Unidades"

IF NOT WVISIBLE("lara")
	ACTIVATE WINDOW lara
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
*       �                LARA/MS-DOS Cleanup Code                 �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
IF LAST()#27
   IF FILARA=1
      FISC='FILTRO="A"'
      TTQUE='Listado de Aranceles'
      IF M.PORPAN
         DO LARAP
      ELSE
         DO LARAI
      ENDIF
   ELSE
      IF FILARA=3
         FISC=QW_FISC('FILTRO="A"',QUETAR)
         FISC=QW_FISC(FISC,QUEUNI)
         tt='Listado de Aranceles'
         TTQUE=tt+QW_TT(tttar)+QW_TT(ttuni)
         IF M.PORPAN
            DO LARAP
         ELSE
            DO LARAI
         ENDIF
         =ktruch()
      ENDIF
   ENDIF
   =OFF_TMP()
   =OPARA(.T.)
ENDIF
RETURN RELEWIN("LARA")


*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � _R1F1DS773           m.filara VALID                     �
*       �                                                         �
*       � Function Origin:                                        �
*       �                                                         �
*       � From Platform:       MS-DOS                             �
*       � From Screen:         LARA,     Record Number:    2      �
*       � Variable:            m.filara                           �
*       � Called By:           VALID Clause                       �
*       � Object Type:         Radio Button                       �
*       � Snippet Number:      1                                  �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*
FUNCTION _r1f1ds773     &&  m.filara VALID
#REGION 1
IF READKEY()=15 .OR. READKEY()=271
   if _curobj=2
      IF ELIARA(-1,1,'')
         SCAT MEMV
         if porpan
            DO ARA.SPR WITH .T.
            store 1 to filara
            =sget("LARA")
         endif
      ENDIF
   else
      MINOBJ=CEIL(_CUROBJ/3)*3+1
      MAXOBJ=MINOBJ+2
      _CUROBJ=MINOBJ
   endif
ENDIF
RETURN .T.

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � _R1F1DS7GK           m.filtar VALID                     �
*       �                                                         �
*       � Function Origin:                                        �
*       �                                                         �
*       � From Platform:       MS-DOS                             �
*       � From Screen:         LARA,     Record Number:    3      �
*       � Variable:            m.filtar                           �
*       � Called By:           VALID Clause                       �
*       � Object Type:         Radio Button                       �
*       � Snippet Number:      2                                  �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*
FUNCTION _r1f1ds7gk     &&  m.filtar VALID
#REGION 1
IF READKEY()=15 .OR. READKEY()=271
   IF FILTAR=2
      =qw_tar(4,25,"left(mix.texto1,2)")
   ENDIF
   MINOBJ=CEIL(_CUROBJ/3)*3+1
   IF CONRES
      HUBORES=(HUBORES .OR. empty(_curobj%3))
   ENDIF
   MAXOBJ=MINOBJ+2
   _CUROBJ=MINOBJ
ENDIF
RETURN .T.
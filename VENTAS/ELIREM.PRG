*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � 25/07/94             ELIREM.PRG                10:58:50 �
*       �                                                         �
*       픔컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       � Author's Name                                           �
*       �                                                         �
*       � Copyright (c) 1994 Company Name                         �
*       � Address                                                 �
*       � City,     Zip                                           �
*       �                                                         �
*       � Description:                                            �
*       � This program was automatically generated by GENSCRN.    �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

PARAMETERS el_mess,el_tipo

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �          ELIREM/MS-DOS Setup Code - SECTION 1           �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
EL_TIPO=IIF(EMPTY(EL_TIPO),"",EL_TIPO)
STORE SPACE(14) TO M.REMITO

#REGION 0
REGIONAL m.currarea, m.talkstat, m.compstat

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �                MS-DOS Window definitions                �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

DEFINE WINDOW fic ;
	FROM INT((SROW()-5)/2),INT((SCOL()-30)/2) ;
	TO INT((SROW()-5)/2)+4,INT((SCOL()-30)/2)+29 ;
	TITLE " ELIJA EL REMITO " ;
	NOFLOAT ;
	NOCLOSE ;
	SHADOW ;
	NOMINIMIZE ;
	COLOR SCHEME 1


*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �               ELIREM/MS-DOS Screen Layout               �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
IF WVISIBLE("fic")
	ACTIVATE WINDOW fic SAME
ELSE
	ACTIVATE WINDOW fic NOSHOW
ENDIF
@ 1,2 SAY "Remito" ;
	SIZE 1,6, 0
@ 1,12 GET m.remito ;
	SIZE 1,14 ;
	DEFAULT " " ;
	PICTURE "@!" ;
	MESSAGE "Ingrese N� de Remito "+el_mess

IF NOT WVISIBLE("fic")
	ACTIVATE WINDOW fic
ENDIF

READ

RELEASE WINDOW fic

#REGION 0

*       靈컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*       �                                                         �
*       �               ELIREM/MS-DOS Cleanup Code                �
*       �                                                         �
*       聃컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
*

#REGION 1
STORE .F. TO M.EL_SALIDA
IF LAST()#27
   M.REMITO=Q_FAC(M.REMITO)
   ACTI WIND FIC
   @ 1,12 say M.REMITO
   IF !EMPTY(VAL(RIGHT(M.REMITO,8)))
      SELE REM
      SET ORDER TO TAG REMITO
      IF SEEK(M.REMITO)
         STORE .T. TO M.EL_SALIDA
         IF REM.TIPO#M.EL_TIPO
            STORE .F. TO M.EL_SALIDA
            WAIT "REMITO "+ALLTRIM(M.REMITO)+" ENCONTRADO, PERO ES "+QTIP_REM(M.EL_TIPO) WIND NOWA
         ENDIF
      ELSE
         WAIT "REMITO "+ALLTRIM(M.REMITO)+" NO EXISTE" WIND NOWA
      ENDIF
   ENDIF
ENDIF
RELE WIND FIC
RETURN M.EL_SALIDA

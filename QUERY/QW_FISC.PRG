* 旼 FUNCTION컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_FISC.PRG                                                �
* �       Author: G. REINER                                                  �
* � Date created: 10-25-92                                                   �
* � Time created: 09:45:03pm                                                 �
* � QUE HACE    : DEVUELVE EL FISC PARA LISTADOS                             �
* � modificado  : BATA 26/10/92                                              �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION QW_FISC
PARAMETER FICS,COZ
PRIVATE FICS,COZ,FISC_SAL
IF EMPTY(FICS) .OR. FICS=='.T.' .OR. FICS=='.t.'
   IF EMPTY(COZ) .OR. COZ=='.T.' .OR. COZ=='.t.'
       FISC_SAL='.T.'
   ELSE
       FISC_SAL=COZ
   ENDIF
ELSE
   IF EMPTY(COZ) .OR. COZ=='.T.' .OR. COZ=='.t.'
       FISC_SAL=FICS
   ELSE
       FISC_SAL=FICS+' .AND. '+COZ
   ENDIF
ENDIF
RETURN FISC_SAL

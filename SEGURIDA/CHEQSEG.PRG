* �� Funci�n ���������������������������������Ŀ
* �  Application: DEVUELVE ESTADO DE SEGURIDAD �
* �    File Name: CHEQSEG.PRG                  �
* �       Author: G. REINER                    �
* � Date created: 09-04-92                     �
* � Time created: 02:08:28am                   �
* � EL MENOR NUMERO ES EL DE MAS IMPORTANCIA   �
* ����������������������������������������������
FUNCTION CHEQSEG
#DEFINE NUL    0                                 && NUL
SELE SEG
SEEK ulpr
IF coefseg=1 .OR. !FOUND() .OR. M.coefseg<=SEG.cseg
RETURN .T.
ENDIF
RETURN TO MASTER

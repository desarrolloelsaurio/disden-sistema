* ÚÄ Funci¢n ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Application: DEVUELVE ESTADO DE SEGURIDAD ³
* ³    File Name: CHEQSEG.PRG                  ³
* ³       Author: G. REINER                    ³
* ³ Date created: 09-04-92                     ³
* ³ Time created: 02:08:28am                   ³
* ³ EL MENOR NUMERO ES EL DE MAS IMPORTANCIA   ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION CHEQSEG
#DEFINE NUL    0                                 && NUL
SELE SEG
SEEK ulpr
IF coefseg=1 .OR. !FOUND() .OR. M.coefseg<=SEG.cseg
RETURN .T.
ENDIF
RETURN TO MASTER

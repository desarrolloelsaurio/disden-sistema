**********************************************************
*-- Programa: ELIMIXN1.PRG
*-- Fecha   : 05-16-92 10:24pm
*-- Version : G. REINER
*-- Notas   : SELECCION GENERAL PARA ELIMIXN1 POR TECLADO
*--           EL CODIGO ES NUMERICO
*-- Modificaci¢n GOYO
**********************************************************
FUNCTION ELIMIXN1
PARAMETER EL_MESS,EL_ALIAS,EL_ORDER,EL_LARGO
#DEFINE NUL    0                                 && NUL
EL_LARGO=iif(parameter()=3,2,EL_LARGO)
STORE nul TO RESPUESTA
IF r1=-1
   DO infic WITH EL_MESS,val(repl("9",EL_LARGO))
ELSE
   @ r1,c1 GET respuesta PICTURE repl("9",EL_LARGO)
   READ
ENDIF
RESPUESTA=IIF(EMPTY(RESPUESTA) .OR. LASTKEY()=27,NUL,RESPUESTA)
RETURN XSEEK(RESPUESTA,(EL_ALIAS),(EL_ORDER))

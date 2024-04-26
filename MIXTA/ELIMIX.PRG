********************************************************
*-- Programa: ELIMIX1.PRG
*-- Fecha   : 05-16-92 10:24pm
*-- Version : G. REINER
*-- Notas   : SELECCION GENERAL PARA ELIMIX POR TECLADO
********************************************************
FUNCTION ELIMIX1
PARAMETER ELMES,ELALI,ELORDR,ellargo
PRIVATE ELMES,ELALI,ELORDR,ellargo
ellargo=iif(parameter()=3,2,ellargo)
STORE space(ellargo) TO RESPUESTA
IF r1=-1
   DO infic1 WITH RECC('mix'),'INGRESE '+elmes,ellargo
ELSE
   @ r1,c1 GET respuesta PICTURE repl("!",ellargo)
   READ
ENDIF
RESPUESTA=IIF(EMPTY(RESPUESTA) .OR. LASTKEY()=27,SPACE(ELLARGO),RESPUESTA)
RETURN IIF(XSEEK(RESPUESTA,(ELALI),(ELORDR)),RECNO(),NUL)

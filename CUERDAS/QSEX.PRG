*************************************
*-- Programa: qsex.PRG
*-- Fecha   : 06/14/91 05:28pm
*-- Version : G. REINER -
*-- Notas   : devuelve texto de sexo
*************************************
FUNCTION qsex
PARA cosa
if type("cosa")="C"
RETURN PADR(IIF(cosa='H',"Hombre",IIF(cosa='M',"Mujer",IIF(cosa='C',"Colegial",IIF(cosa='J',"J¢venes",IIF(cosa="U","Unisex",IIF(COSA="N","No","??")))))),8)
else
return PADR(IIF(COSA=1,"Hombre",;
IIF(COSA=2,"Mujer",;
IIF(COSA=3,"Colegial",;
IIF(COSA=4,"J¢venes",;
IIF(COSA=5,"Unisex",;
IIF(COSA=6,"No","??")))))),8)
ENDIF
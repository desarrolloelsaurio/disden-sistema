********************************************************************************
*-- Programa: XASCII.PRG
*-- Fecha   : 07-10-92 11:54am
*-- Version : G. REINER
*-- Notas   : IMPRESION EN ARCHIVO ASCII O NO
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
ulpr=HORA_ULP(PROGRAM())
=MOVEWIN(10,14,14,66,'WIN',' Impresi¢n en Archivo ASCII ')
publ va1
IF TYPE("ENASCII")="U"
   RELE ENASCII
   PUBL ENASCII
ENDIF   
=ponelinp(@enascii,'Listados en Archivo ')
read
rele va1
RETURN RELEWIN("win") .AND. MEN_LIN(BOTOM)

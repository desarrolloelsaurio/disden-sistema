*******************************************************
*-- Programa: DNI.PRG
*-- Fecha   :
*-- Version : GOYO
*-- Notas   : DERIVA A OPERACIONES DE TIPO DE DOCUMENTO
*-- Reduccion 08-30-95 11:29pm
*******************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
PROCEDURE DNI
EXTERNAL PROCEDURE ELIDNI
ULPR=PROGRAM()
RETURN MIX("Tipo de Documento","Tipos de Documento","TIPO DOCUMENTO","TIPOS DE DOCUMENTO","DNITEX","DNICOD","ORDDNI","D")

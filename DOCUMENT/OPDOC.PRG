***********************************************
*-- Programa: OPDOC.PRG
*-- Fecha   : 11/02/91 13:31am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE DOCUMENTACION
*-- Modificación GOYO (area 22)
***********************************************
PARAMETER SHIT
#DEFINE BOTOM  "  "+repl("░",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
=men_lin(ABA+IIF(_WINDOWS,'Documentaciˇn','Documentación'))
=GETDBF('document',.F.,'DOC',22)
RETURN MEN_LIN(BOTOM)

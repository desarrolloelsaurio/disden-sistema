*****************************************
*-- Programa: OPMER.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MERCADERIAS
****************************************
#DEFINE BOTOM "  "+repl("°",78)                  && BOTOM
#DEFINE ABA          "Abriendo Base de "         && ABA
SELE 25
USE
=MEN_LIN(ABA+"Mercader¡as")
SELE 25
USE (PATHPRO+'\MERCA') ORDER TAG ARTICULO ALIAS STOS
RETURN MEN_LIN(BOTOM)

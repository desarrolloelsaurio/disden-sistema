*****************************************
*-- Programa: QTIP.PRG
*-- Fecha   : 06/19/91
*-- Version : G. REINER
*-- Notas   : DEVUELVE EL TIPO DE KARDEX
*****************************************
FUNCTION QTIP
PARA OPE
RETURN(PADR(IIF(OPE="M","Mercader¡as",IIF(OPE="T","Telas","Av¡os")),11))

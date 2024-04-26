********************************************************************************
*-- Programa: SINCOSAS.PRG
*-- Fecha   : 06/14/91 05:28pm
*-- Version : G. REINER -
*-- Notas   : devuelve texto SIN CARACTERES RAROS
********************************************************************************
FUNCTION sincosas
PARA uno
respuesta=CHRTRAN(uno,'¤¥‚ ¢£¡&*-/. ',"")
RETURN respuesta

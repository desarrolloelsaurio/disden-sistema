******************************************
*-- Programa: OPFARX.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS
* VERSION RAFULS
******************************************
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
SELE 9
=men_lin(ABA+'Facturas')
   USE (pathcns+'\FACTUDAC') ORDER TAG FACTUDAC ALIAS FAD EXCL
SELE 8
   USE (pathcns+'\FACTURAC') ORDER TAG FACTURAC ALIAS FAR EXCL
=men_lin(BOTOM)
RETURN

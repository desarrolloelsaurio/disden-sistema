******************************************
*-- Programa: OPFAR.PRG
*-- Fecha   : 07/04/91 10:55am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO FACTURAS
* VERSION RAFULS
******************************************
SELE 9
=men_lin(ABA+'Facturas')
IF ALIAS()#'FAD'
   USE (pathcns+'\FACTUDAC') ORDER TAG FACTUDAC ALIAS FAD
ENDIF
SELE 8
IF ALIAS()#'FAR'
   USE (pathcns+'\FACTURAC') ORDER TAG FACTURAC ALIAS FAR
ENDIF
RETURN men_lin(BOTOM)

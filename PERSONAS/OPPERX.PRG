****************************************************
*-- Programa: OPPERX.PRG
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE PERSONAS - EXCLUSIVO
***************************************************
=CLOSDBF("PER")
=CLOSDBF('PER')
=PRXAREA(.T.)
USE (pathpro+'\PERSONAS') ALIAS PER EXCL
RETURN .t.

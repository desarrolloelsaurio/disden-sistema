********************************************************************************
*-- Programa: OPMERX.PRG
*-- Fecha   : 12/13/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MERCADERIAS EXCLUSIVO
********************************************************************************
=MEN_LIN('Abriendo archivo de Mercader¡as')
SELE 14
USE (path+'\MERCA') ALIAS mer EXCL
SELE 15
USE (path+'\MERCA1') ALIAS mex EXCL
=MEN_LIN(BOTOM)
RETURN

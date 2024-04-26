*******************************************
*-- Programa: OPMAR.PRG
*-- Fecha   : 11-21-91 11:21am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MARCAS DE PRODUCTOS
*-- VERSION NOVOGAR
*******************************************
IF USED("MI1")
   SELE MI1
   SET ORDER TO TAG MARTEX   
ELSE
   =MEN_LIN(ABA+"Marcas")
   SELE 2
   =GETDBF('MIXTA1','MARTEX','MI1')
ENDIF
RETURN IIF(MARPOP,DEFPOMI1(MARPOPR,MARPOPC),.T.) .AND. MEN_LIN(BOTOM)

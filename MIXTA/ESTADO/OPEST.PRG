********************************************************************************
*-- Programa: OPEST.PRG
*-- Fecha   : 06/12/91 01:50pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO ESTADOS
********************************************************************************
IF ESOPEN("Estados",1,"MIX")
   USE (pathpro+'\MIXTA') ORDER TAG estTEX ALIAS mix
ELSE
   SET ORDER TO TAG estTEX
ENDIF
IF estpop
   DEFI POPU mixPOP FROM estpopr,estpopc PROMPT FIELD mix->texto1 MESS 'Elija el Estado' SHAD COLOR SCHE 3 IN SCREEN
   ON SELE POPU mixPOP DO resp1
ENDIF
=MEN_LIN(BOTOM)
RETURN

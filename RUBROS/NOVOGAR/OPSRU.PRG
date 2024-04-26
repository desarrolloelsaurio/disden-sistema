********************************************************************************
*-- Programa: OPSRU.PRG
*-- Fecha   : 11-19-91 05:26pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO sub-RUBROS
*-- Modificaci¢n GOYO 07-29-92 01:14am
*******************************************************************************
IF ESOPEN("Sub-Rubros",16,"RUB")
   USE (pathpro+'\RUBROS') order tag subrubro ALIAS rub
ENDIF
IF srupop
   DEFI POPU Srubpop ;
   FROM max(2,rubpopr),rubpopc ;
   TO 22,min(79,rubpopc+35) ;
   PROMPT FIELD rub.rubro+" ("+LEFT(RUB.PALISTAR,15)+')' ;
   MESS 'Elija el Sub-Rubro' ;
   SHAD ;
   COLOR SCHE 3 ;
   IN SCREEN
   ON SELE POPU Srubpop DO resp1
ENDIF
RETURN

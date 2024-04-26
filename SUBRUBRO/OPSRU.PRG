*******************************************
*-- Programa: OPSRU.PRG
*-- Fecha   : 11-19-91 05:26pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO sub-RUBROS
*-- Modificaci¢n GOYO 07-29-92 01:14am
*******************************************
IF USED("RUB")
   SET ORDER TO TAG SUBRUBRO 
ELSE
   =MEN_LIN(ABA+"Sub-Rubros")
   #IF "PRODU" $ CURDIR() .AND. "STOC" $ CURDIR()
       =PRXAREA(.T.)
   #ELSE
    SELE 16
   #ENDIF
 	USE (PATHPRO+'\RUBROS') ORDER TAG SUBRUBRO ALIAS RUB
ENDIF
RETURN IIF(SRUPOP,DEFPOGRL(RUBPOPR,RUBPOPC,"SRUBPOP","RUB.RUBRO+' ('+LEFT(RUB.PALISTAR,15)+')'",40,"ELIJA EL RUBRO"),.T.)

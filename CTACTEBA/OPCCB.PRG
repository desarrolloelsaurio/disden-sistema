****************************************
*-- Programa: OPCCB.PRG
*-- Fecha   : 06/07/91 10:58am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE PERSONAS
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("CCB")
   SELE CCB
   RETURN MEN_LIN(BOTOM)
ENDIF   
RETURN MEN_LIN(ABA+" Cuenta Corriente Bancaria") .AND. ;
GETDBF('CTACTEBA',"CODBAN","CCB",PRXAREA()) .AND. ;
MEN_LIN(BOTOM)

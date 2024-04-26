***********************************
*-- Programa: OPAVI.PRG
*-- Fecha   : 05/28/91 01:53am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO AVIOS
***********************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("AVI")
   SELE AVI
ELSE   
   =MEN_LIN(ABA+abios)
   SELE 25
   =GETDBF('AVIOS','AVICOD','avi',25)
ENDIF
IF avipop
   =DEFPOGRL(avipopr,avipopc,"avipop","avi.avios",30,'Elija '+abio)
ELSE
   RELE POPU avipop
ENDIF
RETURN MEN_LIN(BOTOM)

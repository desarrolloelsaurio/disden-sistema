********************************************************************************
*-- Programa: ELIuni.PRG
*-- Fecha   : 06/13/91 06:22pm
*-- Version : g. reiner
*-- Notas   : ELIGE LA uniDAD
********************************************************************************
FUNCTION eliuni
PARA msg,r1,c1
ACTI SCRE
=MEN_LIN('Unidad '+msg)
@ 2,40 MENU unid,30,10 TITLE 'Unid. '+msg SHADOW
STORE 0 TO respuesta
READ MENU TO respuesta
IF respuesta<1 .OR. unid[respuesta]=SPACE(20) .OR. LASTKEY()#13
   STORE 0 TO respuesta
ENDIF
RETURN respuesta 

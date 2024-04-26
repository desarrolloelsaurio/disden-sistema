********************************************************************************
*-- Programa: ELIlis.prg
*-- Fecha   : 07/03/91 11:13am
*-- Version : g. reiner
*-- Notas   : ELIGE LA lista de precios del cliente
********************************************************************************
FUNCTION elilis
PARA msg,n1,n2
ACTI SCRE
=men_lin('Lista de Precios '+msg)
DIME xiva[4]
xiva[1]=xalis1
xiva[2]=xalis2
xiva[3]=xalis3
xiva[4]=xalis4
@ 2,40 MENU xiva,4,4 TITLE ' Lista '+msg SHAD
STOR NUL TO respuesta
READ MENU TO respuesta
IF respuesta<1 .OR. LASTKEY()#13
   STOR NUL TO respuesta
ENDIF
RETURN respuesta

********************************************************************************
*-- Programa: AVDIS.PRG
*-- Fecha   : 04/08/91 07:54pm
*-- Version : G. REINER
*-- Notas   : AVISA QUE SE COLOQUE EL DISCO
********************************************************************************
STORE 'NO' TO respuesta
@ 24,0 SAY PADC(" Cuidado con lo que va a hacer !!! ",80,"*") COLO SCHE 19
DEFINE WINDOW fic FROM 10,0 TO 14,77 DOUBLE TITL " Recupera Informaci¢n del Backup " SHADOW COLOR SCHE 8
ACTI WINDOW fic
@ 1,10 SAY "Confirma la operaci¢n ? " GET respuesta PICTURE '@M NO,SI'
READ
RELE WINDOW fic
@ 24,0 SAY SPACE(80)
IF respuesta="NO"
   RETURN TO MASTER
ELSE
   DEFINE WINDOW win FROM 1,0 TO 24,79 NONE
   ACTI WINDOW win
ENDIF
RETURN

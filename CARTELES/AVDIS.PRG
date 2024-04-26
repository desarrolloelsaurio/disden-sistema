*********************************************
*-- Programa: AVDIS.PRG
*-- Fecha   : 04/08/91 07:54pm
*-- Version : G. REINER
*-- Notas   : AVISA QUE SE COLOQUE EL DISCO
*-- Modificaci¢n GOYO 05-17-92 12:00pm
********************************************
STORE 'NO' TO respuesta
=men_lin(" Cuidado con lo que va a hacer !!! ")
=movewin(10,nul,14,77,'fic'," Recupera Informaci¢n del Backup ")
@ 1,10 SAY "Confirma la operaci¢n ? " GET respuesta PICTURE '@M NO,SI'
READ
=relewIN("fic")
=men_lin(botom)
IF respuesta="NO"
   RETURN TO produc
ELSE
   =win0()
   =relewin('win')
ENDIF
RETURN

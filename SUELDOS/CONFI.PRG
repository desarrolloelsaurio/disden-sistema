********************************************************************************
*-- Programa: CONFI.PRG
*-- Fecha   : 11/20/90 04:05pm
*-- Version : G. REINER
*-- Notas   : FUNCION CONFIRMACION
*--           VENT (LOGICA) SI ABRE VENTANA PARA CONFIRMAR
*--           TX (chr) TEXTO DE LA PREGUNTA
*--           R Y C (NUM) RENGLON Y COLUMNA SI NO HAY VENTANA
********************************************************************************
FUNCTION CONFI
PARAMETER VENT,Tx,R,C
CN='  '
IF VENT
   DEFINE WINDOW fic FROM 10,0 TO 14,79 DOUBLE TITL ' Confirma ' shad COLOR SCHE 8
   ACTI WINDOW fic
   @ 1,1 SAY Tx GET CN PICTURE '@M NO,SI'
ELSE
   @ R,C SAY Tx GET CN PICTURE '@M NO,SI'
ENDIF
READ
IF VENT
   RELE WINDOW fic
ENDIF
RETURN(CN='SI')


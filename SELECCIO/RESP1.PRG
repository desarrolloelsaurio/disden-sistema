********************************************************************************
*-- Programa: RESP1.PRG
*-- Fecha   : 26/08/89
*-- Version : G. REINER
*-- Notas   : LLEGA DE TODOS LOS POPUPS
*	      LA RESPUESTA SE GUARDA EN 'RESPUESTA' (VARIABLE PUBLICA)
********************************************************************************
STORE IIF(LAST()=27,NUL,BAR()) TO respuesta
DEAC POPUP
RETURN

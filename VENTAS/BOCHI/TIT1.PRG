********************************************************************************
*-- Programa: TIT1.PRG
*-- Fecha   : 29/9/89
*-- Version : G. REINER
*-- Notas   : IMPRIME TITULO EN PANTALLA
*      EL TITULO APARECE CENTRADO EN EL RENGLON 'RENGLON'
*      EL RECUADRO ES SOLO DEL LARGO DEL TEXTO 'TEXTO'
*      EL PARAMETRO 'COMO' CONTIENE LOS ATRIBUTOS DE IMPRESION
********************************************************************************
PARAMETERS renglon,texto,como
 
xxii=LEN(texto)
xxii=80-xxii
xxii=INT(xxii/2)
@ renglon,xxii SAY texto COLOR &como
@ renglon-1,xxii-1 TO renglon+1,xxii+LEN(texto) DOUB
RETURN

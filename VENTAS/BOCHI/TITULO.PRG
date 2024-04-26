********************************************************************************
*-- Programa: TITULO.PRG
*-- Fecha   : 29/9/89
*-- Version : G. REINER
*-- Notas   : IMPRIME TITULO EN PANTALLA
*      EL TITULO APARECE CENTRADO EN EL RENGLON 'RENGLON'
*      EL RECUADRO ES DEL LARGO DE LA PANTALLA
********************************************************************************
PARAMETERS renglon,texto
 
xxii=LEN(texto)
xxii=80-xxii
xxii=INT(xxii/2)
texto=SPACE(xxii-1)+texto+SPACE(xxii+3)
DO WHIL LEN(texto)=78
   texto=LEFT(texto,LEN(texto)-1)
ENDD
@ renglon,1 SAY texto COLOR W+/I
@ renglon-1,0 TO renglon+1,79 DOUB
RETURN

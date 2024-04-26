********************************************************************************
*-- Programa: KK.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : GENERA EL POPUP DE RECONSTRUCCION DE LOS ARCHIVOS
********************************************************************************
PARAMETER R,C
DEFI POPU caca FROM R,C MESSAGE 'Tipo de Restauraci¢n' SHADOW COLOR SCHE 3
DEFI BAR 1 OF caca PROM ' \<Reindexa'
DEFI BAR 2 OF caca PROM ' Reconstruye \<Indice '
DEFI BAR 3 OF caca PROM '----------------------' SKIP
DEFI BAR 4 OF caca PROM ' \<Levanta de Back-Up'
RETURN

********************************************************************************
*-- Programa: GRL.PRG
*-- Fecha   : 10/26/90 12:27pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP GRL
********************************************************************************
PARAMETER R,C,T
DEFI POPU grl FROM R,C MESS T SHADOW COLOR SCHE 3
DEFI BAR 1 OF grl PROM ' \<Ingreso'
DEFI BAR 2 OF grl PROM ' \<Correcci¢n '
DEFI BAR 3 OF grl PROM '------------------------' SKIP
DEFI BAR 4 OF grl PROM ' \<Borra'
DEFI BAR 5 OF grl PROM ' \<Recupera Ficha'
DEFI BAR 6 OF grl PROM '------------------------' SKIP
DEFI BAR 7 OF grl PROM ' \<Lista por Impresora '
DEFI BAR 8 OF grl PROM ' Lista por \<Pantalla'
DEFI BAR 9 OF grl PROM '------------------------' SKIP
DEFI BAR 10 OF grl PROM ' Restaura el \<Archivo '
RETURN

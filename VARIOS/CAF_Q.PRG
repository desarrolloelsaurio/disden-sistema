********************************************************************************
*-- Programa: CAF_Q
*-- Fecha   : 07-07-92 01:55am
*-- Version : EL BATA
*-- Notas   : DEVUELVE LA DENOMINACION COMPLETA DE UNA FACTURA
*-- Modificaci¢n GOYO 07-07-92 01:56am (si hay letra adelante, devuelve la letra)
********************************************************************************
FUNCTION CAF_Q
PARAMETER Q_COSA,SKU
Q_UNO=LEFT(Q_COSA,1)
Q_DOS=SACOLEFT(SUBSTR(Q_COSA,2,4),"0")
Q_TRES=SACOLEFT(SUBSTR(Q_COSA,7),"0")
RETURN Q_UNO+Q_DOS+'-'+Q_TRES

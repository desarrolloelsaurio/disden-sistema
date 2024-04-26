********************************************************************************
*-- Programa: IIM.FUNCT
*-- Fecha   : 11/10/89
*-- Version : G. REINER
*-- Notas   : IMPRIME CON FORMATO CORRECTO LEYENDA Y MONTO
********************************************************************************
FUNCTION IIM
PARA TTE,MMO
RETURN BAR+'          '+BAR+PADR(TTE,40)+BAR+'       '+MND+' '+BAR+STR(MMO,14,2)+BAR

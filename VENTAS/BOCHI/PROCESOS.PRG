********************************************************************************
*-- Programa: PROCESOS.PRG
*-- Fecha   : 25/10/89
*-- Version : G. REINER
*-- Notas   : GRUPO DE PROCEDIMIENTOS
********************************************************************************
********************************************************************************
*-- Programa: PORCEN.FUNC
*-- Fecha   : 4/10/89
*-- Version : G. REINER
*-- Notas   : CALCULA EL MONTO
*             LOS PARAMETROS SON EL VALOR, EL PORCENTAJE Y EL IVA
********************************************************************************
FUNCTION PORCEN
 
PARAMETERS VALOR,PORC,IMPU
VV=(VALOR+VALOR*PORC/100)*IIF(IMPU='S',1.15,1)
RETURN(VV)
********************************************************************************
*-- Programa: IM.FUNCT
*-- Fecha   : 8/10/89
*-- Version : G. REINER
*-- Notas   : IMPRIME EL RESULTADO EN BASE A COSTO, COSTO REAL, PORCENTAJE E IVA
********************************************************************************
FUNCTION IM
 
PARAMETER C,CR,PO,I
CT=C+C*CR/100
CT=CT+CT*PO/100
CT=CT*IIF(I="S",1.15,1)
RETURN(CT)
 

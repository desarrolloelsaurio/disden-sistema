*****************************************************************************
*-- Programa: XANUIM.PRG
*-- Fecha   : 12-23-92 09:02pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA N§ de Impresora a utilizar
********************************************************************************
ulpr=horA_ULP(PROGRAM())
XA_SALIDA=algun(20,"Impresora a Utilizar",;
"Impresora \<1;;
Impresora \<2;;
Impresora \<3","XANUIM")
rele lpt1,lpt2,lpt3
publ lpt1,lpt2,lpt3
STORE .F. TO M.CAPTURAR
DO CASE
CASE XA_SALIDA=2
	store .t. to lpt2
CASE XA_SALIDA=3
	store .t. to lpt2
OTHER
	store .t. to lpt1
ENDCASE
RETURN MEN_LIN(BOTOM)

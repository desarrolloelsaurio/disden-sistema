****************************************************************************
*-- Programa: COS.PRG
*-- Fecha   : 11-19-92 02:55am
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE COSTOS
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
do oppol
=OPPRO()
DO CASE
CASE BAR()=1
	do iCOS
CASE BAR()=2
    ttque=''
    fisc=grl2(' L¡mites de la Correcci¢n ')
    if fisc#'.F.'
       =WORKING()
       SELE MER
       INDE ON ARTICULO TO (GENTMP()) FOR EVAL(FISC) COMP
       DO CCOS
    endif
CASE BAR()=4
    ttque=''
    fisc=grl2(' L¡mites de la Actualizaci¢n ')
    if fisc#'.F.'
       =WORKING()
       SELE MER
       inde on ARTICULO TO (GENTMP()) FOR EVAL(FISC) COMP
       DO ACOS
    endif
CASE BAR()=6
	DO LCOS WITH .T.
CASE BAR()=7
	DO LCOS
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN

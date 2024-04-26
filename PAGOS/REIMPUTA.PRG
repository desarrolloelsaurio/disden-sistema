*******************************************************************************
*-- Programa: REIMPUTA.PRG
*-- Fecha   : 20-10-92 11:42am
*-- Version : R. 'EL BATA'
*-- Notas   : REIMPUTA PAGOS
********************************************************************************
ulpr=program()
=cabpan1()
do opemp
do opcaj
=OPPRO()
do opban
=OPGAS()
DO CASE
CASE BAR()=1
   DO reimp1
CASE BAR()=2
   DO reimp2
CASE BAR()=3
   DO reimp3
ENDCASE
=MEN_LIN(BOTOM)
RETURN

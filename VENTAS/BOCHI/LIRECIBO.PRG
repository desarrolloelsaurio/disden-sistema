********************************************************************************
*-- Name....: LIRECIBO.PRG
*-- Date....: 14/2/90
*-- Version.: G. REINER
*-- Notes...: LISTA RECIBOS, NOTAS DE DEDITO Y CREDITO
********************************************************************************
PARAMETERS COA,COITA,COLA
FILTRO=COLA
DO CASE
CASE BAR()=1
   DO LIRECDIA WITH COA,COITA,COLA
CASE BAR()=2
   DO LIRECMES WITH COA,COITA,COLA
CASE BAR()=3
   SELE FEMD
   SET FILTER TO FACFILTRO=FILTRO
   DO BORFEMD WITH COA
CASE BAR()=4
   DO BORECIBO WITH COA,COLA
ENDC
RETURN

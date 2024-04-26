******************************************************
*-- Programa: RESCESP.PRG
*-- Fecha   : 30/12/89
*-- Version : G. REINER
*-- Notas   : LISTADO DE CUENTA CORRIENTE ESPECIAL
*--           VIENE DE RESCTA
******************************************************
DO CASE
   *CASE BAR()=1
   *DO RESCIMP
CASE BAR()=2
   DO RESCULMO
CASE BAR()=3
   DO RESCULCO
CASE BAR()=4
   DO RESCULPA
   *CASE BAR()=5
   *DO RESCPART
ENDC
RETURN
 

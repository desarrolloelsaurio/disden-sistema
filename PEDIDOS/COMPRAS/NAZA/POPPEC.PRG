*:*********************************************************************
*:
*:        Program: POPPEC.PRG
*:
*:         System: SYSTEMA DE COMPRAS
*:         Author: GOYO REINER
*:      Copyright (c) 1992, NAZA S.R.L.
*:  Last modified: 11/18/91     15:06
*:
*:      Called by: PEC.PRG
*:               : FACTUR.PRG
*:
*:      Documented 01/30/92 at 15:49               FoxDoc  version 2.01
*:*********************************************************************
DO CASE
CASE BAR()=1
   tipopec = "M"
CASE BAR()=2
   tipopec = "T"
CASE BAR()=3
   tipopec = "A"
CASE BAR()=4
   tipopec = "X"
ENDCASE
DEAC POPUP
RETURN

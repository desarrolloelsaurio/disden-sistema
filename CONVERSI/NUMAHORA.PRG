*:*********************************************************************
*:
*: Procedure file: NUMAHORA.PRG
*:
*:         System: SYSTEMA DE CONTROL DE PRODUCCION
*:         Author: G. REINER
*:      Copyright (c) 1991, SISTEMAS INFORMATICOS S.R.L.
*:  Last modified: 07/12/91     14:11
*:
*:  Procs & Fncts: NUMAHORA()
*:
*:      Documented 07/26/91 at 10:59               FoxDoc  version 2.01
*:*********************************************************************
*!*********************************************************************
*!
*!       Function: NUMAHORA()
*!
*!      Called by: FECHORA()      (function  in FECHORA.PRG)
*!
*!*********************************************************************
FUNCTION numahora
PARAMETER tme
A=INT(tme)
B=tme-A
C=ROUND(B*60,2)
A=RIGHT("00"+ALLTRIM(STR(A)),2)
C=RIGHT("00"+ALLTRIM(STR(C)),2)
C=A+":"+C
RETURN(C)


*: EOF: NUMAHORA.PRG

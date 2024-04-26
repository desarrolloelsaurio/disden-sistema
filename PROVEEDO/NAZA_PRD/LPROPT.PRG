*:*********************************************************************
*:
*:        Program: LPROPT.PRG
*:
*:         System: 
*:         Author: 
*:      Copyright (c) 1991, 
*:  Last modified: 07/18/91     12:37
*:
*:      Called by: LPROP.PRG                     
*:
*:          Calls: MPRO.PRG
*:
*:      Documented 07/18/91 at 12:50               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LPROPt.PRG
*-- Fecha   : 06/10/91 01:17pm
*-- Version : E. BANALOTTI
*-- Notas   : LISTADO DE PROVEEDORES POR PANTALLA
********************************************************************************
SELE pro
DEFINE WINDOW win FROM mpror,mproc TO mpror+mprola,mproc+mproan TITL " Muestra Proveedores " SHAD COLOR SCHE 8
@ 24,0 SAY PADC("[ESC] Para Fin",80) COLO SCHE 19
ACTI WIND win
STORE 20 TO COL
SCAN
   SCAT MEMVAR
   DO mpro
   A=INKEY(0)
   IF A=27
      EXIT
   ENDIF
ENDSCAN
RELE WIND win
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LPROPT.PRG

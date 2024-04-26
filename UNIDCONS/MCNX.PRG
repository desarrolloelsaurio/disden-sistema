********************************************************************************
*-- Programa: MCNX.PRG
*-- Fecha   : 01-18-92 09:28am
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA DATOS UNIDADES
********************************************************************************
FUNCTION MCNX
PARA CONVARIA
ACTI WIND WIN1
@ 1,2 SAY "CONSORCIO"    COLO SCHE 3
@ 2,2 SAY "UNIDAD"       COLO SCHE 3
@ 3,2 SAY "TIPO"         COLO SCHE 3
@ 4,2 SAY "PISO"         COLO SCHE 3
@ 5,2 SAY "DEPTO"        COLO SCHE 3
@ 6,2 SAY "CONSORCISTA"  COLO SCHE 3
@ 7,2 SAY "PORCIENTO"    COLO SCHE 3
IF CONVARIA
   NADA = CNS.CONSORCIO
   @ 1,COL GET M.NADA
   @ 2,COL GET M.DENOM PICT "@!"
   CLEAR GETS
   M.NADA=SAYMIX(M.TIPO,"TIPCOD")
   @ 3,COL GET M.NADA
   @ 4,COL GET M.PISO  PICT "@!"
   @ 5,COL GET M.DTO   PICT "@!"
   CLEAR GETS
   M.NADA=SAYPER(M.CODCLI,"CSSCOD")
   @ 6,COL GET NADA
   @ 7,COL GET M.PORCENTAJE PICT "999.9999 %"
   CLEAR GETS
ENDIF
RETURN

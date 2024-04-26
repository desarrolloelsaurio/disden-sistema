*******************************************************************************
*-- Programa: ERROR.PRG
*-- Fecha   : 12/13/90 08:09pm
*-- Version : G. REINER
*-- Notas   : PROGRAMA DE ERROR
********************************************************************************
UNLO ALL
ON ERROR DO ERROR
@ nul,RH SAY TIME() COLO I
@ nul,RP SAY PADC(PROGRAM(),10) COLO I
CLEA
SET COLO TO W+
@ NUL,0,24,79 BOX REPL("°",9)
SET COLO TO
SET SHAD ON
=EFECT5(10,10,'No se verific¢ la Existencia','del disco Flexible en la Diskettera A','Por favor Col¢quelo','y Reintente')
=CABPAN1()
RETURN TO ventas

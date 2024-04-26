*:*********************************************************************
*:
*:        Program: PGH1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LEMPJI1.PRG    (procedure in PROCESOS.PRG)
*:               : LEMPJI2.PRG    (procedure in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: PGH1.PRG
*-- Fecha   :
*-- Version :
*-- Notas   :
********************************************************************************
? MLINE(texto,prx)
prx=prx+66
? REPL("-",76)
?? '////'
EJECT PAGE
? 'FECHA    :'
?? DATE()
?? SPACE(13)
?? 'HORA     :'
?? TIME()
?? SPACE(13)
?? 'P g N§   :'
?? STR(_PAGENO,5)
?
? emp->apynom
?? ' - Continuaci¢n'
? REPL("-",80)
RETURN

*: EOF: PGH1.PRG

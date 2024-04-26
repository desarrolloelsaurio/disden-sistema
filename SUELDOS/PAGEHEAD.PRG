*:*********************************************************************
*:
*:        Program: PAGEHEAD.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LLIQI.PRG      (procedure in PROCESOS.PRG)
*:               : LADEI1.PRG     (procedure in PROCESOS.PRG)
*:               : LLIQI1.PRG     (procedure in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:03               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: PAGEHEAD.PRG
*-- Fecha   : 12/13/90 08:06pm
*-- Version : G. REINER
*-- Notas   : IMPRIME CABECERAS (NOMBRE Y DOMICILIO DE LAS EMPRESAS)
********************************************************************************
_WRAP=.F.
?
??? CHR(14)
?? jan->empresa
? jan->domicilio
IF .NOT. EMPTY(jan->plusuno)
   ?? '   '
   ??? CHR(15)
   ?? ALLTRIM(jan->plusuno)
   ??? CHR(18)
ENDIF
? jan->localidad
IF .NOT. EMPTY(jan->plusdos)
   ?? '   '
   ??? CHR(15)
   ?? ALLTRIM(jan->plusdos)
   ??? CHR(18)
ENDIF
IF .NOT. EMPTY(jan->plustres)
   ? SPACE(40)
   ?? '   '
   ??? CHR(15)
   ?? ALLTRIM(jan->plustres)
   ??? CHR(18)
ENDIF
RETURN
*: EOF: PAGEHEAD.PRG

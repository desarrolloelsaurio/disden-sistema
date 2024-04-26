*:*********************************************************************
*:
*:        Program: MEMPF.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LEMPFP.PRG     (procedure in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: MEMPF.PRG
*-- Fecha   : 11/06/90 06:32pm
*-- Version : G. REINER
*-- Notas   : MUESTRA FAMILIARES DEL EMPLEADO
********************************************************************************
ulpr=PROGRAM()
ACTI SCREEN
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
@ 1,1 SAY "Apellido" COLOR SCHE 3
@ 2,1 SAY "Nombre" COLOR SCHE 3
@ 3,1 SAY "Relaci¢n" COLOR SCHE 3
@ 4,1 SAY "Tipo de Documento" COLOR SCHE 3
@ 5,1 SAY "N§ de Documento" COLOR SCHE 3
@ 6,1 SAY "Fecha de Nacimiento" COLOR SCHE 3
@ 7,1 SAY "Tipo de Estudios" COLOR SCHE 3
@ 8,1 SAY "Comprobante de Esc." COLOR SCHE 3
@ 9,1 SAY "Trabaja en la Empresa" COLOR SCHE 3
GOTO m->parentesco IN par
@ 1,23 GET m->apynom;
   PICTURE "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
@ 2,23 GET m->apy;
   PICTURE "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
@ 3,23 GET par->parentesco
prntsc=par->parentesco
@ 4,23 GET tdoc[m->tipodoc]
tdc=tdoc[tipodoc]
@ 5,23 GET m->nrodoc;
   PICTURE '99.999.999'
@ 6,23 GET m->fechanac
@ 7,23 GET tesc[m->tipoest]
tsc=tesc[m->tipoest]
@ 8,23 GET m->comprob
nada=IIF(m->empresa,'SI','NO')
@ 9,23 GET nada
CLEAR GETS
RETURN
*: EOF: MEMPF.PRG

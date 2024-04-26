*:*********************************************************************
*:
*:        Program: MTHOR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LTHORP.PRG     (procedure in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:04               FoxDoc  version 2.01
*:*********************************************************************
*******************************************************************************
*-- Programa: MTHOR.PRG
*-- Fecha   : 10/9/90
*-- Version : G. REINER
*-- Notas   : MUESTRA FICHA TIPO DE HORA
********************************************************************************
PARAMETER cosa
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLO I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFI WIND win FROM 1,1 TO 22,78 TITL ' '+cosa+' Tipo de Hora Trabajada ' DOUBLE SHAD COLO SCHE 8
ACTI WIND win
me1=' '+cosa+' Tipo de Hora - '
respu=""
SCATTER MEMVAR
@ 1,1 SAY "Denominaci¢n Interna              " COLO SCHE 3
@ 2,1 SAY 'Denominaci¢n para Recibo          ' COLO SCHE 3
@ 3,1 SAY 'Forma de Pago                     ' COLO SCHE 3
IF hortipo='P'
   @ 4,1 SAY "Porcentaje        " COLOR SCHE 3
ELSE
   @ 4,1 SAY "Monto Fijo        " COLOR SCHE 3
ENDIF
@ 5,1 SAY 'F¢rmula para Quincenales' COLO SCHE 3
@ 6,1 SAY 'F¢rmula para Mensuales' COLO SCHE 3
@ 7,1 SAY "Tiene retenciones ?               " COLO SCHE 3
@ 8,1 SAY "Tiene aportes ?                   " COLO SCHE 3
@ 9,1 SAY "Es bonificable ?                  " COLO SCHE 3
@ 10,1 SAY "Informa a legajo ?                " COLO SCHE 3
@ 11,1 SAY "Se Borra cada per¡odo ?           " COLO SCHE 3
@ 12,1 SAY "Es hora Productiva ?              " COLO SCHE 3
@ 13,1 SAY "Es hora c/premio Asistencia       " COLO SCHE 3
@ 14,1 SAY "Es hora c/premio Presentismo ?    " COLO SCHE 3
@ 15,1 SAY "Variable p/acumular total horas   " COLO SCHE 3
@ 16,1 SAY "Variable p/acumular total monto   " COLO SCHE 3
@ 17,1 SAY "Empresa                           " COLO SCHE 3
@ 1,33 GET m->hortipohor
@ 2,33 GET m->hortexto
xortipo=IIF(hortipo='M',"Monto Fijo","Porcentaje")
@ 3,33 GET xortipo
@ 4,33 GET m->hormonto
formqui=ALLTRIM(horformqui)
formmes=ALLTRIM(horformmes)
@ 5,33 GET m->formqui
@ 6,33 GET m->formmes
@ 7,33 GET m->horret
@ 8,33 GET m->horapo
@ 9,33 GET m->horbon
@ 10,33 GET m->horinfo
@ 11,33 GET m->horreset
@ 12,33 GET m->horproduc
@ 13,33 GET m->horpremio
@ 14,33 GET m->horpresen
@ 15,33 GET m->horvarhs
@ 16,33 GET m->horvarmon
IF m->horfiltro=0
   mpr='Todas las Empresas'
ELSE
   GOTO m->horfiltro IN jan
   mpr=jan->empresa
ENDIF
@ 17,33 GET mpr
CLEAR GETS
RETURN
*: EOF: MTHOR.PRG

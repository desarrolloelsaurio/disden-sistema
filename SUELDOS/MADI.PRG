*:*********************************************************************
*:
*:        Program: MADI.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LADIP.PRG      (procedure in PROCESOS.PRG)
*:               : LLADI.PRG      (procedure in PROCESOS.PRG)
*:
*:          Calls: RPER()         (function  in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: MADI.PRG
*-- Fecha   : 17/9/90
*-- Version : G. REINER
*-- Notas   : MUESTRA ADICIONALES
********************************************************************************
PARAMETER cosa
IF ulpr<>'LA' .AND. ulpr<>"MA"
   es=2
ELSE
   es=0
ENDIF
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFI WIND win FROM 2-es,0 TO 22,79 TITL " "+cosa+" Adicionales " SHAD COLO SCHE 8
ACTI WIND win
STORE ' '+cosa+' Adicionales - ' TO me1
SCATTER MEMVAR
@ 1,1 SAY "Denominaci¢n Adicional" COLOR SCHE 3
@ 2,1 SAY "Texto para Liquidaci¢n" COLOR SCHE 3
@ 3,1 SAY "Forma de Pago" COLOR SCHE 3
@ 4,1 SAY "Monto" COLOR SCHE 3
@ 5,1 SAY "F¢rmula para Quincenales" COLOR SCHE 3
@ 6,1 SAY "F¢rmula para Mensuales" COLOR SCHE 3
@ 7,1 SAY "Per¡odo del Pago" COLOR SCHE 3
@ 8,1 SAY "Tiene retenciones ?" COLOR SCHE 3
@ 9,1 SAY "Tiene aportes ?" COLOR SCHE 3
@ 10,1 SAY "Conforma el B sico ?" COLOR SCHE 3
@ 11,1 SAY "Mes retroactividad" COLOR SCHE 3
@ 12,1 SAY "Quincena retroactividad" COLOR SCHE 3
@ 13,1 SAY "Cantidad de veces por a¤o ?" COLOR SCHE 3
@ 14,1 SAY "Contador de veces" COLOR SCHE 3
@ 15,1 SAY "Vencimiento del Adicional" COLOR SCHE 3
@ 16,1 SAY "Reset" COLOR SCHE 3
@ 17,1 SAY "Empresa" COLOR SCHE 3
IF m->adiempresa<>0
   GOTO m->adiempresa IN jan
   es=jan->empresa
ELSE
   es='Todas las Empresas'
ENDIF
@ 1,30 GET m->adicional PICTURE "XXXXXXXXXXXXXXXXXXXX"
@ 2,30 GET m->aditexto PICTURE "XXXXXXXXXXXXXXXXXXXX"
m->aditipo=IIF(m->aditipo='P',"Porcentual","Fijo      ")
@ 3,30 GET m->aditipo
@ 4,30 GET m->adimonto PICTURE "99999999999.99"
A=ALLTRIM(adiformqui)
@ 5,30 GET A
B=ALLTRIM(adiformmes)
@ 6,30 GET B
m->adiper=rper(m->adiper)
@ 7,30 GET m->adiper
@ 8,30 GET m->adiret
@ 9,30 GET m->adiapo
@ 10,30 GET m->adiconf
@ 11,30 GET m->adimes
@ 12,30 GET m->adiqui
@ 13,30 GET m->adivez
@ 14,30 GET m->adicont
@ 15,30 GET m->adivenc
@ 16,30 GET m->adireset
@ 17,30 GET es
CLEAR GETS
RETURN
*: EOF: MADI.PRG

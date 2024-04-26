*:*********************************************************************
*:
*:        Program: KK2.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LHORI5.PRG     (procedure in PROCESOS.PRG)
*:               : LHORI6.PRG     (procedure in PROCESOS.PRG)
*:               : LHORI.PRG      (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:58               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: KK2.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : GENERA EL POPUP DE RECONSTRUCCION DE LOS ARCHIVOS
********************************************************************************
PARAMETER R,C,t
DEFI POPU caca1 FROM R,C MESSAGE t SHADOW COLOR SCHE 3
DEFI BAR 1 OF caca1 PROM ' \<Todos los Empleados'
DEFI BAR 2 OF caca1 PROM ' Por \<Categor¡a'
DEFI BAR 3 OF caca1 PROM ' Por Con\<venio'
DEFI BAR 4 OF caca1 PROM ' Por C\<entro de Costos '
DEFI BAR 5 OF caca1 PROM ' Por E\<specialidad'
RETURN

*: EOF: KK2.PRG

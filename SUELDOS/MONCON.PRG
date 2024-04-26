*:*********************************************************************
*:
*:        Program: MONCON.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: VARI.PRG                      
*:
*:      Documented 04/23/91 at 19:54               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: MONCON.PRG
*-- Fecha   : 02/02/91 00:38am
*-- Version : G. REINER
*-- Notas   : INGRESA LOS VALORES MENSUALES DE LA MONEDA CONSTANTE
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC(" Ingrese Cotizaciขn Correspondiente ",80,'*') COLO SCHE 19
DEFINE WIND win FROM 4,7 TO 23,76 TITL " Denominaciขn y Cotizaciขn Moneda Constante " SHAD COLO SCHE 8
ACTI WIND win
@ 0,0 SAY  ' ษอออออออออออออออออหออออออออออออออออออออออหออออออออออออออออออออออป'
? ' บ                 บ   Moneda Const. 1    บ    Moneda Const. 2   บ'
? ' ฬอออออออออออออออออฮออออออออออออออออออออออฮออออออออออออออออออออออน'
? ' บMes\ Cotizaciขn  บ                      บ                      บ'
? ' ฬอออออออออออออออออฮออออออออออออออออออออออฮออออออออออออออออออออออน'
@ 3,21 GET monk1
@ 3,44 GET monk2
FOR A=1 TO 12
   @ 4+A,0 SAY ' บ                 บ                      บ                      บ'
   @ 4+A,3 SAY meses[A]
   @ 4+A,23 GET monk[a,1] PICTURE '99999999999.9999'
   @ 4+A,47 GET monk[a,2] PICTURE '99999999999.9999'
NEXT a
? ' ศอออออออออออออออออสออออออออออออออออออออออสออออออออออออออออออออออผ'
READ
RELE WIND win
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: MONCON.PRG

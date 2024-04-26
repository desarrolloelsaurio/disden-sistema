*:*********************************************************************
*:
*:        Program: INICIO.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, FRIGORIFICO LA TROPA
*:  Last modified: 04/19/91     10:12
*:
*:          Calls: INICIO2.PRG
*:               : INICIO1.PRG
*:               : SUELDOS.PRG
*:
*:      Documented 04/19/91 at 10:13               FoxDoc  version 2.01
*:*********************************************************************
SET TALK OFF
SET ESCA OFF
CLEA
DIME letra[26,5]
letra[ 1, 1]=" ллл "
letra[ 1, 2]="л   л"
letra[ 1, 3]="ллллл"
letra[ 1, 4]="л   л"
letra[ 1, 5]="л   л"
letra[ 2, 1]="лллл "
letra[ 2, 2]="л   л"
letra[ 2, 3]="лллл "
letra[ 2, 4]="л   л"
letra[ 2, 5]="лллл "
letra[ 3, 1]=" ллл "
letra[ 3, 2]="л   л"
letra[ 3, 3]="л    "
letra[ 3, 4]="л   л"
letra[ 3, 5]=" ллл "
letra[ 4, 1]="лллл "
letra[ 4, 2]="л   л"
letra[ 4, 3]="л   л"
letra[ 4, 4]="л   л"
letra[ 4, 5]="лллл "
letra[ 5, 1]="ллллл"
letra[ 5, 2]="л    "
letra[ 5, 3]="ллллл"
letra[ 5, 4]="л    "
letra[ 5, 5]="ллллл"
letra[ 6, 1]="ллллл"
letra[ 6, 2]="л    "
letra[ 6, 3]="ллллл"
letra[ 6, 4]="л    "
letra[ 6, 5]="л    "
letra[ 7, 1]=" лллл"
letra[ 7, 2]="л    "
letra[ 7, 3]="л  лл"
letra[ 7, 4]="л   л"
letra[ 7, 5]=" ллл "
letra[ 8, 1]="л   л"
letra[ 8, 2]="л   л"
letra[ 8, 3]="ллллл"
letra[ 8, 4]="л   л"
letra[ 8, 5]="л   л"
letra[ 9, 1]="ллллл"
letra[ 9, 2]="  л  "
letra[ 9, 3]="  л  "
letra[ 9, 4]="  л  "
letra[ 9, 5]="ллллл"
letra[10, 1]="   лл"
letra[10, 2]="    л"
letra[10, 3]="    л"
letra[10, 4]="л   л"
letra[10, 5]=" ллл "
letra[11, 1]="л   л"
letra[11, 2]="л   л"
letra[11, 3]="лллл "
letra[11, 4]="л   л"
letra[11, 5]="л   л"
letra[12, 1]="л    "
letra[12, 2]="л    "
letra[12, 3]="л    "
letra[12, 4]="л    "
letra[12, 5]="ллллл"
letra[13, 1]="л   л"
letra[13, 2]="лл лл"
letra[13, 3]="л л л"
letra[13, 4]="л   л"
letra[13, 5]="л   л"
letra[14, 1]="л   л"
letra[14, 2]="лл  л"
letra[14, 3]="л л л"
letra[14, 4]="л  лл"
letra[14, 5]="л   л"
letra[15, 1]=" ллл "
letra[15, 2]="л   л"
letra[15, 3]="л   л"
letra[15, 4]="л   л"
letra[15, 5]=" ллл "
letra[16, 1]="лллл "
letra[16, 2]="л   л"
letra[16, 3]="лллл "
letra[16, 4]="л    "
letra[16, 5]="л    "
letra[17, 1]=" ллл "
letra[17, 2]="л   л"
letra[17, 3]="л   л"
letra[17, 4]="л л л"
letra[17, 5]=" лллл"
letra[18, 1]="лллл "
letra[18, 2]="л   л"
letra[18, 3]="лллл "
letra[18, 4]="л   л"
letra[18, 5]="л   л"
letra[19, 1]=" лллл"
letra[19, 2]="л    "
letra[19, 3]=" ллл "
letra[19, 4]="    л"
letra[19, 5]="лллл "
letra[20, 1]="ллллл"
letra[20, 2]="  л  "
letra[20, 3]="  л  "
letra[20, 4]="  л  "
letra[20, 5]="  л  "
letra[21, 1]="л   л"
letra[21, 2]="л   л"
letra[21, 3]="л   л"
letra[21, 4]="л   л"
letra[21, 5]=" ллл "
letra[22, 1]="л   л"
letra[22, 2]="л   л"
letra[22, 3]="л   л"
letra[22, 4]=" л л "
letra[22, 5]="  л  "
letra[23, 1]="л   л"
letra[23, 2]="л   л"
letra[23, 3]="л л л"
letra[23, 4]="лл лл"
letra[23, 5]="л   л"
letra[24, 1]="л   л"
letra[24, 2]=" л л "
letra[24, 3]="  л  "
letra[24, 4]=" л л "
letra[24, 5]="л   л"
letra[25, 1]="л   л"
letra[25, 2]=" л л "
letra[25, 3]="  л  "
letra[25, 4]="  л  "
letra[25, 5]="  л  "
letra[26, 1]="ллллл"
letra[26, 2]="    л"
letra[26, 3]=" ллл "
letra[26, 4]="л    "
letra[26, 5]="ллллл"
CLEA
@ 1,1 TO 16,79 177
@ 3,3 TO 14,76
DO d:\sueldos\inicio2 WITH 3,15,'SUELDOS  Y'
DO d:\sueldos\inicio2 WITH 10,20,'JORNALES'
@ 20,0 SAY PADC(" AID S.A. ",80) COLO I
@ 21,0 SAY PADC("Goyo REINER",80) COLO I
@ 24,0 SAY PADC("TECLA PARA CONTINUAR",80) COLO I
DO WHILE INKEY()=0
ENDDO
FOR A=1 TO 16
   scroll 2,2,15,78,1
   FOR B=1 TO 200
   NEXT
NEXT
FOR A=0 TO 25
   scroll 0,0,24,79,1
   FOR B=1 TO 100
   NEXT
NEXT
@ 1,1 TO 16,79 177
@ 3,3 TO 14,76
DO d:\sueldos\inicio1 WITH 3,15,'SUELDOS  Y'
DO d:\sueldos\inicio1 WITH 10,20,'JORNALES'
store .t. to control
DO d:\sueldos\sueldos
DO WHILE .T.
   ACTI MENU main
ENDDO
RETURN

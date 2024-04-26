*:*********************************************************************
*:
*:        Program: ICDG2.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: SUELDOS.PRG                   
*:
*:      Documented 04/23/91 at 20:44               FoxDoc  version 2.01
*:*********************************************************************
SET ESCA OFF
FOR A=0 TO 24
   FOR B=0 TO A
      IF MOD(A+B,4)=0
         @ A,B SAY '' COLOR SCHE 15
         @ 24-A,79-B SAY '' COLOR SCHE 14
         @ A,79-B SAY '' COLOR SCHE 17
         @ 24-A,B SAY '' COLOR SCHE 16
      ELSE
         IF MOD(A+B,3)=0
            @ A,B SAY '' COLOR SCHE 14
            @ 24-A,79-B SAY '' COLOR SCHE 17
            @ A,79-B SAY '' COLOR SCHE 16
            @ 24-A,B SAY '' COLOR SCHE 15
         ELSE
            @ A,B SAY '' COLOR SCHE 17
            @ 24-A,79-B SAY '' COLOR SCHE 16
            @ A,79-B SAY '' COLOR SCHE 15
            @ 24-A,B SAY '' COLOR SCHE 14
         ENDIF
      ENDIF
   NEXT B
   IF MOD(A,5)=0
      CLEA
   ENDIF
NEXT A
@ 13,30 SAY cdg
DO WHILE INKEY()=0
ENDDO
CLEA
RETURN

*: EOF: ICDG2.PRG

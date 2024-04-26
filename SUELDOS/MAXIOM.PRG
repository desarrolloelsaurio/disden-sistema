*:*********************************************************************
*:
*: Procedure file: MAXIOM.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 02/27/91     12:07
*:
*:  Procs & Fncts: MAXIOM()
*:
*:      Documented 03/06/91 at 00:28               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: maxiom.prg
*-- Fecha   : 02/27/91 11:58am
*-- Version : G. REINER
*-- Notas   : devuelve la cantidad m xima de d¡as del mes en curso
********************************************************************************
*!*********************************************************************
*!
*!       Function: MAXIOM()
*!
*!      Called by: CHDIA.PRG                     
*!               : IDIA1.PRG                     
*!               : IDIA1S.PRG                    
*!               : GDIA1.PRG                     
*!               : GLDIA1.PRG                    
*!               : CHDIA1.PRG                    
*!
*!*********************************************************************
FUNCTION maxiom
PARAMETER diadehoy
mesdehoy=MONTH(diadehoy)
IF mesdehoy=2
   ano=YEAR(diadehoy)
   IF ano/4=INT(ano/4)
      totdia=29
   ELSE
      totdia=28
   ENDIF
ELSE
   IF mesdehoy=4 .OR. mesdehoy=6 .OR. mesdehoy=9 .OR. mesdehoy=11
      totdia=30
   ELSE
      totdia=31
   ENDIF
ENDIF
RETURN(totdia)

*: EOF: MAXIOM.PRG

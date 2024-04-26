* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : SAYFILE.PRG                                              บ
* บ COMENTARIO    : IMPRIME EN LA SALIDA DEFAULT EL ARCHIVO C_PROG           บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 07-25-93                                                    บ
* บ HORA       : 00:06:02am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
* LOS PRIMEROS 11 BYTES 0- 10 TIENEN DATOS DE LARGO
* LARGO DE LOS REGISTROS=51
*                      11- 62 1ง REGISTRO 
*                      63-114 2ง REGISTRO
*                     115-166 3ง REGISTRO
*                     167-218 3ง REGISTRO
*** CAMPOS MEMO:
FUNCTION SAYCRD
PARAMETER C_PROG
#DEFINE NUL    0                                 && NUL
STORE NUL TO SALIDA
IF !EMPTY(M.C_PROG)
   FH_PROG=FOPEN(C_PROG,0)
   ALGO=FREAD(FH_PROG,11) 
   CLEA
   CREATE DBF AGENDA.DBF ;
   (NOMBRE C(50), INICIO N(10), DETALLE M)
   
   @ $+1,0 SAY "CANTIDAD DE REGISTROS:"
   MAXREC=ASC(SUBSTR(ALGO,4,1))+ASC(SUBSTR(ALGO,5,1))*256
   ?? MAXREC
   maxrec=D56TONUM(substr(algo,4,4))
   ? maxrec
   =inkey(0)
   STORE 1 TO CANT
   FOR XA=1 TO MAXREC
      ? STR(CANT,3)
      ?? ")"
      pp=FREAD(FH_PROG,4)
      TXTO=FGET(FH_PROG,48)
      ?? TXTO
      APPE BLAN
      REPL NOMBRE WITH TXTO
      REPL INICIO WITH D56TONUM(PP)
      ?? ":"
      ?? "pos:"
      ?? pp
      ?? '->'
      ?? D56TONUM(PP)
      
      CANT=CANT+1
   NEXT
   =INKEY(0)
   SCAN
   CLEA
   =FSEEK(FH_PROG,AGENDA.INICIO+3)
   ? AGENDA.NOMBRE
   N=D56TONUM(FREAD(FH_PROG,2))
   ? "LARGO:"
   ?? N
   IF N>0
      DDF=FREAD(FH_PROG,N)
      REPL DETALLE WITH DDF
     IF INKEY(0)=27
        EXIT
     ENDIF
  ENDIF
   ENDSCAN
   =FCLOSE(FH_PROG)
*************

************ 
ENDIF
RETURN SALIDA

FUNCTION D56TONUM
PARAMETER ELNUM
STORE 0 TO ELNUM1
LARGO=LEN(ELNUM)
FOR A=1 to largo
   CHA=SUBSTR(ELNUM,A,1)
   ELNUM1=ELNUM1+ASC(CHA)*(255**(A-1))     
NEXT
RETURN ELNUM1

* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : SAYFILE.PRG                                              �
* � COMENTARIO    : IMPRIME EN LA SALIDA DEFAULT EL ARCHIVO C_PROG           �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 07-25-93                                                    �
* � HORA       : 00:06:02am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION SAYFILE
PARAMETER C_PROG
IF !EMPTY(M.C_PROG)
   FH_PROG=FOPEN(C_PROG,0)
   DO WHILE !FEOF(FH_PROG)
      ? FGETS(FH_PROG)
   ENDDO
   =FCLOSE(FH_PROG)
ENDIF
RETURN

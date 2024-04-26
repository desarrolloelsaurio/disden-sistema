* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : SAYFILE.PRG                                              บ
* บ COMENTARIO    : IMPRIME EN LA SALIDA DEFAULT EL ARCHIVO C_PROG           บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 07-25-93                                                    บ
* บ HORA       : 00:06:02am                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
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

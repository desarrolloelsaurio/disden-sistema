* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LXXXI.PRG                                                �
* � COMENTARIO    :                                                          �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 11-01-93                                                    �
* � HORA       : 01:50:15pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
   **********************************
   *  TRABAJO PREVIO ORDENAMIENTO  **
   **********************************
   STOR NUL TO CASOS
   LINEA=REPL("=",LEN(ACLA))
   **************************
   * LINEAS, ACLA Y TITULOS *
   **************************
   =CABPRI()
   _PCOPIES=1
   PRINTJOB
      =CABPRI1()
      =TIT_LIN(3)
      SELE ***
      SCAN
         IF _PLINENO>63
            =FIN_LIN(3,NUL)
            =cabpri1()
            =TIT_LIN(FOUR)
         ENDI
         **********************
         *  MAIN IMPRESIONES **
         **********************
      ENDSCAN
      =FIN_LIN(FOUR,CASOS)
   ENDP
   =FINIMP()
   =IAUD("")
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

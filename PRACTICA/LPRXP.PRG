* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LXPRAP.PRG                                               �
* � COMENTARIO    : LISTA COMPONENTES DE UNA PRACTICA                        �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 08-20-93                                                    �
* � HORA       : 00:45:57am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE ONE    1                                 && ONE
#DEFINE TWO    2                                 && TWO
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
 
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   STOR NUL TO CASOS
   =WIN0()
   PAG=ONE
   =CABPAN()
   TT=TT1+CRLF+"SUBCODIGO:"+ELCOD   
   =TIT_LIN(ONE)
   SELE PRX
   SCAN 
      IF ELCOD#PRX.CODPRX
         IF !FIN_LIN(ONE,NUL)
            EXIT
         ENDIF
         CLEA
         STOR PAG+ONE TO PAG
         ELCOD=PRX.CODPRX
         TT=TT1+CRLF+"SUBCODIGO:"+ELCOD
         =CABPAN()
         =TIT_LIN(ONE)         
      ENDIF
      =LPRX0()
   ENDSCAN
   =FIN_LIN(TWO,CASOS)
   =RELEWIN("WIN")
   =IAUD("")
ELSE
   =IAUDI()
ENDIF
RETURN 

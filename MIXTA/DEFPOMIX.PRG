* 旼 FUNCTION 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �  Description: DEFINE POPUP MIXTA           �
* �       AUTOR : G. REINER                    �
* � Date created: 03-17-93                     �
* � Time created: 11:59:01am                   �
* �    Copyright: SISTEMAS INFORMATICOS S.R.L. �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION DEFPOMIX
PARAMETERS REX,COX
M.REX=XXTONUM(M.REX)
M.COX=XXTONUM(M.COX)
#IF 'WIND' $ UPPER(VERSION())
   DEFI POPU MIXPOP ;
     FROM max(2,REX),COX ;
     PROMPT FIELD MIX.TEXTO1 ;
     SHAD ;
     COLOR SCHE 6 ;
     IN SCREEN
#ELSE
   IF USED("PRV")
      DEFI POPU PRVPOP ;
        FROM max(2,REX),COX ;
        TO 22,MIN(79,COX+22) ;
        PROMPT FIELD PRV.TEXTO1 ;
        SHAD ;
        COLOR SCHE 6 ;
        IN SCREEN
   ELSE
      DEFI POPU MIXPOP ;
        FROM max(2,REX),COX ;
        TO 22,MIN(79,COX+22) ;
        PROMPT FIELD MIX.TEXTO1 ;
        SHAD ;
        COLOR SCHE 6 ;
        IN SCREEN
   ENDIF
#ENDIF
ON SELE POPU MIXPOP DO RESP1
RETURN .T.

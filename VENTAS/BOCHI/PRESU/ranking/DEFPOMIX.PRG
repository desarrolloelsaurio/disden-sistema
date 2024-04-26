* ÚÄ FUNCTION ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Description: DEFINE POPUP MIXTA           ³
* ³       AUTOR : G. REINER                    ³
* ³ Date created: 03-17-93                     ³
* ³ Time created: 11:59:01am                   ³
* ³    Copyright: SISTEMAS INFORMATICOS S.R.L. ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
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

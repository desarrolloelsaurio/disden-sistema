*******************************************************************************
*-- Programa: ELIPLAN
*-- Fecha   : 10-10-92 11:53am
*-- Version : G. REINER
*-- Notas   : ELIGE PLAN DE LA MUTUAL
********************************************************************************
FUNCTION ELIPLAN
PARA msg,r1,c1,MTL
SELE MUT
store NUL to respuesta
IF MUTPOP
   IF !EMPTY(MTL)
      =WORKING()
      TMP=GENTMP()
      SET ORDER TO
      SORT ON PLAN TO (TMP) ;
        FIELDS CODPLAN,PLAN,CODMUT ;
        FOR CODMUT=MTL .AND. ;
        !EMPTY(PLAN)
        =PRXAREA(.T.)
      USE (TMP) ALIAS MUL
      IF !EMPTY(RECC())
         DEFI POPU MU1POP FROM MUTpopr,MUTpopc PROMPT FIELD PLAN SHAD COLOR SCHE 3 IN SCREEN
         ON SELE POPU MU1POP DO resp1
         =UNWORK()
         ACTI POPU MU1POP
         LARESP=MTL+MUL.CODPLAN
         RESPUESTA=!EMPTY(RESPUESTA)
         =OFF_TMP()
         SELE MUT
         IF RESPUESTA
            SELE MUT
            SET ORDER TO TAG CODPLAN
            RESPUESTA=SEEK(LARESP)
         ENDIF
      ELSE
         =UNWORK()
         =REOPMUT()
         =CARTEL("NO HAY DEFINIDOS PLANES PARA LA MUTUAL",;
           ALLTRIM(SAYGRL(MTL,"MUT","CODMUT","MUT.MUTUALABR")),;
           "ES IMPOSIBLE VER LA LISTA",;
           "PULSE [ENTER] PARA CONTINUAR")
         RESPUESTA=.F.
      ENDIF
   ELSE
      SET ORDER TO taG PALPOPUP
      ACTI POPUP MUXPOP
      STOR !empty(respuesta) TO respuesta
   ENDIF
ELSE
   ON KEY LABEL F2 RETURN SEEKTECX(20,'MUT','MUTUAL','PALPOPUP','MUTUAL',R1,C1)
   respuesta=ELIMIX1('Plan '+msg,'MUT','CODPLAN',10)
   RESPUESTA=IIF(EMPTY(MTL),RESPUESTA,MUT.CODMUT=MTL)
   ON KEY LABEL F2
ENDIF
RETURN respuesta

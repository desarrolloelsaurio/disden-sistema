FUNCTION IMP_PRO
************************************************************
IF !EMPTY(MER.PROPAG)
   prpg=MER.PROPAG
   prpg=ALLT(PRPG)
   PRPG=IIF(!EMPTY(PRPG),ALLT(prpg),PRPG)
   ??? CHR(15)
   DO WHIL .T.
      IF LEN(PRPG)<71
         IF PRPG#SPACE(71)
            ? '   '
            ?? PRPG
         ENDI
         EXIT
      ELSE
         C_PRPG=70
         DO WHIL C_PRPG>1
            IF SUBSTR(PRPG,C_PRPG,1)=' '
               IF LEFT(PRPG,C_PRPG)#SPACE(C_PRPG)
                  ? '   '
                  ?? LEFT(PRPG,C_PRPG)
                  PRPG=SUBSTR(PRPG,C_PRPG+1)
               ENDI
               EXIT
            ELSE
               C_PRPG=C_PRPG-1
            ENDI
         ENDD
      ENDI
   ENDD
   ??? CHR(18)
ENDI
RETURN .T.

* ษอออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCCIPZ.PRG              บ
* บ COMENTARIO    :                         บ
* ฬอออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                บ
* บ FECHA      : 12-31-93                   บ
* บ HORA       : 04:09:03pm                 บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER    บ
* ศอออออออออออออออออออออออออออออออออออออออออผ
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP
STOR HORA_ULP(PROGRAM()) TO ULPR

IF CHEQSEG()
   DIME TTL[CANT_MAX],CTRL[CANT_MAX]
   STORE .F. TO HAY,ACLA,LINEA,TT
   =LCCIPZ0()
   =WIN0()
   PAG=1
   =CABPAN()
   STORE NUL TO CASOS
   =TIT_LIN(1)
   SCAN FOR &FISC
      IF ROW()>21
         IF !TLCCIPZ(1,NUL,'SUBTOTAL')
            EXIT
         ENDIF
         CLEA
         STOR PAG+1 TO PAG
         =CABPAN()
         =TIT_LIN(2)
      ENDIF
      =LCCIPZ1()
   ENDSCAN
   =IIF(LAST()=27,.T.,TLCCIPZ(2,CASOS,'TOTAL'))
   =RELEWIN('WIN')
   =REOPCCI()
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION TLCCIPZ
PARAMETER COSA,COSA1,COSA2
PRIVATE COSA,COSA1,COSA2
IF !HAY
   RETURN FIN_LIN(COSA,COSA1)
ELSE
   VEZ=1
   ? LINEA
   ? PAIP
   FOR A=1 TO CANT_MAX
      IF VARIABLE[A]
         IF VEZ=1
            VEZ=2
            ?? PADR(COSA2,TEXTO[A,2])
            ?? PAIP
         ELSE
            IF CTRL[A]
               IF A=9
                  ?? STR(TTL[7],XACDIGI,2)
                  ?? PAIP
                  ?? STR(TTL[8],XACDIGI,2)
                  ?? PAIP
                  ?? STR(TTL[9],XACDIGI,2)
                  ?? PAIP
               ELSE
                  ?? STR(TTL[A],XACDIGI,2)
                  ?? PAIP
               ENDIF
            ELSE
               ?? SPACE(TEXTO[A,2])
               ?? PAIP
            ENDIF
         ENDIF
      ENDIF
   ENDF
   =INKEY(NUL,'HM')
ENDIF
RETURN LAST()#27

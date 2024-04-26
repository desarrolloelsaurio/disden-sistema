FUNCTION LKAR1OC0
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
? kars.fechaop
?? paip
IF EMPTY(KARS.TELCODPRO)  && SON AVIOS
   ?? KARS.AVICODPRO
   ?? PAIP
   ?? LEFT(SAYGRL(KARS.AVICODPRO,"AVIS","AVICODPRO","AVIS.AVIO"),30)
   TXT=SAYMIX(AVIS.UNIDAD,"MDDCOD")
ELSE
   ?? KARS.TELCODPRO
   ?? PAIP
   ?? LEFT(SAYGRL(KARS.TELCODPRO,"TELS","TELCODPRO","TELS.TELA"),30)
   TXT=SAYMIX(TELS.UNIDAD,"MDDCOD")
ENDIF
?? PAIP
?? str(kars.entrada,xacdigi,2)
?? paip
?? str(kars.salida,xacdigi,2)
?? paip
?? LEFT(TXT,4)
RETURN .T.
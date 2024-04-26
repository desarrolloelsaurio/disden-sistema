close data
SELE 0
USE PROCFAB ALIAS PRC ORDER PRCCOD
SELE 0
USE MIXTA ALIAS MIX ORDER TAG ETACOD
SELE 0
USE TALLERES ALIAS TAL ORDER TAG TALCOD
SELE 0
use uno ALIAS FAX
elnum=0
scan
if numero#elnum
   IF INKEY(0)=27
      EXIT
   ENDIF
   CLEA
   elnum=numero
   ?
   ? numero
   ?? repl("-",70)   
endif   
? remito
?? "|"
?? STR(POSIC,2)
?? "|"
?? taller
?? "|"
SELE PRC
SEEK FAX.prc
?? LEFT(PRC.PROCFAB,10)
?? "|"
SELE TAL
SEEK FAX.TALLER
?? LEFT(TAL.TALLERES,10)
?? "|"
SELE MIX
SEEK TAL.ETAPA
?? LEFT(MIX.TEXTO1,10)
SELE FAX
?? "|"
?? STR(EEC,5)
?? "|"
?? STR(SSC,5)
?? "|"
endscan
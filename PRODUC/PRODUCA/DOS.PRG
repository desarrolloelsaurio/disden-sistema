close data
use uno
elnum=0
scan
if numero#elnum
   IF INKEY(0)=27
      EXIT
   ENDIF
   elnum=numero
   ?
   ? numero
   ?? repl("-",70)   
endif   
? remito
?? "|"
?? taller
?? "|"
?? prc
?? "|"
endscan
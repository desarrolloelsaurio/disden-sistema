FUNCTION IPRETL
   =movewin(7,12,14,64,'win',' T¡tulos y Pie de P gina ')
   @ 1,1 SAY 'TITULO 1' colo sche 3
   @ 2,1 SAY 'TITULO 2' colo sche 3
   @ 3,1 SAY 'PIE 1' colo sche 3
   @ 4,1 SAY 'PIE 2' colo sche 3
   @ 1,18 GET tt1 PICT '@!' MESS 'Primer T¡tulo'
   @ 2,18 GET tt2 PICT '@!' MESS 'Segundo T¡tulo'
   @ 3,18 GET tt3 PICT '@!' MESS 'Primer Pie de P gina'
   @ 4,18 GET tt4 PICT '@!' MESS 'Segundo Pie de P gina'
   READ
   =relewin("WIN")
RETURN(.T.)

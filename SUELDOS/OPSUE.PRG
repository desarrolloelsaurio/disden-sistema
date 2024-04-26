**********************************
* ABRE ARCHIVO HISTORICO SUELDOS *
**********************************
@ 24,0 SAY PADC('Abriendo archivo Hist¢rico',80,' ') COLO SCHE 19
IF jannro=0
   DO elijan
ENDIF
IF jannro<>0
   SELE 17
   indice="SU"+LEFT(ptn[jannro],1)+'E'+SUBSTR(ptn[jannro],2,1)+'L'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) ALIAS sue
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

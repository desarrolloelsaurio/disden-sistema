**************************
* ABRE ARCHIVO HISTORICO *
**************************
@ 24,0 SAY PADC('Abriendo archivo Hist¢rico',80,' ') COLO SCHE 19
IF jannro=0
   DO elijan
ENDIF
IF jannro<>0
   SELE 16
   indice="HI"+LEFT(ptn[jannro],1)+'S'+SUBSTR(ptn[jannro],2,1)+'T'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
   USE (PATH+'\'+indice) ALIAS his
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

*****************************
* ABRE ARCHIVO DE aguinaldo *
*****************************
@ 24,0 SAY PADC('Abriendo archivo de Aguinaldo',80,' ') COLO SCHE 19
IF jannro=0
   DO elijan
ENDIF
SELE 18
indice="SA"+LEFT(ptn[jannro],1)+'C'+SUBSTR(ptn[jannro],2,1)+'o'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
USE (PATH+'\'+indice) ALIAS sac
@ 24,0 SAY SPACE(80)
RETURN

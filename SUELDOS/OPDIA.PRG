**********************************************
* ABRE ARCHIVO DE HORAS TRABAJADAS EN EL DIA *
**********************************************
@ 24,0 SAY PADC('Abriendo archivo de Horas Trabajadas Diarias',80,' ') COLO SCHE 19
IF jannro=0
   DO elijan
ENDIF
SELE 17
indice="DI"+LEFT(ptn[jannro],1)+'A'+SUBSTR(ptn[jannro],2,1)+'S'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
USE (PATH+'\'+indice) index (PATH+'\'+indice) ALIAS dia
@ 24,0 SAY SPACE(80)
RETURN

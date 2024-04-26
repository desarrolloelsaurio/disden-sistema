*******************************
* ABRE ARCHIVO DE LIQUIDACION *
*******************************
@ 24,0 SAY PADC('Abriendo archivo de Liquidaci¢n',80,' ') COLO SCHE 19
IF jannro=0
   DO elijan
ENDIF
SELE 15
indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
IF LEFT(RIGHT(DBF(),12),8)<>INDICE
USE (PATH+'\'+indice) INDEX (PATH+'\'+indice) ALIAS liq
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

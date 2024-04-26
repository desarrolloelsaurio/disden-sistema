*******************************************
* ABRE ARCHIVO DE TIPO DE HORAS 3 INDICES *
*******************************************
@ 24,0 SAY PADC('Abriendo archivo de Tipo de Hora',80,' ') COLO SCHE 19
SELE 9
   USE (PATH+'\TIPOHOR') INDEX (PATH+'\HORTIPOHOR'),(PATH+'\HORVARMON'),(PATH+'\HORVARHS') ALIAS thor
IF jannro=0
   SET FILTER TO
ELSE
   SET FILTER TO thor->horfiltro=jannro .OR. thor->horfiltro=0
ENDIF
IF thorpop
   DEFI POPU thorpop FROM 0,50 PROM FIELD thor->hortipohor MESS ' Elija el Tipo de Hora ' SHAD COLOR SCHE 3
   ON SELE POPU thorpop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

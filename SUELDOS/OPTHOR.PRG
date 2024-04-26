******************************************
* ABRE ARCHIVO DE TIPO DE HORAS 1 INDICE *
******************************************
@ 24,0 SAY PADC('Abriendo archivo de Tipo de Hora',80,' ') COLO SCHE 19
SELE 9
IF ALIAS()<>'THOR'
   USE (PATH+'\TIPOHOR') INDEX (PATH+'\HORTIPOHOR') ALIAS thor
ENDIF
IF jannro=0
   SET FILTER TO
ELSE
   SET FILTER TO thor.horfiltro=jannro .OR. thor.horfiltro=0
ENDIF
IF thorpop
   DEFI POPU thorpop FROM 0,50 PROM FIELD thor.hortipohor MESS ' Elija el Tipo de Hora ' SHAD COLOR SCHE 3
   ON SELE POPU thorpop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

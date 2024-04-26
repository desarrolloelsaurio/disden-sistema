******************************
* ABRE ARCHIVO TIPO DE GASTO *
******************************
@ 24,0 SAY PADC('Abriendo archivo de Adelanto',80,' ') COLO SCHE 19
SELE 7
IF ALIAS()<>'GAS'
   USE (PATH+'\GASTOS') INDEX (PATH+'\GASTO'),(PATH+'\GASEMP') ALIAS gas
ENDIF
IF jannro=0
   SET FILTER TO
ELSE
   SET FILTER TO gas->empresa=jannro
ENDIF
IF gaspop
   DEFI POPU gaspop FROM 0,55 PROM FIELD gas->gasto MESS ' Elija el Tipo de Gasto ' SHAD COLOR SCHE 3
   ON SELE POPU gaspop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

***************************
* ABRE ARCHIVO DE EMPRESA *
***************************
@ 24,0 SAY PADC('Abriendo archivo de Empresas',80,' ') COLO SCHE 19
SELE 1
IF ALIAS()<>'JAN'
   USE (PATH+'\EMPRESA') INDEX (PATH+'\EMPRESA') ALIAS jan noupdate
ENDIF
IF janpop
   DEFI POPU janpop FROM 0,50 PROM FIELD jan.empresa MESS 'Elija Empresa' SHAD COLOR SCHE 3
   ON SELE POPU janpop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

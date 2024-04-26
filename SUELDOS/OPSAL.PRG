*********************************
* ABRE ARCHIVO SALARIO FAMILIAR *
*********************************
@ 24,0 SAY PADC('Abriendo archivo de Salario Familiar',80,' ') COLO SCHE 19
SELE 12
IF ALIAS()<>'SAL'
   USE (PATH+'\SALARIO') INDEX (PATH+'\SALARIO') ALIAS sal
ENDIF
IF SALpop
   DEFI POPU salpop FROM 0,50 PROM FIELD sal->salario MESS 'Elija el Rubro de Salario Familar' SHAD COLOR SCHE 3
   ON SELE POPU salpop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

**********************************
* ABRE ARCHIVO DE ESPECIALIDADES *
**********************************
@ 24,0 SAY PADC('Abriendo archivo de Especialidades',80,' ') COLO SCHE 19
SELE 5
IF ALIAS()<>'ESP'
   USE (PATH+'\ESPEC') INDEX (PATH+'\ESPECIALI') ALIAS esp
ENDIF
IF esppop
   DEFI POPU esppop FROM 0,50 PROM FIELD esp->especiali MESS ' Elija la Especialidad ' SHAD COLOR SCHE 3
   ON SELE POPU esppop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

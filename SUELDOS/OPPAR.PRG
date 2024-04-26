*******************************
* ABRE ARCHIVO DE PARENTESCOS *
*******************************
@ 24,0 say padc('Abriendo archivo de Parentesco',80,' ') COLO SCHE 19
SELE 6
IF ALIAS()<>'PAR'
   USE (PATH+'\PARENTESCO') INDEX (PATH+'\PARENTESCO') ALIAS PAR
ENDIF
IF parpop
   DEFI POPU parpop FROM 0,50 PROM FIELD par->parentesco MESS ' Elija el Parentesco ' SHAD COLOR SCHE 3
   ON SELE POPU parpop DO resp1
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

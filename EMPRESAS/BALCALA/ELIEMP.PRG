********************************************************************************
*-- Programa: ELIEMP.PRG
*-- Fecha   : 06/12/91 03:13pm
*-- Version : g. reiner
*-- Notas   : ELIGE LA MARCA
*-- VERSION BALCALA
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
function ELIEMP
para msg,r1,c1
priv msg,r1,c1
sele MIX
IF CANT_EMPRE=1
   SET ORDER TO TAG JANTEX
   GO TOP
   JANNAME=MIX.TEXTO1
   JANNRO=MIX.nu1
   sucu='0000'
ELSE
   if janpop
      set ORDER TO TAG janTEX
      acti popup MIXpop
      stor !empty(respuesta) to respuesta
   else
      RESPUESTA=ELIMIX1('EMPRESA '+MSG,'MIX','janCOD')
   endif
   JANNAME=IIF(RESPUESTA,MIX.TEXTO1,'TODAS LAS EMPRESAS')
   JANNRO=iif(respuesta,MIX.nu1,nul)
   sucu='0000'
ENDIF
wn=wontop()
acti scre
=CABPAN1()
if !empty(wn)
   acti wind (wn)
endif
return jannro

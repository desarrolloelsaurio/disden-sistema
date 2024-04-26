********************************************************************************
*-- Programa: MMER.PRG
*-- Fecha   : 12/13/91
*-- Version : V.LEEGSTRA
*-- Notas   : MUESTRA MERCADERIA
********************************************************************************
parameter cosa
acti wind win
@ 1,1 say upper(RUvRO) colo sche 3
@ 2,1 say "VARIEDAD" colo sche 3
@ 3,1 say "CALIDAD " colo sche 3
@ 4,1 say "DESCRIPCION" colo sche 3
if cosa
   sele rub
   narubro=IIF(XSEEK(M.RUBRO,'RUB','CODRUB'),rub.rubro,space(20))
   @ 1,col get narubro
   sele mix
   naVARIE=IIF(XSEEK(m.variedad,'MIX','VARCOD'),mix.texto1,space(20))
   @ 2,col get naVARIE
   nacalid=IIF(XSEEK(m.calidad,'MIX','CALCOD'),mix.texto1,space(20))
   @ 3,col get nacalid
   sele mer
   @ 4,col get M.PALPOPUP
endif
clear gets
return
*: EOF: MMER.PRG

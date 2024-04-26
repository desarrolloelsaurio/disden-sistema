function men_lin
PARAMETER MEN_TEX
m.ventant=wontop()
acti scre
@ 24,0 say padc(m.MEN_TEX,80)
if !empty(m.ventant)
   acti wind (m.ventant)
endif   
return .T.
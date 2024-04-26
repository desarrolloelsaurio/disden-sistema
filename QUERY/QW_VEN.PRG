function qw_ven
parameter ren,col,cual
private ren,col,cual
if filven=2
   defi wind fic FROM 10,20 TO 15,55 doub TITL ' Vencim. a listar ' SHAD colo sche 8
   ACTI WINDOW fic
   m.venc1=1
   m.venc2=31
   @ 1,2 say 'D¡a de Venc. Desde: ' get m.venc1 pict "99" valid betw(m.venc1,1,31)
   @ 2,2 say 'D¡a de Venc. Hasta: ' get m.venc2 pict "99" valid betw(m.venc2,m.venc1,31)
   READ
   RELE WINDOW fic
   if LASTKEY()#27
      store 'betw('+cual+','+alltr(str(m.venc1))+','+alltr(str(m.venc2))+')' to queven
      ttven='D¡a de Venc. entre '+alltr(str(m.venc1))+' - '+alltr(str(m.venc2))
      @ ren,col say left(ttven,20)
   else
      store 1 to filven
   endif
endif
return FILven=1

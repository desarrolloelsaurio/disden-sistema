#DEFINE PAIP   "|"                            && PAIP
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX
FUNCTION LREMPEN0
EXTERNAL ARRAY TOTAL
IF !EMPTY(AVICODPRO)
   =XSEEK(AVICODPRO,"AVIS","AVICODPRO")
   M.CODIGO =AVICODPRO
   M.DESCRIP=AVIS.AVIO
   M.UNIDA  =AVIS.UNIDAD
ELSE
   =XSEEK(TELCODPRO,"TELS","TELCODPRO")
   M.CODIGO =TELCODPRO
   M.DESCRIP=TELS.TELA
   M.UNIDA  =TELS.UNIDAD
ENDIF
? PAIP
=IIF(VARIABLE[1],QOUT(STR(NUMERO)+PAIP),"")
=IIF(VARIABLE[2],QOUT(SAYPER(TALLER,"PROCOD",IIF(PORPAN,20,30))+PAIP),"")
IF VARIABLE[3]
   ?? M.CODIGO
   ?? PAIP
   ?? LEFT(M.DESCRIP,IIF(PORPAN,20,30))
   ?? PAIP
ENDIF
?? CANTIDAD PICT RIGHT(PICUMAX,XACDIGI)
?? PAIP
?? LEFT(SAYMIX(M.UNIDA,"MDDCOD"),IIF(PORPAN,10,20))
?? PAIP
CASOS=CASOS+1
RETURN .T.

FUNCTION LCIU0
#DEFINE PAIP   "|"                               && PAIP
scat memv
stor RECNO() TO nadarec
NADA=IIF(XSEEK(RIGHT(m.TEXTO2,2),'MIX','PRVCOD'),MIX.TEXTO1,SPACE(20))
GO NADAREC
IF PORPAN
   if _windows
      ? PAIP
   else
   ?? PAIP
   endif
ELSE
   ? paip
ENDIF
?? STR(M.NU1,6)
?? paip
?? m.texto1
?? paip
?? nada
?? paip
?? '  '
?? STR(m.nu2,4)
?? '  '
?? paip
?? '  '
?? LEFT(m.texto2,5)
?? '  '
?? paip
?? usuario
?? paip
stor casos+1 TO casos
return .t.

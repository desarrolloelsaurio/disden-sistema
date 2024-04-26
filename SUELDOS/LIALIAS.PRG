! CD c:\sueldos
DO OPadi.prg
DO OPcat.prg
DO OPccos.prg
DO OPcon.prg
DO OPdia.prg
DO OPemp.prg
DO OPepar.prg
DO OPesp.prg
=OPGAS().prg
DO OPhis.prg
DO OPhlp.prg
DO OPjan.prg
DO OPliq.prg
DO OPpar.prg
DO OPret.prg
DO OPsac.prg
DO OPsal.prg
DO OPsue.prg
DO OPthor.prg
DO OPthor1.prg
DO OPvar.prg

for x=1 to 25
   sele (x)
  if .not. empty(alias())
     IF ALIAS()='CON'
        B='CONV.TXT'
        ELSE
	  b=alltrim(alias())+'.txt'
	  ENDIF
	  list stru to &b
  endif
next
return


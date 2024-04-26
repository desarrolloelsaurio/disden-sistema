=working()
for a=3 to CANT_MAX
	if variable[a]
		STORE NUL TO PTL[A],ttl[a],MTL[A]
		STORE .T. TO CTRL[A]
		store .t. to hay
	endif
NEXT
if !hay
	rele ttl,CTRL
endif
TTU=TT
for a=1 to cant_max
	if variable[a]
		acla=acla+padc(texto[a,1],texto[a,2])+paip
	endif
NEXT
lnS=repl("=",len(acla))
tmp=GENTMP()
set order to tag articulo in mer
sele pre
if filxxx=1
	set rela to left(articulo,10) into mer
else
	if filxxx=2
		set rela to left(articulo,13) into mer
	else
		set rela to substr(articulo,5,6) into mer
	endif
endif
INDE ON MER.RUBRO+ARTICULO to (tmp) FOR EVAL(FISC) COMP
=unwork()
GO TOP
ELCORTE=MER.RUBRO
=XSEEK(ELCORTE,'MIX','RUBCOD')
ELRUBRO=MIX.TEXTO1
LAMERCA=IIF(FILXXX=1,LEFT(MER.ARTICULO,10),IIF(FILXXX=2,LEFT(MER.ARTICULO,13),SUBSTR(MER.ARTICULO,5,6)))
LAMERCA1=MER.MERCA
TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)

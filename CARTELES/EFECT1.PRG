parameters xfrom, yfrom, textstr1, textstr2
private xfrom, yfrom, textstr1, textstr2,largos,yto,z,PAUSA
largos=max(len(alltrim(textstr1)),len(alltrim(textstr2)))
largos=LARGOS+iif(espar(largos),3,2)
textstr1=padc(alltrim(textstr1),largos)
textstr2=padc(alltrim(textstr2),largos)
PAUSA=4-LEN(TEXTSTR1)/5
yto = yfrom
define window enlarge from xfrom,yfrom to xfrom+1,yto none color scheme 7
activate window enlarge
for z = 1 to largos/2
	=inpause()
	zoom window enlarge norm from xfrom, yfrom-1 to xfrom+1, yto+1
	yfrom = yfrom - 1
	yto = yto + 1
endfor
@ 0,0 say textstr1
@ 1,0 say textstr2
do apause
for z = 1 to largos/2
	=inpause()
	zoom window enlarge norm from xfrom, yfrom+1 to xfrom+1, yto-1
	yfrom = yfrom + 1
	yto = yto - 1
endfor
release window enlarge
return

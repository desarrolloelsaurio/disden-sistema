function digcuit
para elnro
if type("elnro")="N"
	elnro=alltr(str(elnro))
endif
elnro = alltr(strtran(strtran(strtran(elnro, ".", ""), "-", ""), "/", ""))
if len(elnro)<10
	return -1
endif
dime losx(10)
for i=1 to 4
	losx(i)=6-i
next
for i=5 to 10
	losx(i)=12-i
next
totdig=0
for i=1 to 10
	totdig=totdig+losx(i)*val(subs(elnro,i,1))
next
return int(iif(totdig%11=0, 0, 11-(totdig%11)))

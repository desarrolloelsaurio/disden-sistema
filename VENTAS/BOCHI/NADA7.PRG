dime s(5)
s(1)="."
s(2)="*"
s(3)="-"
s(4)="+"
s(5)="/"
scan
	xxx=recno()
	A=0
	x=alltrim(str(nu2))
	locate for padr(barrio,len(x))=x
***	wait padr(barrio,len(x))+" - "+x wind
	do while found()
		a=a+1
		x=alltrim(str(nu2))+s(a)
		locate for padr(barrio,len(x))=x
	enddo
	go xxx
	replace barrio with x
endscan

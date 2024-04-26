ya=seco()
archivo = "ccclih"
aremo = "f:\sistemas\ventas\ventasa\"+archivo
aloca = "c:\"+archivo
use &aremo alias remoto in 1
use &aloca alias local  in 2
go 1 in local
go 1 in remoto
sele local
do while !eof()
	cambio = .F.
	for i=1 to fcount()
		a=fiel(i)
		b="remoto."+a
		a="local."+a
		if &a != &b
			cambio = .T.
			?fiel(i)
			??&a
			??chr(9)
			??&b
			exit
		endif
	next
	if cambio
		?recn()
		??"   ---->  "
		??deleted()
		for i=1 to fcount()
			a=fiel(i)
			b="remoto."+a
			a="local."+a
*			? fiel(i)
*			??chr(9)
*			??chr(9)
*			??&a 
*			??chr(9)
*			??chr(9)
*			??&b
		next
	endif
	skip in local
	skip in remoto
enddo
?seco()-ya
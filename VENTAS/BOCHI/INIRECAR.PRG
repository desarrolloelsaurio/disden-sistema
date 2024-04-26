USADOR="BATA"
SSTM="SS"
ULPR="XXXXXX"
set excl off
set safe off
set talk off
camino="\\bochi\zip\ventasa\"
use (camino+"auditor") alias aud in 3
use (camino+"cccli") alias ccl in 1
use (camino+"ccclih") alias cclh in 2
**asas=fcreate("C:\pepe.txt")
sele ccl
do while !eof()
  if comprre="RE" and year(fechaop)=2007
	elnro=recn()
	scatter memvar
	store 0 to m.comision, m.comisip
	m.cualfec = m.fechaop
	do calcacom with alltr(m.numerore)
	if used("tmp2")
		use in tmp2
	endif
	sele ccl
	go elnro
	if  abs(comision-m.comision)> .5 and comision>0
		repl comision with m.comision
		repl comisip  with m.comisip
	endif
   endif
   skip
enddo
return

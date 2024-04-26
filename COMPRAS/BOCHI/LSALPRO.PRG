parameter porimp
=opccp()
=oppro()
store date() to feclis
if pidefec("A Listar")
	sele ccp
	sort on procod to c:\nada for fechaop<=feclis
	sele 0
	use c:\nada
	repl gy_debe  with 0, gy_haber with 0 all
	repl gy_debe  with monto for comprre="FA" or comprre="ND"
	repl gy_haber with monto for comprre="RE" or comprre="NC"
	total to c:\nada2 on procod 
	use c:\nada2
	if porimp
		repo form lccpt to prin promp noco for gy_debe<>gy_haber
	else
		repo form lccpt preview noco for gy_debe<>gy_haber
	endif
endif
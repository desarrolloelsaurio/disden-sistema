@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ulpr=program()
do case
case bar()=1
	if jannro=0
		do opjan
		do elijan
	endif
	if jannro<>0
		do opemp
		do opcat
		do opcon
		do opccos
		do opesp
		do kk1 with 8,20,'L¡mites de la Emisi¢n de los Cheques'
		DEFI BAR 7 OF caca1 PROM ' \<Desde'
		on sele popu caca1 do lchei
		acti popu caca1
		rele popu caca1
	endif
case bar()=2
	if jannro=0
		do opjan
		do elijan
	endif
	if jannro<>0
		do opemp
		do opcat
		do opcon
		do opccos
		do opesp
		MAX=4
		DIME CO[MAX]
		CO[1]='  Legajo  '
		co[2]=padc("Empleado",30)
		co[3]=padc('Cheque',acdigi)
		co[4]=padc("Monto",acdigi)
		do kk2 with 8,20,'L¡mites del Listado de Cheques Emitidos'
		on sele popu caca1 do lcheie
		acti popu caca1
		rele popu caca1
	endif
case bar()=3
	do actche
case bar()=4
	do alinea
endcase
@ 24,0 say space(80)
ulpr=program()
return


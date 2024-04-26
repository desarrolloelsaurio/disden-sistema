****************************************
*-- Programa: ltixp3.prg
*-- Fecha   : 01-22-92 11:12am
*-- Version : R. 'EL BATA'
*-- Notas   : LISTA DATOS DE % de PART.
****************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=OPGAS()
	go top
	store .f. to moverele
	scan while last()#27
		reggas=recno()
		fisc='tix.gascod="'+left(mix.texto2,11)+'" .and. tix.concod="'+cns.concod+'"'
		TTU='Listado del consorcio '+alltrim(CNS.consorcio)+' gasto tipo '+alltrim(mix.texto1)
		do ltixp0 with moverele
		store .t. to moverele
		=OPGAS()
		GO REGGAS
	endscan
	=RELEWIN("WIN")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION LFACPY1
IF !EMPTY(TOT)
	? PAIP
	?? left(ELARTICULO,10)
	?? PAIP
	?? left(LAMERCA,30)
	?? paip
	?? str(can,xacdigi,2)
	?? PAIP
	IF HAYDISC
	?? str(PES,xacdigi,2)
	?? PAIP
	tPES=tPES+PES
	ENDIF
	?? str(gra,xacdigi,2)
	?? PAIP
	?? str(iva,xacdigi,2)
	?? PAIP
	?? str(tot,xacdigi,2)
	?? PAIP
	tcan=tcan+can
	tiva=tiva+iva
	tgra=tgra+gra
	ttot=ttot+tot
  ENDIF
	store nul to can,iva,gra,tot,PES
	lamerca=mer.merca
	elarticulo=fax.articulo
RETURN .T.

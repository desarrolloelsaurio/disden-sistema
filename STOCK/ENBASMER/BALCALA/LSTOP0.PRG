FUNCTION LSTOP0
	=working()
	=dotalk()
	SELE RUB
	SET ORDER TO TAG CODRUB
	ESTRIN=(LEFT(SYS(14,3),3)="STR")
	dime ttl[CANT_MAX],ctrl[CANT_MAX],PTL[CANT_MAX]
	hay=.f.
	for a=3 to CANT_MAX
		if variable[a]
			STORE NUL TO PTL[A],ttl[a]
			store .t. to hay,CTRL[A]
		endif
	NEXT
	if !hay
		rele ttl,ctrl
	endif
	TTU=TT
	ACLA=HAZ_ACLA()
	lnS=repl("=",len(acla))
	tmp=GENTMP()
	sele mer
	=flock("mer") .or. flok("mer")
	sort on MER.RUBRO ,;
	ARTICULO ;
	to (tmp) ;
	FOR &FISC
	use
	use (tmp) alias mer excl
	=untalk()
	=unwork()
	stor nul TO casos
	GO TOP
	ELCORTE=IIF(ESTRIN,STR(MER.RUBRO),MER.RUBRO)
	=XSEEK(ELCORTE,'RUB','CODRUB')
	ELRUBRO=RUB.RUBRO
	TT=TTU+CHR(13)+CHR(10)+"Rubro:"+alltrim(elrubro)
RETURN .T.

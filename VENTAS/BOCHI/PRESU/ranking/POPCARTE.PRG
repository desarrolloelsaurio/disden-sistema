FUNCTION POPCARTE
	PARAMETER POP1,ALAIZ
	PRIVATE POP1,pop2,pop3,pop4,largo,ancho,ventant
	ventant=wontop()
	acti scre
	POP2=POP1
	STORE 0 TO ANCHO
	DO WHILE !EMPTY(OCCU(CHR(13),POP2))
		POP3=AT(CHR(13),POP2)
		POP4=LEFT(POP2,POP3-1)
		POP2=SUBSTR(POP2,POP3+2)
		ANCHO=MAX(ANCHO,LEN(POP4))
	ENDDO

	ANCHO=MAX(ANCHO,LEN(POP2))+8
	IF ALAIZ
		ANCHO1=ANCHO
		ANCHO=1
	ELSE
		ANCHO1=79
		ancho=79-ancho
	ENDIF
	LARGO=OCCU(CHR(13),POP1)+2
	DEFI WIND POPCARTE FROM 1,ancho TO LARGO+1,ANCHO1 shad
	ACTI WIND POPCARTE
	_rmargin=wcols()
	_ALIGNMENT="CENTER"
	_wrap=.t.
	clea
	? POP1
	_wrap=.f.
	_rmargin=80
	if !empty(ventant)
		acti wind (ventant)
	else
		acti scre
	endif
RETURN .T.

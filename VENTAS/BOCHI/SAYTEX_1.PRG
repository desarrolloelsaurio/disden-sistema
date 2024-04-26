FUNCTION SAYTEX_1
	PARAMETERS S_T1,S_T2,CONTIN,TODOGRANDE
    _WRAP=.F.	
	? CHR(27)
	?? 'x1'
	IF !EMPTY(S_T1)
		?? CHR(14)
		?? CHR(27)
		?? '~11'
		?? PADC(ALLT(S_T1)+IIF(CONTIN,' - Continuaci¢n',""),40)
		IF !TODOGRANDE
			?
			?? CHR(27)
			?? '~10'
		ELSE
			?
		ENDIF
		IF !EMPTY(S_T2)
			?? CHR(14)
			?? PADC(ALLTRIM(S_T2),40)
		ENDI
	ENDI
	IF TODOGRANDE
		?
		?? CHR(27)
		?? CHR(14)
	ENDIF
	_WRAP=.T.		
RETURN .T.

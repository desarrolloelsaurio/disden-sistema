FUNCTION AJCODMER
	PARAMETER AJ_COD
	ELALIAS=ALIAS()
	SELE MER
	i=AT('.',AJ_COD)
	IF I=0 .OR. I>4
		if ulpr='IPEC'
			SET ORDER TO TAG MODEL1
		ELSE
			SET ORDER TO TAG MODELO
		ENDIF
		resant=AJ_COD
		AJ_COD=SEEK(PADR(ALLTRIM(upper(AJ_COD)),10))
		AJ_COD=IIF(EMPTY(AJ_COD),IIF(SEEK(ALLTRIM(upper(RESant))),MER.ARTICULO,RESANT),MER.ARTICULO)
	ELSE
		a1=LEFT(AJ_COD,i-1)
		if right(a1,1)='+'
			a1=val(sinult(a1))
			a2=a1+1
			a3=substr(AJ_COD,i+1)
		else
			if right(a1,1)='-'
				a1=val(sinult(a1))
				a2=a1-1
				a3=substr(AJ_COD,i+1)
			else
				if right(a1,1)='*'
					a1=val(sinult(a1))
					a2=a1*2
					a3=substr(AJ_COD,i+1)
				else
					if right(a1,1)='/'
						a1=val(sinult(a1))
						a2=a1/2
						a3=substr(AJ_COD,i+1)
					else
						F=AT('.',AJ_COD,2)
						a1=val(a1)
						a2=VAL(SUBSTR(AJ_COD,i+1,F-1))
						a2=iif(a2=0,a1,a2)
						a3=UPPER(SUBSTR(AJ_COD,F+1))
					endif
				endif
			endif
		endif
		a1=zero(a1,3)+'.'
		a2=zero(a2,3)+'.'
		AJ_COD=PADR(a1+a2+UPPER(a3),20)
	ENDIF
	IF !EMPTY(ELALIAS)
    SELE (ELALIAS)
    ENDIF
RETURN AJ_COD

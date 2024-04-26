dime busca[5]
BUSCA[1]='repl
REEMP='='
DEFINE POPU NADA FROM 0,0 PROMPT FILES LIKE LPEDP5.PRG
SHOW POPU NADA
CLEA
PSC=5
A=""
DO WHILE .T.
	STORE .F. TO CAMBIO
	fuente=alltrim(prmbar("nada",PSC))
	respaldo=left(fuente,len(fuente)-3)+"bak"
	copy file (fuente) to (respaldo)
	Frespaldo=fOPEN(respaldo,0)
	ffuente=fopen(fuente,1)
	? FUENTE
	do while !feof(frespaldo)
		a=fgets(frespaldo)
		px=at(alltrim(busca),alltrim(a))
		if px#0
			cc=STUFF(A,PX,LEN(BUSCA),REEMP)
			=fputs(ffuente,cc)
			STORE .T. TO CAMBIO
		else
			=fputs(ffuente,a)
		endif
	ENDdo
	? FCLOSE(FFUENTE)
	? FCLOSE(FRESPALDO)
	IF !CAMBIO
		?? ' SIN CAMBIO'
		ERASE (FUENTE)
		RENAME (RESPALDO) to (FUENTE)
	ENDIF
	CLEA
	PSC=PSC+1
ENDDO
RETURN

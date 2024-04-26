FUNCTION GODAY
	PARAMETER GO_DATE,GO_FECHA
	PRIVATE GO_DATE,GO_FECHA,NEW_DATE,go_vez
	store 1 to go_vez
	NEW_DATE=ALLTRIM(STR(GO_FECHA))+SUBSTR(DTOC(GO_DATE),3)
	do while dtoc(ctod(new_date))#new_date
	NEW_DATE=ALLTRIM(STR(GO_FECHA-go_vez))+SUBSTR(DTOC(GO_DATE),3)      	
	go_vez=go_vez+1
	enddo
RETURN ctod(NEW_DATE)

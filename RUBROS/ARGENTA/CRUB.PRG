********************************************************************************
*-- Programa: CRUB.PRG
*-- Fecha   : 11/08/91
*-- Version : V.LEEGSTRA
*-- Notas   : CORRIGE RUBRO
*-- Modificaci¢n GOYO 07-28-92 06:52pm
********************************************************************************
STOR RECNO() TO ff
registro=STR(ff)
ulpr=hora_ulp(program())
if cheqseg()
	SELE rub
	do lok with "rub"
	SCAT MEMV
	STOR " Correcci¢n Rubro - " TO me1
	STOR 17 TO COL
	STOR .F. TO CAMBIO
	STOR .T. TO sigue
	=MOVEWIN(cRUBr,cRUBc,cRUBr+cRUBla+1,cRUBc+cRUBan,'WIN'," Correcci¢n Rubro ")
	=mRUB(.T.)
	@ 1,COL GET m.rubRO PICT "@!" ;
	valid !yaestaba(m->RUBRO,alias(),'RUBRO',.T.,.T.) ;
	error 'RUBRO EXISTENTE';
	MESS me1+'[ESC] para Men£'
	READ
	STORE UPDATE() TO CAMBIO
	@ 2,COL GET m.CODRUB PICT '999' ;
	valid !yaestaba(m->CODRUB,alias(),'CODRUB',.F.,.T.) ;
	error 'CODIGO DE RUBRO EXISTENTE' ;
	MESS me1+'- C¢digo del Rubro'
	READ WHEN LAST()#27 .AND. !EMPTY(M.RUBRO)
	STORE IIF(CAMBIO,.T.,UPDATE()) TO CAMBIO
	IF LAST()#27 .AND. !EMPTY(M.CODRUB) .AND. CAMBIO
		=MEN_LIN(grabando)
		SELE rub
		GOTO ff
		GATH MEMV
		=repuse()
		=iaud(ALLTRIM(m.rubRO)+"-"+ZERO(M.CODRUB,3))
		SET ORDER TO
		SCAN FOR RUBRO=M.CODRUB .AND. !EMPTY(CODSRUB)
			=LOCK() .OR. LOK("RUB",STR(RECNO()))
			REPL PALISTAR WITH M.RUBRO+SUBSTR(PALISTAR,21)
			UNLO IN RUB
		ENDSCAN
	ENDIF
	UNLO IN rub
	=RELEWIN("win")
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN

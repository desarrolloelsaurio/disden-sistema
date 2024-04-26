********************************************************************************
*-- Programa: IRUB.PRG
*-- Fecha   : 05/06/91
*-- Version : G. REINER
*-- Notas   : INGRESA RUBRO
*-- VERSION NOVOGAR
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	SELE rub
	STOR " Ingreso de Rubros - " TO me1
	STOR 17 TO COL
	DO WHIL .T.
		=MOVEWIN(irubr,irubc,irubr+irubla,irubc+iruban,'WIN'," Ingreso Rubro ")
		CLEA
		SCAT MEMV BLAN
		=MRUB()
		@ 1,COL GET m->rubro PICT "@!";
		valid !yaestaba(m->RUBRO,alias(),'RUBRO',.T.);
		error 'RUBRO EXISTENTE';
		MESS me1+'[ENTER] para Men£'
		READ
		@ 2,COL GET m->CODrub PICT "999";
		valid !yaestaba(m->CODRUB,alias(),'CODRUB',.F.);
		error 'CODIGO DE RUBRO EXISTENTE';
		MESS "C¢digo del Rubro"
		READ WHEN LAST()#27 .AND. !EMPTY(M.RUBRO)
		if LAST()#27 .AND. !EMPTY(M.CODRUB)
			=AGRABAR("RUB")
			=iaud(ALLTRIM(M.RUBRO)+'-'+ZERO(M.CODRUB,3))
		ELSE
			EXIT
		ENDIF
	ENDDO
	=RELEWIN("win")
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN

*******************************************************************************
*-- Programa: poligo.prg
*-- Fecha   : 11-09-92 03:59pm
*-- Version : G. REINER
*-- Notas   : MENU POLIGONALES
********************************************************************************
ULPR=PROGRAM()
IF CHEQSEG()
=CABPAN1()
DO OPPOL
DO CASE
CASE BAR()=1
	LAPOL=ELIPOL("a Corregir",-1,1)
	IF !EMPTY(LAPOL)
		LAlis=alltrim(q_lis(val(left(lapol,2))))
		SELE POL
		SET ORDER TO TAG LISTA
		GO TOP
		=popcarte('Poligonal'+chr(13)+chr(10)+'N£mero: '+right(lapol,2)+chr(13)+chr(10)+'Lista Tipo '+lalis)
		DEFI WIND WIN FROM 0,0 TO 15,43 titl lalis+' - N£mero: '+right(lapol,2)+' ' DOUB SHAD COLO SCHE 8
		=centwin("win")
		=MEN_LIN("[ESC] para Finalizar")
		brow fiel ;
		LISTA:R,;
		NUMERO:R,;
		LIMITE:P="9,999,999.99999":H=PADC("LIMITE",16) ,;
		PORCENTAJE:P="999.99" ;
		WIND WIN ;
		KEY LApol
		=relewin("win")
		=relewin("popcarte")
	endif
CASE BAR()=3
	LAPOL=ELIPOL("a Listar",-1,1)
	IF !EMPTY(LAPOL)
		LAlis=alltrim(q_lis(val(left(lapol,2))))
		SELE POL
		SET ORDER TO TAG LISTA
		fisc="lista+numero='"+lapol+"'"
		do lpolp
	endif
	CASE BAR()=4
	LAPOL=ELIPOL("a Listar",-1,1)
	IF !EMPTY(LAPOL)
		LAlis=alltrim(q_lis(val(left(lapol,2))))
		SELE POL
		SET ORDER TO TAG LISTA
		fisc="lista+numero='"+lapol+"'"
		do lpolI
	endif
ENDCASE
=MEN_LIN(BOTOM)
ELSE
=IAUDI()
ENDIF
RETURN

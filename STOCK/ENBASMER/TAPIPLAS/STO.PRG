****************************************************************************
*-- Programa: STO.PRG
*-- Fecha   : 12-12-91 05:48pm
*-- Version : G. REINER
*-- Notas   : DERIVA A GESTION DE STOCk
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
*-- VERSION TAPIPLAST
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
SELE mer
DO CASE
CASE BAR()=1
	ttque=''
	fisc=grl2(' L¡mites del Ingreso de Stock ')
	if fisc#'.F.'
		=popcarte('Ingresa Stock'+ttque)
		store nul to cant_max
		=lmerp0()
		=men_lin("[ESC] para Salir")
		=MOVEWIN(8,nul,22,79,'WIN'," Correcci¢n Stock ",ALLTRIM(JANNAME))
		SELE mer
		BROW FIELD ARTICULO/R:p="9999999":R;
		,stock   :p="9999999":H=" STOCK  " ;
		,merca   :p="@!":H=padc("DENOMINACION",40):R;
		,COSA=left(MI1.TEXTO1,15):p="@!":H=padc("MARCA",15):R;
	    FREEZE stock ;
		NOAPPEND  NODELETE  NOMENU  WIND win
		=relewin("win")
		=relewin("popcarte")
		=reopmer()
	endif
CASE BAR()=3
		do lsto
CASE BAR()=4
		do lsto with .t.
CASE BAR()=6
	ulpr='Xmer'
	DO rndx WITH 16,20
	ON SELE POPU rndx DO xmer
	ACTI POPU rndx
	RELE POPU rndx

ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN

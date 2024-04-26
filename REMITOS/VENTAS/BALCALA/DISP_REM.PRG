* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    ARCHIVO: DISP_FAC.PRG                                                 ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 12-17-92                                                   ³
* ³ Time created: 10:33:52am                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
* DERIVA A IMPRESION DE FACTURAS DE DISTRIBUIDORES DE MORFI
FUNCTION DISP_REM
	PARAMETER D_UNO,D_DOS
	DO CASE
	CASE LEFT(JANNAME,5)="PALAD" .OR. LEFT(JANNAME,5)="GUILL"
		DO lREMIP WITH D_UNO,D_DOS
	CASE LEFT(JANNAME,7)="GUIPER "
		DO lREMIG WITH D_UNO,D_DOS
	CASE LEFT(JANNAME,5)="ARCO "
		DO lREMIA WITH D_UNO,D_DOS
	CASE LEFT(JANNAME,5)="CLAUD"
		DO lREMIB WITH D_UNO,D_DOS
	CASE RIGHT(ALLTRIM(JANNAME),5)="MELAC"
		DO lremiGA WITH D_UNO,D_DOS
	CASE LEFT(JANNAME,5)="DEMOS" .OR. ;
		LEFT(JANNAME,8)="SISTEMAS" .OR. ;
		LEFT(MIX.TEXTO1,11)="ALGO S.R.L."
		DO lREMIGA WITH D_UNO,D_DOS
		*    CASE LEFT(MIX.TEXTO1,11)="ALGO S.R.L."
		*    	DO lREMIAL WITH D_UNO,D_DOS
	OTHERWISE
		DO lREMIL WITH D_UNO,D_DOS
	ENDCASE
RETURN .T.

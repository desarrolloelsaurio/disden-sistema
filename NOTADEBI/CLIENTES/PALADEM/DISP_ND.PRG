* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �    ARCHIVO: DISP_ND.PRG                                                 �
* �       AUTOR: G. REINER                                                   �
* � Date created: 12-17-92                                                   �
* � Time created: 10:33:52am                                                 �
* �    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
* DERIVA A IMPRESION DE FACTURAS DE DISTRIBUIDORES DE MORFI
FUNCTION DISP_ND
	PARAMETER D_UNO,D_DOS
	DO CASE
	CASE LEFT(JANNAME,5)="PALAD" 
		DO lDEBiP
	CASE LEFT(JANNAME,5)="GUILL"
		DO lDEBiGUI
*CASE LEFT(JANNAME,7)="GUIPER "
*	DO LCREIG WITH D_UNO,D_DOS
*CASE LEFT(JANNAME,5)="ARCO "
*	DO lDEBi1A WITH D_UNO,D_DOS
*CASE LEFT(JANNAME,5)="CLAUD"
*	DO LCREIB WITH D_UNO,D_DOS
	CASE RIGHT(ALLTRIM(JANNAME),5)="MELAC"
		DO LCREIME WITH D_UNO,.T.
	CASE LEFT(JANNAME,5)="DEMOS" .OR. ;
		LEFT(JANNAME,8)="SISTEMAS" .OR. ;
		LEFT(MIX.TEXTO1,11)="ALGO S.R.L."
		DO LCREIGA WITH D_UNO,D_DOS
		*    CASE LEFT(MIX.TEXTO1,11)="ALGO S.R.L."
		*    	DO LCREIAL WITH D_UNO,D_DOS
	OTHERWISE
		DO lDEBi1L WITH D_UNO,D_DOS
	ENDCASE
RETURN .T.

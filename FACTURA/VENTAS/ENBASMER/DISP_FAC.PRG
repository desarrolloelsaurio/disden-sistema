* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �    ARCHIVO: DISP_FAC.PRG                                                 �
* �       AUTOR: G. REINER                                                   �
* � Date created: 12-17-92                                                   �
* � Time created: 10:33:52am                                                 �
* �    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
* DERIVA A IMPRESION DE FACTURAS DE DISTRIBUIDORES DE MORFI
FUNCTION DISP_FAC
	PARAMETER D_UNO,D_DOS,D_TRES
	DO CASE
	CASE LEFT(JANNAME,5)="PALAD" 
		DO lfaciP WITH D_UNO,D_DOS,D_TRES
	CASE LEFT(JANNAME,5)="GUILL"
		DO lfaciGUI WITH D_UNO,D_DOS,D_TRES
	CASE LEFT(JANNAME,7)="GUIPER "
		DO lfaciG WITH D_UNO,D_DOS,D_TRES
	CASE LEFT(JANNAME,5)="ARCO "
		DO lfaciA WITH D_UNO,D_DOS,D_TRES
	CASE LEFT(JANNAME,5)="CLAUD"
		DO lfaciB WITH D_UNO,D_DOS,D_TRES
	CASE RIGHT(ALLTRIM(JANNAME),5)="MELAC"
		DO lfaciME WITH D_UNO,D_DOS,D_TRES
	CASE LEFT(JANNAME,5)="DEMOS" .OR. ;
		LEFT(JANNAME,8)="SISTEMAS" .OR. ;
		LEFT(MIX.TEXTO1,11)="ALGO S.R.L."
		DO lfaciGA WITH D_UNO,D_DOS,D_TRES
		*CASE LEFT(MIX.TEXTO1,11)="ALGO S.R.L."
		*DO lfaciAL WITH D_UNO,D_DOS,D_TRES
	OTHERWISE
		DO lfaciL WITH D_UNO,D_DOS,D_TRES
	ENDCASE
RETURN .T.

* 旼 PROGRAMA 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �    ARCHIVO: DISP_FAC.PRG                                                 �
* �       AUTOR: G. REINER                                                   �
* � Date created: 12-17-92                                                   �
* � Time created: 10:33:52am                                                 �
* �    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
* DERIVA A IMPRESION DE FACTURAS DE MERCADO DE CONCENTRACION
FUNCTION DISP_FAC
	DO CASE
	CASE UPPER(LEFT(JANNAME,5))="ARGEN"
        LARGOJA=47
	    =IMP_FAC("LFACIAA")
	ENDCASE
RETURN .T.

* ÚÄ PROGRAMA ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    ARCHIVO: DISP_FAC.PRG                                                 ³
* ³       AUTOR: G. REINER                                                   ³
* ³ Date created: 12-17-92                                                   ³
* ³ Time created: 10:33:52am                                                 ³
* ³    Copyright: 1992 by SISTEMAS INFORMATICOS S.R.L.                       ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
* DERIVA A IMPRESION DE FACTURAS DE MERCADO DE CONCENTRACION
FUNCTION DISP_FAC
	DO CASE
	CASE UPPER(LEFT(JANNAME,5))="ARGEN"
        LARGOJA=47
	    =IMP_FAC("LFACIAA")
	ENDCASE
RETURN .T.

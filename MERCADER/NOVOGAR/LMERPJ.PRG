* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LMERPJ.PRG                                               �
* � COMENTARIO    :                                                          �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-03-93                                                    �
* � HORA       : 11:47:27am                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	STORE 1 TO M.SALIDA
	SELE mer
	=LMERM0(.T.,"RUB.PALISTAR,MI1.TEXTO1,MER.ARTICULO,MER.MERCA,MER.MERCA1",ULPR)
	=movewin(10,5,22,75,'win1',' Legajo ')
	=movewin(1,1,10,70,'win',' Datos de la Mercader�a ')
	GO TOP
	STORE "" TO RUBR,SUBR
			=LMERPJ2()	
			
	@ 1,2 SAY "Rubro       :" COLOR SCHE 3
	@ 2,2 SAY "Subrubro    :" COLOR SCHE 3
	@ 3,2 SAY "Art�culo    :" COLOR SCHE 3
	@ 4,2 SAY "Denominaci�n:" COLOR SCHE 3	
	@ 3,37 SAY "Marca:" COLOR SCHE 3	
	
	@ 1,15 GET M.RUBR PICT "@!" DISA
	@ 2,15 GET M.SUBR PICT "@!" DISA	
	@ 3,15 GET mer.articulo PICTURE '@!' DISA
	@ 3,44 GET mer.texto1 PICTURE '@!'	DISA
	@ 4,15 GET mer.merca PICTURE '@!' DISA
	ACTI WIND WIN1
	@ 1,1 EDIT MER.MERCA1 ;
	SIZE 10,68 ;
	DISABLE
	ACTI WIND WIN
	@ 6,20 GET M.SALIDA ;
	PICT "@*HN \!\<SIGUIENTE;\<ANTERIOR;\?\<FIN" ;
	SIZE 1,10,1 ;
	MESS " [S] o [Ctrl ENTER] para Siguiente / [F] o [ESC] para Fin" ;
	VALID LMERPJ1()
	READ CYCLE
	=iaud(alltrim(mer.articulo)+'-'+mer.merca)
	=RELEWIN("WIN1")
	=RELEWIN("WIN")
	=REOPMER()
	set mess to space(78)
ELSE
	=IAUDI()
ENDIF
RETURN

FUNCTION LMERPJ1
	DO CASE
	CASE M.SALIDA=1
		IF !EOF("MER")
			=iaud(alltrim(mer.articulo)+'-'+mer.merca)
			SKIP
			=LMERPJ2()			
			=SGET("WIN1")
			=SGET("WIN")
		ELSE
			CLEA READ
		ENDIF
	CASE M.SALIDA=2
		IF !BOF("MER")
			=iaud(alltrim(mer.articulo)+'-'+mer.merca)
			SKIP -1
			=LMERPJ2()
			=SGET("WIN1")
			=SGET("WIN")
		ELSE
			CLEA READ
		ENDIF
	CASE M.SALIDA=3
		CLEA READ
	ENDCASE
RETURN 0

FUNCTION LMERPJ2
	RUBR=LEFT(PALISTAR,20)
	SUBR=SUBSTR(PALISTAR,21)
RETURN
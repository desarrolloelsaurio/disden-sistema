********************************************************************************
*-- Programa: LFACPW.PRG
*-- Fecha   : 07-16-92 12:07pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE VENTAS - SUMA UNIDADES
********************************************************************************
PARAMETER LAGUITA
XACDIGI=XACDIGI-2
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO ELIVA,CANT_EL,ACLA,MES1,MES2,LNEA,SUMA,TIT,PUNTERO,ANO1,ELCORTE,ELTEXTO,ELTEXTO1,KTIPO,ANO2
	=LFACPW0(.T.)
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	TT='Estad¡stica de Ventas'+ttque
	=TIT_(1)
	=linfacpw()
	=titfacpw()
	=linfacpw()
	STORE NUL TO SUMA
	GO TOP
	=CORFACPW()
	SCAN
		IF KTIPO='111'
			CONTROL=fac.codcli
		ELSE
			IF KTIPO='231'
				CONTROL=fax.articulo
			ELSE
				CONTROL=left(fax.articulo,3)
			ENDIF
		ENDIF
		IF ELCORTE#CONTROL
			=IMPFACPW()
			=CORFACPW()
		ENDIF
		IF ROW()>21
			=LINFACPW()
			=TOTFACPW()
			IF INKEY(0,'HM')=27
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_(2)
			=linfacpw()
			=titfacpw()
			=linfacpw()
		ENDIF
		JODES=MONTH(FAC.FECHAEM)
		SHANA=YEAR(FAC.FECHAEM)-ANO2
		SHANA=IIF(SHANA>CANT_EL .OR. SHANA<1,0,SHANA)
		PUNTERO=SHANA*12+JODES-MES1+1
		CUANTOS=ABS(IIF(LAGUITA,FAX.CANTIDAD*FAX.MONTO1*ELIVA[PER.CONDIVA],FAX.CANTIDAD))
		if fac.tipo="NC"
			LNEA[PUNTERO]=LNEA[PUNTERO]-CUANTOS
			SUMA[PUNTERO]=SUMA[PUNTERO]-CUANTOS
		ELSE
			LNEA[PUNTERO]=LNEA[PUNTERO]+CUANTOS
			SUMA[PUNTERO]=SUMA[PUNTERO]+CUANTOS
		ENDIF
	ENDSCAN
	=IMPFACPW()
	=LINFACPW()
	=TOTFACPW()
	=FIN_LIN(2)
	=RELEWIN("win")
	=REOPFAC()
	=REOPMER()
	=IAUD(FISC)
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
XACDIGI=XACDIGI+2
RETURN

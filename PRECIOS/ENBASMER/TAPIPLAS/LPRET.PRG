********************************************************************************
*-- Programa: LPRET.PRG
*-- Fecha   : 11-20-92 11:46am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE PRECIOS / TOTAL
********************************************************************************
PARAMETER PORPAN
ulpr=HORA_ULP(PROGRAM())
if cheqseg()
	TTQUE=''
	FISC=GRL2("L¡mites de la Lista de Precios")
	if fisc#'.F.'
		CANT_MAX=26
		DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]

		TEXTO[1,1]="RUBRO"
		TEXTO[2,1]="SUBRUBRO"
		TEXTO[3,1]="ARTICULO"
		TEXTO[4,1]="DENOMINACION"
		TEXTO[5,1]="MARCA"
		TEXTO[6,1]="PROVEEDOR 1"
		TEXTO[7,1]="% "+xalis1
		TEXTO[8,1]="% "+xalis2
		TEXTO[9,1]="% "+xalis3
		TEXTO[10,1]="% "+xalis4

		TEXTO[11,1]=alltrim(xalis1)+' / '+left(xauss,3)
		TEXTO[12,1]=alltrim(xalis2)+' / '+left(xauss,3)
		TEXTO[13,1]=alltrim(xalis3)+' / '+left(xauss,3)
		TEXTO[14,1]=alltrim(xalis4)+' / '+left(xauss,3)

		TEXTO[15,1]=alltrim(xalis1)+' / '+left(xauss,3)+' + I.V.A.'
		TEXTO[16,1]=alltrim(xalis2)+' / '+left(xauss,3)+' + I.V.A.'
		TEXTO[17,1]=alltrim(xalis3)+' / '+left(xauss,3)+' + I.V.A.'
		TEXTO[18,1]=alltrim(xalis4)+' / '+left(xauss,3)+' + I.V.A.'

		TEXTO[19,1]=alltrim(xalis1)+' / '+left(xadols,3)
		TEXTO[20,1]=alltrim(xalis2)+' / '+left(xadols,3)
		TEXTO[21,1]=alltrim(xalis3)+' / '+left(xadols,3)
		TEXTO[22,1]=alltrim(xalis4)+' / '+left(xadols,3)

		TEXTO[23,1]=alltrim(xalis1)+' / '+left(xadols,3)+' + I.V.A.'
		TEXTO[24,1]=alltrim(xalis2)+' / '+left(xadols,3)+' + I.V.A.'
		TEXTO[25,1]=alltrim(xalis3)+' / '+left(xadols,3)+' + I.V.A.'
		TEXTO[26,1]=alltrim(xalis4)+' / '+left(xadols,3)+' + I.V.A.'

		TEXTO[1,2]=3
		TEXTO[2,2]=3
		TEXTO[3,2]=7
		TEXTO[4,2]=40
		TEXTO[5,2]=20
		TEXTO[6,2]=30
		TEXTO[7,2]=9
		TEXTO[8,2]=9
		TEXTO[9,2]=9
		TEXTO[10,2]=9
		TEXTO[11,2]=xacdigi
		TEXTO[12,2]=xacdigi
		TEXTO[13,2]=xacdigi
		TEXTO[14,2]=xacdigi
		TEXTO[15,2]=xacdigi
		TEXTO[16,2]=xacdigi
		TEXTO[17,2]=xacdigi
		TEXTO[18,2]=xacdigi
		TEXTO[19,2]=xacdigi
		TEXTO[20,2]=xacdigi
		TEXTO[21,2]=xacdigi
		TEXTO[22,2]=xacdigi
		TEXTO[23,2]=xacdigi
		TEXTO[24,2]=xacdigi
		TEXTO[25,2]=xacdigi
		TEXTO[26,2]=xacdigi

		store .t. to habilitado
		DO WHILE CFGFAC()
			IF PORPAN
				do LPREP
			ELSE
				DO LPREI
			ENDIF
		store .t. to habilitado
ENDDO
	endif
else
	=iaudi()
endif
RETURN

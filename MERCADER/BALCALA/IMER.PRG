******************************************************************************
*-- Programa: IMER.PRG
*-- Fecha   : 03-27-92 01:45am
*-- Version : G. REINER
*-- Notas   : INGRESA MERCADERIA
********************************************************************************
PRIVATE TEMP
STORE PROGRAM() TO ULPR
IF CHEQSEG()
	=HORA_ULP()
	=movewin(imerr,imerc,imerr+imerla,imerc+imeran,'win'," Ingreso Mercader¡a-"+alltrim(janname),alltrim(janname))
	STOR " Ingreso Mercader¡a - " TO me1
	STOR 27 TO COL
	STOR NUL TO kok
	rele temp
	dime temp[5]
	=GEN_TEM(@TEMP)
	DO WHIL .T.
		sele mer
		SCAT MEMV BLAN
		M.DISCRIM=XXTOCHAR(M.DISCRIM)
		M.UNIDXBUL=1
		acti wind win
		clea
		=mmer(.F.)
		store nul to respuesta
		IF !EMPTY(elirub(" del Producto",1,COL))
			m.rubro=rub.codrub
			nada=rub.rubro
			@ 1,col get nada
			clea gets
			@ 2,COL GET m.articulo ;
			valid !yaestaba(m.articulo,'mer','articulo') ;
			error 'El Art¡culo '+alltrim(m.articulo)+' Existe' ;
			mess me1+' Art¡culo'
			READ
			@ 3,col get m.merca PICT '@!' ;
			VALID !YAESTABA(M.MERCA,'MER','MERCA',.T.,.F.,.T.) ;
			ERROR 'DENOMINACION EXISTENTE' ;
			mess me1+' Denominaci¢n del Producto'
			read WHEN LAST()#27 .AND. !EMPTY(M.ARTICULO)
			IF LAST()#27 .AND. !EMPTY(M.MERCA) .AND. !EMPTY(M.ARTICULO)
				STORE NUL TO RESPUESTA
				IF ELIMAR("DEL PRODUCTO",4,COL)
					M.MARCA=LEFT(MIX.TEXTO2,2)
					M.NADA=MIX.TEXTO1
					@ 4,COL GET M.NADA
					CLEA GETS
					STORE NUL TO RESPUESTA
					IF ELIPRO("DEL PRODUCTO",5,COL)
						M.PROVEEDOR=PRO.PROCOD
						M.NADA=PRO.PROVEEDOR
						@ 5,COL GET M.NADA
						CLEA GETS
						m.temporada=TEMP[pop_lisT(5,COL,@temp,'Temporada de '+alltrim(m.merca))]
						@ 6,COL GET M.TEMPORADA
						CLEA GETS
						@ 7,col get m.UNIdXBUL pict '9999';
						default 1;
						mess me1+' Cantidad de Unidades por Bulto/Caja/Bolsa';
						range 1,1000
						@ 8,COL GET M.DISCRIM PICT '@M NO,SI'
						READ when last()#27
						if lastkey()#27
							IF confirma(" los Datos Ingresados",.T.,16,nul)
								m.discrim=(m.discrim='SI')
								=AGRABAR("MER")
								=IAUD(zero(m.rubro,3)+M.ARTICULO+'-'+M.MERCA)
							endif
							unlo all
						ENDIF
					else
						exit
					endif
				else
					exit
				endif
			else
				exit
			ENDIF
		ELSE
			EXIT
		ENDIF
	ENDDO
	=relewin('win')
ELSE
	=iaudI()
ENDIF
DEAC WIND ALL
=men_lin(botom)
RETURN

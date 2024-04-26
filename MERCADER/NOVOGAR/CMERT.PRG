********************************************************************************
*-- Programa: CMERT.PRG
*-- Fecha   : 11/29/91
*-- Version : V.LEEGSTRA - G. REINER
*-- Notas   : CORRIGE MERCADERIA, TODO
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
********************************************************************************
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	define window win from 0,nul to 24,79 titl " Correcci¢n Mercader¡a " none shad color sche 8
	set order to TAG PROCOD IN PRO
	sele mer
	set order to TAG ARTICULO
	stor " Correcci¢n Mercader¡a - " to me1
	stor .f. to M.CAMBIO
	stor 23 to col
	stor 15 to col1
	define window win1 from 5,col1 to 15,70 titl " Descripci¢n Completa " shad color sche 8
	stor nul to kok,NADA
	stor space(9) to nada1,nada2
	acti wind win
	stor .t. to sigue
	clea
	ff=recno("mer")
	REGISTRO=STR(ff)
	=lock("mer") .or. LOK("MER")
	scat memv
	do mmer with .t.
	M.MERCAOR=M.MERCA
	@ 5,col1 get m.merca
	READ
	IF LAST()#27 .AND. !EMPTY(M.MERCA)
	STORE (M.MERCA#M.MERCAOR) TO M.CAMBIO
	SUSP
	NADA=SAYMIX1(M.MARCA,"MARCOD")
    @ 7,COL1 GET nada
	read
	IF LASTKEY()#27
		if update()
			stor .t. to M.CAMBIO
			stor nul TO respuesta
			M.MARCA=IIF(empty(ELIMAR(" del Producto",7,col1)),"",LEFT(MI1.TEXTO2,2))
			IF !empty(M.MARCA)
				stor .t. to M.CAMBIO
				ACTI WIND win
				nada=MI1.TEXTO1
				ACTI WIND win
				SELE mer
				@ 7,COL1 GET nada
				CLEA GETS
			else
				stor .f. to sigue
			endif
		endif
		if sigue
			@ 8,col1 get m.medidas
			read
            STORE UPDATE() TO M.CAMBIO
			*** PROVEEDORES
			SELE PRO
			SET ORDER TO 1
			rele nada
			dime nada[3],nad[3]
			nada[1]=m.pro1
			nada[2]=m.pro2
			nada[3]=m.pro3
			for a=1 to 3
				nad[a]=iif(seek(nada[a]),pro.proveedor,space(30))
				@ 9+a,col get nad[a]
			NEXT
			clea gets
			STORE .F. TO M.CAMBIOPA
			for a=1 to 3
				@ 9+a,col get nad[a]
				read
				IF LASTKEY()#27
					if update()
						stor nul to respuesta
						nada[a]=IIF(empty(ELIpro(" del Producto",8+a,COL)),"",pro.procod)
						acti wind win
						xx=pro.proveedor
						@ 9+a,col get xx
						clea gets
						stor .t. to M.CAMBIO,M.CAMBIOPA
					endif
				ELSE
					STORE .F. TO SIGUE
					EXIT
				ENDIF
			NEXT
			IF M.CAMBIOPA
				m.pro1=nada[1]
				m.pro2=IIF(NADA[1]#nada[2],NADA[2],'')
				M.pro3=IIF(!EMPTY(NADA[3]) .AND. NADA[3]#NADA[2] .AND. NADA[3]#NADA[1],NADA[3],'')
			ENDIF
		else
			stor .f. to sigue
		endif
		if sigue
			sele mi1
			set ORDER TO TAG CARCOD
			rele nada
			dime nada[3]
			nada[1]=m.car1
			nada[2]=m.car2
			nada[3]=m.car3
			for a=1 to 3
				nad[a]=IIF(!EMPTY(SAYMIX1(NADA[A],'CARCOD')),LEFT(MI1.TEXTO1,20),space(20))
				@ 13+a,col get nad[a]
			NEXT
			clea gets
			STORE .F. TO M.CAMBIOPA
			for a=1 to 3
				@ 13+a,col get nad[a]
				read
				IF LASTKEY()#27
					if update()
						stor nul to respuesta
						nada[a]=IIF(empty(ELICAR(" del Producto",8+a,COL)),"",LEFT(MI1.TEXTO2,2))
						acti wind win
						xx=mi1.texto1
						@ 13+a,col get xx
						clea gets
						stor .t. to M.CAMBIO,M.CAMBIOPA
					endif
				ELSE
					STORE .F. TO SIGUE
					EXIT
				ENDIF
			NEXT
			IF M.CAMBIOPA
				m.CAR1=nada[1]
				m.CAR2=IIF(NADA[1]#nada[2],NADA[2],'')
				M.CAR3=IIF(!EMPTY(NADA[3]) .AND. NADA[3]#NADA[2] .AND. NADA[3]#NADA[1],NADA[3],'')
			ENDIF
			if sigue
				=XSEEK(M.GRUPO,'MIX','GRUCOD')
				nada=mix.texto1
				@ 18,COL GET NADA
				read
				if update()
					M.GRUPO=IIF(empty(ELIGRU(" del Producto",18,col)),"",LEFT(MIX.TEXTO2,2))
					acti wind win
					IF !empty(M.GRUPO)
						stor .t. to M.CAMBIO
						NADA=MIX.TEXTO1
						@ 18,COL GET NADA
						CLEA GETS
					else
						stor .f. to sigue
					endif
				endif
				if sigue
					=XSEEK(M.LINEA,'MIX','LINCOD')
					nada=mix.texto1
					@ 19,COL GET NADA
					read
					if update()
						stor nul TO RESPUESTA
						M.LINEA=IIF(empty(ELILIN(" del Producto",19,col)),"",LEFT(MIX.TEXTO2,2))
						acti wind win
						IF !empty(M.LINEA)
							stor .t. to M.CAMBIO
							NADA=MIX.TEXTO1
							@ 19,COL GET NADA
							clea gets
						else
							stor .f. to sigue
						endif
					endif
					if sigue
						nada=iif(XSEEK(M.ALIM,'MI1','ALICOD'),mi1.texto1,space(20))
						@ 20,COL GET NADA
						read
						if update()
							stor nul TO RESPUESTA
							M.ALIM=IIF(empty(ELIALI(" del Producto",20,col)),"",LEFT(MI1.TEXTO2,2))
							acti wind win
							IF !empty(M.ALIM)
								NADA=MI1.TEXTO1
								stor .t. to M.CAMBIO
								@ 20,COL GET NADA
								CLEA GETS
							else
								stor .f. to sigue
							endif
						endif
						m.temporada=qtem(M.TEMPORADA)
						@ 21,col get m.temporada PICT "@M Primavera,Verano,Oto¤o,Invierno,Todas"
						read
						sele mix
						set ORDER TO TAG COLTEX
						nada=iif(XSEEK(M.COLOR,'MIX','COLCOD'),mix.texto1,space(20))
						@ 22,COL GET NADA
						read
						if update()
							stor nul TO RESPUESTA
							M.COLOR=IIF(empty(ELICOL(" del Producto",22,col)),"",LEFT(MIX.TEXTO2,2))
							acti wind win
							IF !empty(M.COLOR)
								stor .t. to M.CAMBIO
								NADA=MIX.TEXTO1
								@ 22,COL GET NADA
								CLEA GETS
							else
								stor .f. to sigue
							endif
						endif
						if sigue
							nada=iif(m.jean,'SI','NO')
							@ 23,col get nada ;
							PICT "@M SI,NO" ;
							MESS "[BARRA ESPACIADORA] para cambiar de Opci¢n"
							read
							M.CAMBIO=IIF(M.CAMBIO,M.CAMBIO,UPDATE())
							rele wind win
							if M.CAMBIO
							    M.JEAN=(M.NADA="SI")
							    =AGRABAR1("MER",FF)
							endif
						endif
					endif
				endif
			endif
		endif
	ENDIF
	ENDIF
	DEAC WIND ALL
else
	=iaudI()
endif
UNLO IN MER
return MEN_LIN(BOTOM)

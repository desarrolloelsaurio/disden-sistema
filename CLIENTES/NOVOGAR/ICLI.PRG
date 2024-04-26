********************************************************************************
*-- Programa: IPER.PRG
*-- Fecha   : 06/27/91
*-- Version : G. REINER
*-- Notas   : INGRESA CLIENTES / VERSION BALCALA
*--           Modificaci¢n GOYO 05-10-92 01:42am
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
ON KEY LABEL Ctrl+F3 DO THELAST WITH 'PER','Base de Clientes',50,'codcli','CODIGO CLIENTE','CODCLI','CLIENTE','DENOMINACION CLIENTE','CLIENTE'
	SELE PER
	STOR " Ingreso Cliente - " TO me1
	STOR 23 TO COL
	stor nul TO kok
	=movewin(iclir,iclic,iclir+iclila,iclic+iclian,'win'," Ingreso Cliente ")
	DO WHIL .T.
		ACTI WIND WIN
		CLEA
		SELE PER
		SCAT MEMV BLAN
		DO mcli WITH .F.
		@ 1,COL GET m.codcli ;
        PICT IIF(GETENV("EQUIPO")='ARROYO',"O!!!!!!!!!","I!!!!!!!!!");
		VALID !YAESTABA(M.CODCLI,'PER','CODCLI');
		ERROR 'Cliente '+alltrim(m.codcli)+' Existe';
		MESS "Ingrese el C¢digo del Cliente - [ESC] para Men£ - [Ctrl F3] Info"
		READ
		IF LASTKEY()#27
			IF !EMPTY(m.codcli)
				ACTI WIND win
				@ 2,COL GET m.cliente PICTURE '@!';
				VALID !YAESTABA(M.CLIENTE,'PER','CLIENTE',.T.);
				ERROR 'Cliente '+alltrim(m.cliente)+' Existe';
				MESS "Ingrese el Nombre del Cliente"
				@ 3,COL GET m.enccom PICTURE '@X' MESS "Ingrese el Nombre del Encargado de Compras"
				@ 4,COL GET m.domicilio PICTURE '@X' MESS "Ingrese el Domicilio del Cliente"
				READ
				IF !EMPTY(m.cliente) .and. lastkey()#27
					stor SPACE(20) TO nada
					@ 5,COL GET nada MESS "Ingrese la Localidad"
					CLEAR GETS
					stor nul TO respuesta
					DO WHILE EMPTY(eliciu("del Cliente",5,COL))
						ACTI WIND win
					ENDDO
					m.localidad=MIX.NU1
					nada=ALLTRIM(mix.texto1)
					nada1="("+ALLTRIM(SINULT(mix.texto2,2))+")"
					nada2=STR(mix.nu2,4)
					=XSEEK(RIGHT(mix.TEXTO2,2),'mix','PRVCOD')
					nada3=ALLTRIM(mix.texto1)
					ACTI WIND win
					@ 5,COL GET nada
					@ 5,COL+21 SAY "Pcia.:" COLO SCHE 3
					@ 5,COL+28 GET nada3
					@ 6,COL+21 SAY "C.P.:" COLO SCHE 3
					@ 6,COL+28 GET nada2
					@ 6,13 GET nada1
					CLEAR GETS
					SELE PER
					stor "  " TO nada
					@ 6,COL GET m.telefonos PICTURE "@!" MESS "Ingrese el Tel‚fono del Cliente"
					@ 7,COL GET m.fax PICTURE "@!" MESS "Ingrese el Fax del Cliente"
					READ
					@ 8,COL GET nada MESS "Ingrese la Condici¢n de IVA del Cliente"
					CLEAR GETS
					stor nul TO respuesta
					DO WHILE empty(eliiva(" del Cliente",8,COL))
						acti wind win
					ENDDO
					stor respuesta TO m.condiva
					stor xaciva[m.condiva,1] TO nada
					ACTI WIND win
					@ 8,COL GET nada
					CLEAR GETS
					SELE PER
					stor " " TO nada
					@ 9,COL GET m.nroiva PICTURE "XXXXXXXXXXXXXXX" MESS "Ingrese el N£mero de IVA del Cliente"
					@ 10,COL GET m.montomax PICTURE "99999999999.99" MESS "Ingrese el Monto M ximo para el Cliente"
					@ 11,COL GET m.descuento PICTURE "XXXXXXXXXX" MESS "Ingrese el Descuento para el Cliente"
					READ
					stor nul TO respuesta
					DO WHILE empty(elilis(" del Cliente",12,COL))
						ACTI WIND win
					ENDDO
					IF respuesta=1
						nada1=xalis1
					ELSE
						IF respuesta=2
							nada1=xalis2
						ELSE
							IF respuesta=3
								nada1=xalis3
							ELSE
								nada1=xalis4
							ENDIF
						ENDIF
					ENDIF
					ACTI WIND win
					@ 12,COL GET nada1 PICTURE "@!" RANGE 1,4 MESS "Ingrese el Precio para el Cliente"
					m.precio=respuesta
					CLEAR GETS
					@ 13,COL GET nada
					CLEAR GETS
					stor nul TO respuesta
					DO WHILE EMPTY(elizon(" del Cliente",13,COL))
					ENDDO
					stor LEFT(MIX.TEXTO2,2) TO m.zona
					stor ALLTRIM(mix.texto1) TO nada
					@ 13,COL GET nada
					CLEAR GETS
					IF confirma(" los Datos Ingresados",.T.,18,nul)
						=AGRABAR('PER')
						=iaud(ALLTRIM(M.CODCLI)+'-'+M.CLIENTE)
					ENDIF
				ELSE
					=RELEWIN('win')
					EXIT
				ENDIF
			ELSE
				=RELEWIN('win')
				EXIT
			ENDIF
		ELSE
			=RELEWIN('win')
			EXIT
		ENDIF
	ENDDO
ELSE
	=iaudI()
ENDIF
ON KEY LABEL Ctrl+F3
=MEN_LIN(BOTOM)
RETURN


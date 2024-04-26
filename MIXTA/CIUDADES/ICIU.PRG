********************************************************************************
*-- Programa: ICIU.PRG
*-- Fecha   : 06/12/91 12:44pm
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESA CIUDADES
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE GRABANDO PADC(' Grabando los datos ingresados - Espere por Favor ',80,"°")
ulpr=hora_ulp(program())
if cheqseg()
	SELE mix
	SET ORDER TO TAG CIUTEX
	STOR " Ingreso Ciudades - " TO me1
	STOR 25 TO COL
	stor nul TO kok
	=moveCENT(0,0,8,60,"win"," Ingreso Ciudades ")
	DO WHILE .T.
		SCAT MEMV BLAN
		ACTI WIND WIN
		=mciu(.F.)
		@ 1,COL GET m.texto1 PICT '@!' ;
		valid !yaestaba(m.texto1,alias(),'ciutex',.T.);
		error 'CIUDAD EXISTENTE';
		MESS me1+'[ENTER] para Men£'
		READ
		@ 2,COL GET m.NU1 PICT '@Z 999999';
		valid !yaestaba(m.NU1,alias(),'ciuCOD',.f.);
		error 'CODIGO DE CIUDAD EXISTENTE';
		MESS me1+'C¢digo de la Ciudad - [ESC] para Men£'
		READ WHEN LAST()#27 .AND. !EMPTY(M.TEXTO1)
		IF LAST()#27 .AND. !EMPTY(M.TEXTO1) .AND. !EMPTY(M.NU1)
			stor nul TO respuesta
			DO WHILE !eliprv(" de la Ciudad",3,COL)
				stor nul TO respuesta
			ENDDO
			M.TEXTO2=SINULT(M.TEXTO2,2)+LEFT(MIX.TEXTO2,2)
			nada=mix.texto1
			acti wind win
			@ 3,COL GET nada
			CLEAR GETS
			SET ORDER TO TAG CIUTEX
			@ 4,COL GET m.nu2 PICT '@Z 9999999' MESS me1+'N§ C¢digo Postal'
			m.nada=left(m.texto2,5)
			@ 5,COL GET m.nada MESS me1+'Caracter¡stica Telef¢nica'
			READ
			m.texto2=nada+substr(m.texto2,6)
			ACTI SCRE
			M.filtro='C'
			=AGRABAR("MIX")
			=iaud(m.texto1)
		ELSE
			EXIT
		ENDIF
	ENDDO
	=RELEWIN('win')
ELSE
	=iaudI()
ENDIF
RETURN men_lin(botom)

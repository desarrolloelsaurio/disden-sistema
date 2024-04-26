**********************************
*-- Programa: CCIU.PRG
*-- Fecha   : 06/12/91 03:04pm
*-- Version : R. 'EL BATA'
*-- Notas   : CORRIGE CIUDADES
**********************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE GRABANDO PADC(' Grabando los datos ingresados - Espere por Favor ',80,"°")
DO CCIU.SPR
RETURN


*** ANTERIOR
STOR RECNO() TO ff
registro=STR(ff)
ulpr=hora_ulp(program())
if cheqseg()
	=moveCENT(0,0,8,60,"win"," Correcci¢n Ciudades ")
	SELE mix
	=LOCK() .OR. LOK("MIX")
		SCAT MEMV
		STOR " Correcci¢n Ciudades - " TO me1
		STOR 25 TO COL
		STOR .F. TO cambio
		=mciu(.t.)
		@ 1,COL GET m.texto1 PICT "@!" ;
		valid !yaestaba(m.texto1,alias(),'ciutex',.T.,.T.,.t.);
		error 'CIUDAD EXISTENTE';
		MESS me1+'[ESC] para Men£'
		READ
		store update() to cambio
		@ 2,COL GET m.NU1 PICT '999999' ;
		valid !yaestaba(m.NU1,alias(),'ciuCOD',.F.,.T.,.t.);
		error 'CODIGO DE CIUDAD EXISTENTE';
		MESS me1+'C¢digo de la Ciudad - [ESC] para Men£'
		READ WHEN LAST()#27 .AND. !EMPTY(M.TEXTO1)
		IF LASTKEY()#27
			store iif(cambio,cambio,update()) to cambio
			NADA=SAYMIX(RIGHT(m.TEXTO2,2),"PRVCOD")
			ACTI WIND win
			@ 3,COL GET nada MESS 'UNA TECLA y [ENTER] modifica'
			READ
			store iif(cambio,cambio,update()) to cambio
			IF update()
				SET ORDER TO TAG PRVTEX
				stor nul TO respuesta
				DO WHILE EMPTY(eliprv(" de la Ciudad",3,COL))
					stor nul TO respuesta
				ENDDO
				M.TEXTO2=SINULT(M.TEXTO2,2)+LEFT(MIX.TEXTO2,2)
				ACTI WIND win
				nada=mix.texto1
				@ 3,COL GET nada
				clea gets
				stor .T. TO cambio
			ENDIF
			SET ORDER TO TAG CIUTEX
			@ 4,COL GET m.nu2 PICT '@Z 9999' MESS me1+'N§ C¢digo Postal'
			m.nada=left(m.texto2,5)
			@ 5,COL GET m.nada MESS me1+'Caracter¡stica Telef¢nica'
			READ
			m.texto2=m.nada+subst(m.texto2,6)
			store iif(cambio,cambio,update()) to cambio
			IF cambio
				=men_lin(grabando)
				SELE mix
				GOTO ff
				GATH MEMV
				=repuse()
				=iaud(m.texto1)
			ENDIF
		UNLO IN mix
	ENDIF
	=RELEWIN("win")
ELSE
	=iaudI()
ENDIF
RETURN men_lin(botom)

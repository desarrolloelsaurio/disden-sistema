* зд PROGRAMA ддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
* Ё  APLICACION: MUESTRA NOTAS DE PEDIDO                                     Ё
* Ё    ARCHIVO: MPED.PRG                                                     Ё
* Ё       AUTOR: G. REINER                                                   Ё
* Ё Date created: 01-12-93                                                   Ё
* Ё Time created: 03:06:55pm                                                 Ё
* Ё    Copyright: 1993 by SISTEMAS INFORMATICOS S.R.L.                       Ё
* юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
FUNCTION MPED
	=WIN1()
	=CABPAN1()
	REBLA=REMIMASK(.T.,.T.)
	CX=C6+6
	=FOR_SAY("╨",7,22,CX)
	@ 7,CX SAY "к"
	@ 9,CX SAY "н"
	@ 23,CX SAY "й"
	@ 8,C6 SAY "ENTREG"
	@ 8,CX+1 SAY " PEND "
	@ 6,13 GET M.PEDIDO
	=XSEEK(M.CODCLI,'PER','CODCLI')
	m.codcli=PER.codcli
	m.zona =PER.zona
	m.clipre=PER.precio
	m.cliiva=PER.condiva
	@ 1,1 SAY padr(Alltrim(PER.codcli)+" "+Alltrim(PER.cliente),40)
	@ 2,1 SAY Alltrim(PER.domicilio)+" T.E."+Alltrim(PER.telefonos)
	=XSEEK(PER.localidad,"MIX",'ciucod')
	nada=mix.texto1
	=XSEEK(RIGHT(mix.TEXTO2,2),"MIX",'PRVCOD')
	@ 3,1 SAY Alltrim(nada)+" "+Alltrim(mix.texto1)
	@ 4,1 SAY Alltrim(xaciva(PER.condiva,1))+" "+Alltrim(PER.nroiva)
	=XSEEK(M.CODVIA,'VIA','CODVIA')
	m.codvia=via.codvia
	acti wind win
	@ 1,54 SAY LEFT(VIA.VIAJANTE,24)
	=XSEEK(M.CONDPAGO,'MIX','PAGCOD')
	m.condpago=LEFT(MIX.TEXTO2,2)
	stor mix.texto1 TO nada
	NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
	NADA1=ALLTRIM(STRTRAN(NADA,'-000',SPACE(4)))
	@ 2,57 GET nada1
	@ 4,62  GET m.fechaem
	CLEA GETS
	REN=10
	SELE PEX
	IF SEEK(M.PEDIDO)
		SCAN WHILE PEX.PEDIDO=M.PEDIDO
			@ ren,c1 SAY LEFT(PEX.Articulo,10)
			=XSEEK(PEX.ARTICULO,'MER','ARTICULO')
			@ ren,c2 SAY LEFT(mer.merca,30)
			@ ren,c5 SAY PEX.unit1*PEX.CANTIDAD PICT "9999999.99"
			IF MER.DISCRIM
				@ ren,c3 GET PEX.cantidad PICT '99999.99'
				@ REN,C6 GET PEX.PESOENT PICT '99999'
				@ REN,CX+1 SAY PEX.CANTIDAD-PEX.PESOENT PICT '99999'
			ELSE
				@ REN,C6 GET PEX.CANTENT PICT '99999'
				@ ren,c3 GET PEX.cantidad PICT '99999'
				@ REN,CX+1 SAY PEX.CANTIDAD-PEX.CANTENT	PICT '99999'
			ENDIF
			REN=REN+1
		ENDSCAN
	ENDIF
	CLEA GETS
RETURN .T.

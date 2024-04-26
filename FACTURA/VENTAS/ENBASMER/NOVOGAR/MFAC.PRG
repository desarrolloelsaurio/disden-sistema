***************************************
*-- Programa: MFAC.PRG
*-- Fecha   : 01-19-92 07:57pm
*-- Versi¢n : G. REINER
*-- Notas   : MUESTRA FACTURA EMITIDA
**************************************
PARAMETER MUESTRA
STORE HORA_ULP(PROGRAM()) TO ULPR
=CHEQSEG()
#DEFINE NUL  0                                   && NUL
#DEFINE BOTOM "  "+repl("°",78)                  && BOTOM
#DEFINE PICU  "99999999999.99"
#DEFINE PICU1 "99999999"
#DEFINE PICU2 "999.99"
STOR NUL TO kok
=win1()
pag=1
=cabpan()
SELE MER
SET ORDER TO tag articulo
rebla=factmask(.t.)
c1=1
c2=18
c3=36
c4=44
c5=53
c6=65
DIME carga[3]
STOR NUL TO carga,pretot
SELE fac
IF FAC.CODCLI#"ANULADA"
	SCAT MEMV
	=xseek(fac.codcli,"PER","codcli")
	m.clipre=PER.NU1
	m.cliiva=PER.condiva
	ACTI WIND win
	@ 1,1 SAY ALLTRIM(PER.codcli)+" "+ALLTRIM(PER.cliente)
	@ 2,1 SAY ALLTRIM(PER.domicilio)+" T.E."+ALLTRIM(PER.telefono)
	NADA=SAYMIX(PER.localidad,"ciucod")
	=xseek(SUBS(mix.TEXTO2,14,2),"mix","prvcod")
	@ 3,1 SAY ALLTRIM(nada)+" "+ALLTRIM(mix.texto1)
	@ 4,1 SAY ALLTRIM(SAYMIX(PER.CONDIVA,"IVACOD"))+" "+ALLTRIM(PER.nroiva)
	@ 5,13 get janname
	@ 6,13 get m.factura
	@ 1,54 SAY SAYGRL(M.CODVIA,"VIA","CODVIA","VIA.CODVIA")
	STOR SAYMIX(M.CONDPAGO,"PAGCOD") TO nada
	nada1=MIX.TEXTO1
	@ 2,57 GET nada1
	STOR nada1 TO m.conpago
	STOR {01/01/80} TO nada1
	STOR DATE() TO nada2,fechaem
	STOR xauss TO nada9
	@ 4,62 GET fac.fechaem
	nn=iif(fac.moneda=left(xauss,1),xauss,xadols)
	@ 5,70 GET nn
	STOR fac.cotiz TO nada10
	@ 6,56 GET nada10 PICT picu
	clea gets
	STOR NUL TO casos
	stor 90 TO t1
	stor RECNO() TO regi
	STOR 10 TO ren
	SELE FAX
	SET ORDER TO TAG FACTURA
	=SEEK(FAC.FACTURA)
	SCAN whil FAX.factura=fac.factura
		@ ren,1 say left(FAX.articulo,10)
		@ ren,12 say SAYGRL(FAX.ARTICULO,"mer","articulo","mer.merca")
		@ ren,45 say str(fax.cantidad,4)
		IF LEFT(FAC.FACTURA,1)="A"
			@ ren,52 say str(fax.GRAVADO,10,2)
			xt=fax.GRAVADO*fax.cantidad
		ELSE
			@ ren,52 say str(fax.MONTOUNI,10,2)
			xt=fax.MONTOUNI*fax.cantidad
		ENDIF
		@ ren,64 say str(xt,12,2)
		REN=REN+1
		IF REN>22
			IF MUESTRA
				EXIT
			ENDIF
			IF MEN_LIN("[TECLA] PARA CONTINUAR - [ESC] PARA FIN",.F.,.F.,.F.,.T.)=27
				EXIT
			ELSE
				=MEN_LIN(BOTOM)
				=FACTMASK(.F.)
				REN=10
			ENDIF
		ENDIF
	ENDS
	IF LASTKEY()#27
		IF !MUESTRA
			IF MEN_LIN("[TECLA] PARA CONTINUAR CON TOTALES - [ESC] PARA FIN",23,0,78,.T.,.T.)#27
				=FACTMASK(.F.)
				sele fac
				ren=21
				@ 22,15 say "TOTAL:"
				@ 22,62 SAY STR(MONTONET,14,2)
				IF !EMPTY(MONTOOT2)
					@ REN,15 say "NO INSCR:"
					@ REN,62 SAY STR(MONTOOT2,14,2)
					REN=REN-1
				ENDIF
				IF !EMPTY(MONTOIVA)
					@ REN,15 say "INSCRIPTO:"
					@ REN,62 SAY STR(MONTOIVA,14,2)
					REN=REN-1
				ENDIF
				IF !EMPTY(DESCUENTO)
					IF LEFT(FACTURA,1)="A"
						@ REN,15 say "BRUTO"
						@ REN,62 SAY STR(MONTO,14,2)
						REN=REN-1
					ENDIF
					@ REN,15 say "DESCUENTO"
					@ REN,62 SAY STR(0-DESCUENTO,14,2)
					REN=REN-1
				ENDIF
				IF !EMPTY(MONTO)
					@ REN,15 say "GRAVADO"
					@ REN,62 SAY STR(MONTOBRU,14,2)
					REN=REN-1
				ENDIF
				=INKEY(NUL,"HM")
			ENDIF
		ENDIF
	ENDIF
	=IIF(MUESTRA,.T.,RELEWIN("WIN"))
ELSE
	=CARTEL("LA FACTURA HA SIDO ANULADA",;
		"EL DIA "+DTOC(FAC.FECHA),;
		"ES IMPOSIBLE VERLA",;
		"PULSE [ENTER] PARA CONTINUAR")
ENDIF
RETURN men_lin(botom)

********************************************************************************
*-- Programa: ipreX.prg
*-- Fecha   : 09/10/91 01:41pm
*-- Version : G. REINER
*-- Notas   : globaliza precios un numero de plano
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DO WHILE .T.
		=movewin(6,10,15,62,'win'," Generaliza Precios ")
		PCU=''
		STOR NUL TO costorea,cost
		STORE 30 TO COL
		STORE 30 TO col1
		STORE xap1 TO preci1
		STORE xap2 TO preci2
		STORE xap3 TO preci3
		STORE xap4 TO preci4
		IF QPRE(1)
			store nul to respuesta
			if !empty(elimer("Ingreso Precios",-1,1))
				rtcl=left(mer.articulo,10)
				=men_lin("Calculando")
				=flock("MER") .OR. LOK("MER")
				SET ORDER TO TAG ARTICULO
				repl costoreal with m.costorea;
				costo with m.cost;
				precio1 with m.preci1;
				precio2 with m.preci2;
				precio3 with m.preci3;
				precio4 with m.preci4;
				for left(articulo,10)=rtcl
					UNLO IN MER
					=men_lin(botom)
					=iaud(mer.articulo+'-'+str(m.cost))
					acti wind win
				else
					exit
				endif
			else
				exit
			endif
		enddo
	else
		=iaudi()
	endif
	IF !EMPTY(WONTOP())
		=RELEWIN(WONTOP())
	ENDIF
	=MEN_LIN(BOTOM)
return

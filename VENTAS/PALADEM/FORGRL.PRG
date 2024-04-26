**********************************************
*-- Programa: FORGRL
*-- Fecha   : 01-12-93 02:10pm
*-- Versi¢n : G. REINER
*-- Notas   : INGRESO GENERAL DE FORMULARIOS
**********************************************
FUNCTION FORGRL
	PARAMETER FORMULARIO,PUXTERO,BASE,INDICE,CARACTER
	DO WHILE .T.
		STORE .F. TO SALIDA
		save scre to shit
		STOR jannro TO m.marca,nadmar
		nada=mix.texto1
		@ 5,13 SAY janname
		M.LACOSA=GETDOC((JANNRO-1)*20+PUXTERO)
		@ 6,13 GET M.LACOSA
		READ
		if !EMPTY(M.LACOSA) .AND. !xSEEK(M.LACOSA,BASE,INDICE) .and. Last()#27
			IF CARACTER
				NADPED=Q_FAC(M.LACOSA)
			ELSE
				NADPED=M.LACOSA
			ENDIF
			STOR NUL TO respuesta
			sele PED
			scat memv blan
			M.LACOSA=NADPED
			IF !empty(elicli(" - [ESC] para Salir",2,1))
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
				SELE via
				STOR NUL TO respuesta
				IF !empty(elivia("",1,55))
					m.codvia=via.codvia
					acti wind win
					@ 1,54 SAY m.codvia
					if xSEEK(m.codvia+JANCOD+m.zona,'VIX','VIAJADAT')
						SELE mix
						STOR NUL TO respuesta
						IF !empty(elipag("",6,13))
							m.condpago=LEFT(TEXTO2,2)
							stor mix.texto1 TO nada
							NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
							NADA1=ALLTRIM(STRTRAN(NADA,'-000',SPACE(4)))
							acti wind win
							@ 2,57 GET nada1
							clea GETS
							STOR nada1 TO m.conpago
							STOR {} TO nada1
							STOR DATE() TO nada2,fechaem
							STOR xauss TO nada9
							STOR "@M "+Alltrim(xauss)+","+Alltrim(xadols) TO nn
							@ 4,62  GET m.fechaem PICT "@D" RANGE nada1,nada2;
							MESS "Fecha de emisi¢n del PEDIDO - [ESC] para Salir"
							READ
							IF LASTKEY()#27
								@ 5,62 GET nada9 PICT nn MESS "Moneda"
								READ
								STOR xacotiz TO nada10
								@ 6,56 GET nada10 PICT picu MESS "Cotizaci¢n de la fecha - [ESC] para Salir"
								READ
								STORE .T. TO SALIDA
								exit
							ENDI                               && COND. PAGO
						ENDIF
					ELSE
						DO cartel2 WITH "VIAJANTE","NO","AUTORIZADO","CORRIJA E INTENTE NUEVAMENTE"
						STORE .F. TO SALIDA
					ENDI
				ENDIF                                    &&ELIVIA
			ENDIF                                      &&ELICLI
		ELSE                                         &&PEDIDO EXISTE
			IF LAST()#27
				if found()
					=cartel2(formulario+" "+IIF(TYPE("M.LACOSA")="C",M.LACOSA,STR(M.LACOSA)),;
					"EXISTE EN EL ARCHIVO",;
					"POR FAVOR",;
					"VERIFIQUE Y REINTENTE")
				endif
			ELSE
				EXIT
			ENDIF
		ENDIF
		rest scre from shit
	ENDDO
RETURN SALIDA

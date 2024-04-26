********************************************************************************
*-- Programa: IPLA.PRG
*-- Fecha   : 12/22/91
*-- Version : V.LEEGSTRA
*-- Notas   : INGRESA PLANILLA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	stor " Ingreso Datos de la Planilla - " to me1
	stor 0 to kok,respuesta
	nacotiz=xacotiz
	sigue=.T.
	sele mer
	stor padl(LEFT(CHRTRAN(mer.palpopup," ",""),19),19) to napalpo
	store mer.rubro+mer.variedad+mer.calidad to namerca
	stor {} to nafecha
	stor xauss to namoneda
	define window win from 0,0 to 23,79 titl " Ingreso Planilla " none color sche 8
	acti wind win
	A="Ú"+REPLICATE("Ä",19)+"Â"+REPLICATE("Ä",12)+"Â"+REPLICATE("Ä",12)+"Â"+REPLICATE("Ä",12)+"Â"+REPLICATE("Ä",6)+"Â"+REPLICATE("Ä",11)+"¿"
	B="³"+REPLICATE(' ',19)+"³"+REPLICATE(' ',12)+"³"+REPLICATE(' ',12)+"³"+REPLICATE(' ',12)+"³"+REPLICATE(' ',6)+"³"+REPLICATE(' ',11)+"³"
	C="Ã"+REPLICATE("Ä",19)+"Å"+REPLICATE("Ä",12)+"Å"+REPLICATE("Ä",12)+"Å"+REPLICATE("Ä",12)+"Å"+REPLICATE("Ä",6)+"Å"+REPLICATE("Ä",11)+"´"
	D="À"+REPLICATE("Ä",19)+"Á"+REPLICATE("Ä",12)+"Á"+REPLICATE("Ä",12)+"Á"+REPLICATE("Ä",12)+"Á"+REPLICATE("Ä",6)+"Á"+REPLICATE("Ä",11)+"Ù"
	@ 0,0 SAY A
	@ 1,0 SAY B
	@ 1,1  SAY "MERCADERIA"
	@ 1,21 SAY "CANTIDAD"
	@ 1,34 SAY "PRECIO UNIT."
	@ 1,47 SAY "PRECIO TOTAL"
	@ 1,60 SAY "REMESA"
	@ 1,67 SAY left(upper(biaja),11)
	@ 2,0 SAY C
	FOR ren=3 TO 22
		@ ren,0 SAY B
		ENDFOR
		@ ren,0 SAY D
		REN=3
		c1=1
		c2=21
		c3=34
		c4=47
		c5=60
		c6=67
		define window win1 from 9,10 to 15,69 color sche 8
		acti wind win1
		@ 1,5 say "Fecha de la operaci¢n:    " get nafecha
		@ 2,5 say "Moneda en que se factura: " get namoneda
		clea gets
		nn="@M "+xauss+","+xadols
		@ 1,32 get nafecha picture "@D" mess "Fecha de la operaci¢n - [ESC] para Salir"
		read
		if lastkey()#27 .and. !empty(nafecha)
			@ 2,32 get namoneda picture nn mess "Moneda en que se factura"
			read
			if namoneda=xadols
				@ 3,5 say "Cotizaci¢n: " get nacotiz picture "99999999999.99";
				mess "Cotizaci¢n del d¡a - [ESC] para Salir"
				read
				if lastkey()=27
					sigue=.F.
					rele wind win
				endif
			endif
		else
			sigue=.f.
			rele wind win
		endif
		rele wind win1
		do whil sigue
			stor 0 to nacanti,naunita
			acti wind win
			@ ren,c1 get napalpo mess "[Tecla] y [ENTER] para elegir - [ESC] para salir "
			read
			if lastkey()#27
				if update() .or. empty(napalpo)
					SELE MER
					store 0 to respuesta
					napalpo=iif(elimer("de la Mercader¡a",ren,c1)=0,0,padl(LEFT(CHRTRAN(mer.palpopup," ",""),19),19))
					store mer.rubro+mer.variedad+mer.calidad to namerca
				endif
				acti wind win
				@ ren,c1 get napalpo
				clear gets
				@ ren,c2 get nacanti picture "999999999.99" mess "Cantidad de Bultos - Con 0 Salir"
				read
				if !empty(nacanti) .and. lastkey()#27
					@ ren,c3 get naunita picture "999999999.99" mess "Precio unitario - Con 0 Salir"
					read
					if !empty(naunita) .and. lastkey()#27
						naequiva=iif(namoneda=xadols,naunita,naunita/nacotiz)
						nada=str(nacanti*naunita,12,2)
						@ ren,c4 get nada
						clea gets
						sele rem
						set order to 2
						nada=namerca+" "
						if seek(nada)
							narem=rem.remesa
							napro=rem.Proveedor
							naprot=.T.
							nakgbul=rem.kgbulto
						else
							store 0 to narem,nakgbul
							napro="NO existe"
							naprot=.F.
						endif
						*              sele pro
						*              set order to 1
						*              naprove=iif(seek(napro),left(pro.Proveedor,11),space(11))
						@ ren,c5 get narem picture "999999"
						*              @ ren,c6 get naprove
						clea gets
						sele via
						navende=left(via.viajante,11)
						store via.codvia to nacodvia
						@ ren,c6 get navende mess "[Tecla] y [ENTER] para elegir - [ESC] para salir "
						read
						if lastkey()#27
							if update() .or. empty(navende)
								SELE via
								store 0 to respuesta
								navende=iif(elivia("de la Mercader¡a",ren,c6)=0,0,left(via.viajante,11))
								store via.codvia to nacodvia
							endif
							acti wind win
							@ ren,c6 get navende
							clear gets
							if confirma(" los Datos Ingresados",.t.,20,0)
								KOK=KOK+1
								ACTI SCRE
								@ 23,0 say padc(' Grabando los datos ingresados ',80,'*') colo sche 19
								do flok with "pla"
								sele pla
								appe blan
								scat memv blan
								m.merca=namerca
								m.cantidad=nacanti
								m.punitario=naunita
								m.codvia=nacodvia
								m.pago=.T.
								gath memv
								do repuse
								unlo in pla
								do flok with "kar"
								sele kar
								appe blan
								scat memv blan
								m.fechaop=nafecha
								m.articulo=namerca
								m.opk=2
								m.docref="RM"
								m.nrodocref=narem
								m.cliente=napro
								m.Proveedor=naprot
								m.unitario=naunita
								m.detalle="Venta de mercader¡a"
								m.salida=nacanti
								m.kilos=nakgbul
								gath memv
								do repuse
								unlo in kar
								do flok with "caj"
								sele caj
								appe blan
								scat memv blan
								m.caja=0
								m.fechaop=nafecha
								m.monto=naunita
								m.moneda=namoneda
								m.equivale=naequiva
								gath memv
								do repuse
								unlo in caj
								clea
								acti wind win
								@ 22,0 say B
								ren=iif(ren<22,ren+1,3)
							else
								@ ren,0 say B
							endif
						else
							@ ren,0 say B
						endif
					else
						@ ren,0 say B
					endif
				else
					@ ren,0 say B
				endif
			else
				rele wind win
				exit
			endif
		enddo
		rele memo like na*
		if kok#0
			do iaud with 'ING '+alltrim(str(kok))+' PLANILLA'
		endif
	else
		=IAUDI()
	endif
	=MEN_LIN(BOTOM)
return

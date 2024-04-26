********************************************************************************
*-- Programa: AREM.PRG
*-- Fecha   : 01/28/92
*-- Version : V.LEEGSTRA
*-- Notas   : DA POR AGOTADA UNA REMESA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=iaud('INGRESO '+ulpr)
	=movewin(10,10,15,69,'win1',"Remesa que se dar  por Agotada ")
	ACTI WIND win1
	ff=""
	@ 1,1  SAY "Proveedor:"
	@ 2,1  SAY "N§ Remesa:"
	stor 0 to kok,respuesta,naremes
	sele pro
	set order to tag proveedor
	naprove=iif(empty(elipro(" de la Remesa a Corregir- [ESC] para Salir ",1,12)),0,pro.procod)
	if !empty(naprove) .and. lastkey()#27
		acti wind win1
		@ 1,12 get pro.proveedor
		napro=left(pro.proveedor,15)
		clea gets
		@ 2,12 get naremes pict "99999999" mess "Ingrese el N§ de la Remesa a dar por Agotada"
		read
		sele rem
		set order to tag REMESA
		if seek(naprove+str(naremes))
			=relewin('win1')
			=movewin(0,0,23,79,'win',' ')
			ACTI WIND win
			cuantos=0
			SCAN WHILE !EOF()
				IF rem.proveedor=naprove .AND. rem.remesa=naremes .AND. empty(rem.agotada)
					STORE ff+ALLTRIM(STR(RECNO()))+"," TO ff
				ENDIF
			ENDSCAN
			STORE LEFT(ff,LEN(ff)-1) TO ff
			IF LEN(ff)>0
				cuantos=OCCURS(",",ff)+1
				registro=ff
				=lock('rem') .or. lok("rem")
				SELE rem
				desdecual = 1
				DO Mrem1 WITH ff, desdecual,.T.
				IF confirma("La remesa a dar por agotada",.T.,20,30)
					store ff to nadrrem,nada10
					store occur(",",nada10) to nahasta
					for K=0 to nahasta
						SELE rem
						IF K<occur(",",nada10)
							STORE AT(",",nadrrem) TO nada
							IF !EMPTY(nada)
								STORE SUBSTR(nadrrem,1,nada-1) TO nadpos
								STORE SUBSTR(nadrrem,nada+1,LEN(nadrrem)-nada) TO nadrrem
								goto val(nadpos)
							ENDIF
						ELSE
							goto val(nadrrem)
						ENDIF
						acti wind win
						sele mer
						namerca=iif(seek(rem.merca),left(SINESP1(palpopup),35),"Mercader¡a Inexistente")
						sele rem
						nasobra=rem.bultos-rem.vendido
						IF nasobra>0
							do cartel2 with "Sobran: "+ALLTRIM(STR(nasobra,12)),"de "+namerca,"- Elija la op. de Kardex","o [ESC] para Anular"
							sele mix
							stor 0 to respuesta
							nadopk=iif(empty(eliopk("",15,30)),0,respuesta)
							nadopk=left(mix.texto2,2)
							if !empty(nadopk) .and. lastkey()#27
								nadeta=mix.texto1
								sele kar
								=flock('kar') .or. flok("kar")
								appe blank
								repl kar.fechaop with date(), kar.articulo with rem.merca, kar.opk with nadopk, kar.cliente with naprove, kar.remesa with naremes
								repl kar.proveedor with .T., kar.detalle with nadeta, kar.salida with nasobra, kar.kilos with rem.kgbulto
								do repuse
								unlo in kar
								sele rem
								repl rem.agotada with "S"
								delete
							endif
						ELSE
							naregi=recno()
							namerca=rem.merca
							set near on
							store 0 to naremes2
							if seek(naprove)
								scan while rem.proveedor=naprove
									if rem.remesa#naremes .and. rem.merca=namerca .and. empty(rem.agotada)
										naremes2=rem.remesa
										exit
									endif
								endscan
							endif
							set near off
							goto naregi
							nasobra=ABS(nasobra)
							SELE kar
							INDE ON fechaop TO TMPKAR FOR kar.proveedor=.T. .AND. kar.cliente=naprove .AND. kar.remesa=naremes .AND. rtrim(kar.articulo)=rem.merca COMP
							use
							USE (PATH+'\KARDEX') INDEX TMPKAR,(PATH+'\KARDEX') ALIAS kar
							COUNT TO nada
							DIME REGI[nada]
							gg=""
							j=1
							SCAN
								STORE gg+ALLTRIM(STR(RECNO()))+"," TO gg
								STORE RECNO() TO REGI[j]
								j=j+1
							ENDSCAN
							gg=left(gg,LEN(gg)-1)
							registro=gg
							=LOCK("KAR") .OR. lok("kar")
							GOTO REGI[nada]
							FOR I=nada TO 1 STEP -1
								IF nasobra>kar.salida
									nasobra=nasobra-kar.salida
									repl kar.remesa with naremes,kar.detalle with "VENTA - RM "+alltrim(str(naremes))
								ELSE
									IF nasobra=kar.salida
										repl kar.remesa with naremes,kar.detalle with "VENTA - RM "+alltrim(str(naremes))
										exit
									ELSE
										scat memv
										naresta=kar.salida-nasobra
										repl kar.salida with naresta
										unlo in kar
										do flok with "kar"
										appe blank
										m.salida=nasobra
										m.remesa=naremes2
										m.detalle="VENTA - RM "+alltrim(str(naremes2))
										gath memv
										do repuse
										exit
									ENDIF
								ENDIF
							NEXT
							UNLO IN kar
							SELE kar
							acti scre
							USE
							=OPKAR()
							acti wind win
							sele rem
							repl rem.agotada with "S"
						ENDIF
					next
				ENDIF
				UNLO IN rem
			else
				do cartel2 with "LA REMESA "+ALLTRIM(STR(naremes))," DEL REMITENTE "+alltrim(napro),"YA ESTA AGOTADA",' '
			endif
			=relewin('win')
		ELSE
			=RELEWIN('win1')
			do cartel2 with "NO EXISTE LA REMESA "+ALLTRIM(STR(naremes))," DEL REMITENTE "+alltrim(napro),'','CORRIJA Y REINTENTE'
		ENDIF
	else
		=relewin('win1')
	endif
ELSE
	=iaudi()
ENDIF
rele memo like na*
=men_lin(BOTOM)
RETURN
*: EOF: AREM.PRG

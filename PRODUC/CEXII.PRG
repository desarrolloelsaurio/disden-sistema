********************************************************************************
*-- Programa: CEXII.PRG
*-- Fecha   : 09/19/91 11:55am
*-- Version : g. reiner
*-- Notas   : PROYECCION DE NECESIDADES DE STOCK POR IMPRESORA
*-- Modificaci¢n GOYO 28/07/92
********************************************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	STORE nul TO respuesta
	IF !empty(elimer(" a Fabricar",-1,1))
		rtcl=mer.articulo
		mrcd=ALLTRIM(mer.merca)
		=MOVEWIN(10,0,15,78,'FIC',' Stock para Fabricaci¢n '+mrcd+' ')
		STORE NUL TO camut,eltalle
		if tallecan()
			=men_lin(IMPRIMIENDO)
			STORE nul TO casos
			B=paip
			acla=B+PADC("MATERIAL",30)+B+PADC("CANTIDAD BRUTA",14)+B+PADC("CANTIDAD NETA",14)+B+PADC("UN. DE COMPRA",20)+B+PADC("EXISTENCIA",14)+B+PADC("NECESIDAD",14)+B
			STORE REPL("=",LEN(acla)) TO lns
			STORE LEN(acla) TO largo
			tt='Proyecci¢n de Necesidades de Stock'
			tt1='Producto:'+mrcd+' - Cantidad:'+alltrim(STR(camut))+' - Talle:'+alltrim(str(eltalle))
			STORE MIN(xacancho,xachoja) TO largoim
			=CABPRI()
			_PCOPIES=1
			PRINTJOB
			=CABPRI1()
			=tit_lns(3,tt1)
			sele des
			SCAN FOR articulo=rtcl .AND. (tipo=LEFT(abio,1) .OR. tipo=LEFT(tella,1)) .and. talle=eltalle
				IF _PLINENO>63
					=fin_lns(2,nul)
					=CABPRI1()
					=tit_lns(4,tt1)
				ENDI
				? paip
				IF tipo=LEFT(abio,1)
					=XSEEK(des.avi,'AVI','avicod')
					?? LEFT(avi.avios,30)
					uo=avi.unidad
					st=avi.stock
				ELSE
					=xseek(des.avi,'tel','telcod')
					?? LEFT(tel.tela,30)
					uo=tel.unidad
					st=tel.stock
				ENDIF
				?? paip
				ct2=cantidad*camut
				?? STR(ct2,14,2)
				?? paip
				ct3=ct2/fraccion
				?? STR(ct3,14,2)
				?? paip
				?? unid[uo]
				?? paip
				?? STR(st,14,2)
				?? paip
				?? IIF(st>=ct3,REPL('-',14),STR(CEILING(ct3-st),14,2))
				?? paip
				STORE casos+1 TO casos
			ENDSCAN
			? lns
			_WRAP=.F.
			?
			? "Despiece de "
			?? alltrim(STR(casos,10))
			?? " "+alltrim(tellas)+"/"+alltrim(abios)
			EJECT PAGE
			?
			ENDP
			=FINIMP()
			=IAUD(ALLTRIM(MER.ARTICULO)+'-'+MER.MERCA)
		ENDIF
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

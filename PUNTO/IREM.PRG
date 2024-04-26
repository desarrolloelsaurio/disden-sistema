********************************************************************************
*-- Programa: IREM.PRG
*-- Fecha   : 01-03-92 01:56am
*-- Version : G. REINER
*-- Notas   : RECEPCION REMITOS DE CASA CENTRAL
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	DEFINE WINDOW win FROM 3,20 to 22,68  TITL " Recepciขn Mercaderกa de Casa Central " SHAD COLOR SCHE 8
	acti wind win
	STOR NUL TO numrem,tll,ctdd
	store 5 to ren
	store 1 to col
	sele mer
	go top
	rtcl=mer.articulo
	@ 1,1 SAY 'Nง de REMITO' get numrem
	DO PRIPAN
	read
	if !empty(numrem) .and. lastkey()#27
		do while .t.
			@ ren,col get rtcl mess 'Articulo a Ingresar - [ESC] para Finalizar - [TECLA] y [ENTER] Selecciona'
			read
			if !empty(rtcl) .and. lastkey()#27
				if update()
					STOR NUL TO respuesta
					if !empty(elimer("a Ingresar",ren,col))
						rtcl=mer.articulo
						acti wind win
						@ ren,col get rtcl
						clea gets
					else
						exit
					endif
				endif
				acti wind win
				dtll=left(mer.merca,19)
				@ ren,col+16 get dtll
				clear gets
				@ ren,col+36 get tll pict '99' mess 'Talle del Producto'
				read
				if !empty(tll) .and. lastkey()#27 .and. tll<=xatalmax .and. tll>=xatalmin
					arti=alltrim(rtcl)+zero(tll*10,3)
					sele pre
					if seek(arti)
						@ ren,col+39 get ctdd pict '999999' mess 'Cantidad Recibida'
						read
						if !empty(ctdd) .and. lastkey()#27
							if confirma("Datos Ingresados",.t.,10,0)
								REGISTRO=STR(RECNO())
								DO LOK WITH "PRE"
								REPL STOCK WITH STOCK+CTDD
								UNLO IN PRE
								SELE KAR
								SCAT MEMV BLAN
								FECHAOP=DATE()
								ARTICULO=ARTI
								OPK=6
								DOCREF='RI'
								NRODOCREF=NUMREM
								DETALLE="Recepciขn Mercaderกas Casa Central"
								ENTRADA=ctdd
								SALIDA=NUL
								DO FLOK WITH "KAR"
								APPE BLAN
								GATH MEMV
								do repuse
								UNLO IN KAR
								ren=ren+1
								IF REN=16
									CLEA
									REN=4
									DO PRIPAN
								ENDIF
							endif
						endif
					endif
				endif
			else
				exit
			endif
		enddo
	endif
	RELE WIND win
ELSE
	DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,nul say botom
RETURN
PROCEDURE PRIPAN
	@ 2,nul say 'ษอออออออออออออออหอออออออออออออออออออหออหออออออป'
	@ 3,nul say 'บ   ARTICULO    บDENOMINACION COMER.บTLบCANTIDบ'
	@ 4,nul say 'ฬอออออออออออออออฮอออออออออออออออออออฮออฮออออออน'
	for a=5 to 16
		@ a,nul say 'บ               บ                   บ  บ      บ'
		endfor
		@ a,nul say 'ศอออออออออออออออสอออออออออออออออออออสออสออออออผ'
	RETURN
	* EOF - INDENT

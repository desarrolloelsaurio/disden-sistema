********************************************************************************
*-- Programa: BESTP.prg
*-- Fecha   : 06/20/91 05:13pm
*-- Version : G. REINER
*-- Notas   : borra ESTRUCTURA
********************************************************************************
PARA ARTIC
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	SELE EST
	=FLOCK() .OR. FLOK("EST")
	rr1=8
	rr2=16
	cc1=7
	cc2=56
	COL=17
	col1=20
	kok=0
	DEFINE WINDOW win1 FROM rr1+5,cc1+10 TO rr1+9,cc2+23 TITL " Estructura de Producto " SHAD COLOR SCHE 8
	SELE mer
	SCAT MEMV
	fisc=artic
	SELE est
	crec=RECC()
	goto top
	SCAN while est.articulo#artic
	ENDSCAN
	IF !EOF()
***		=mmer1()
		IF confirma(" Producto para Borrar su Estructura",.T.,rr1+8,0)
			SCAN while est.articulo=fisc
				ACTI WIND win1
				CLEA
				rcd=RECNO("EST")
				SCAT MEMV
				m.articulo=artic
				@ 1,1 SAY 'PROCEDIMIENTO' COLO SCHE 3
				=XSEEK(est.prc,'prc','PRCCOD')
				nada2="("+alltrim(str(est.posicion))+") - "+alltrim(prc.procfab)
				@ 1,col1 GET nada2 MESS '[ESC] Fin - [] Pr¢ximo - [B]orra'
				CLEAR GETS
				=MEN_LIN('[ESC] Fin - [] Pr¢ximo - [B]orra')
				=INKEY(NUL,"HM")
				DEAC WIND win1
				IF LASTKEY()#27
					IF LASTKEY()=66 .OR. LASTKEY()=98
						DELE RECO RECNO()
						kok=1
					ENDIF
				ELSE
					EXIT
				ENDIF
			ENDSCAN
			=RELEWIN("WIN") .AND. RELEWIN("WIN1")
		ENDIF
	ENDIF
	UNLO IN EST
	=IIF(crec=RECC(),iaud(ARTIC),"")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)

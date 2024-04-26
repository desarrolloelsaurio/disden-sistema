********************************************************************************
*-- Programa: defpopw.prg
*-- Fecha   : 03-08-92 05:29pm
*-- Version : G. REINER
*-- Notas   : define popups
*-- Modif.  : GOYO 05-30-92 09:40pm REEMP IF POR IIF
********************************************************************************
FUNCTION DEFPOPW
	PARAMETER ACCION,VENTANA
	PRIVATE PPU,RPPU,CPPU,CTT,LPPU,CLPPU,VENTANA,ACCION
	IF EMPTY(PARAMETER())
		=DEFPOP()
	ELSE
		if parameter()=1
			ventana"defpop"
		endif
		respuesta=respuesta+"#!"
		ppu=g1()
		rppu=VAL(g1())
		cppu=VAL(g1())
		ctt=g1()
		lppu=""
		clppu=VAL(g1())
		DEFI WIND (VENTANA) FROM rppu,cppu TO 24,79 NONE SHad
		DEFI POPU (ppu) FROM 0,0 MESS ctt SHAD COLO SCHE clppu IN WIND (VENTANA)
		STORE 1 TO Ren,LARGOR
		DO WHILE respuesta#"!"
			ctt=g1()
			DEFI BAR ren OF (ppu) PROM IIF(CTT='-','\-',' '+ctt+' ')
			ren=ren+1
			LARGOR=MAX(LEN(CTT),LARGOR)
		ENDDO
		LARGOR=LARGOR+2
		=MOVEWINN(rppu,cppu,rppu+REN,cppu+LARGOR,(VENTANA))
		ON SELE POPU (PPU) DO (ACCION)
		ACTI POPU (PPU)
		=RELEWIN((VENTANA))
		RELE POPU (PPU)
	ENDIF
RETURN .T.
*!*********************************************************************
*!
*!       Function: G1()
*!
*!      Called by: DEFPOP.PRG
*!
*!*********************************************************************
FUNCTION g1
	psc=AT("#",respuesta)
	pp=LEFT(respuesta,psc-1)
	respuesta=SUBSTR(respuesta,psc+1)
RETURN pp

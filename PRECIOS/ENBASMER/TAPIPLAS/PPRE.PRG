*******************************************************************************
*-- Programa: PPRE.PRG
*-- Fecha   : 11-15-92 05:05pm
*-- Version : G. REINER
*-- Notas   : PRUEBA PRECIOS
********************************************************************************
ULPR=PROGRAM()
IF CHEQSEG()
	LAPOL=ELIPOL("a Corregir",-1,1)
	IF !EMPTY(LAPOL)
		LAlis=alltrim(q_lis(val(left(lapol,2))))
		DEFI WIND WIN FROM 0,0 TO 7,60 foot alltrim(janname) TITL ' Prueba Precio ' shad colo sche 8
		=centwin("win")
		store nul to lamoney
		@ 1,1 SAY 'Poligonal: '+LALIS colo sche 3
		@ 2,1 SAY "Tipo     :"+right(lapol,2) colo sche 3
		@ 4,1 SAY "Precio   :"
		@ 3,1 say "Costo    :" ;
		colo sche 3 ;
		get lamoney ;
		pict '99,999.99'
		read
		if !empty(lamoney)
		  @ 4,15 SAY GET_PRE(lamoney,val(left(lapol,2)),0-val(right(lapol,2)),1,.t.) PICT '99,999.99'
		endif
	endif
ELSE
=IAUDI()
ENDIF
RETURN

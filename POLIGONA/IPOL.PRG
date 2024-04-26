*******************************************************************************
*-- Programa: IPOL.PRG
*-- Fecha   : 11-15-92 01:21am
*-- Version : G. REINER
*-- Notas   : MENU INGRESO / CORRECCION DE PRECIOS
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	defi wind win from 0,0 to 10,60 titl 'Correcci¢n Precios - Poligonales' shad colo sche 3
	=centwin("win")
	do while .t.
		if elimer("a Corregir",-1,1)
			FF=RECNO()
			REGISTRO=STR(RECNO())
			scat to agx
			=mmer(.t.,20,.t.)
			=movewin(14,6,23,73,'win1','Poligonal',alltrim(janname),.t.)
			=XSEEK(AGX[8],'PRO','PROCOD')
			haycambio=GET_POL(.T.)
			=GET_POL(.F.,.T.)
			IF LAST()#27
			    IF haycambio .and. CONFIRM1("los Datos Ingresados",.T.,10,30)
				=MEN_LIN(GRABANDO)
				SELE MER
				GO FF
				=RLOCK() .OR. LOK()
				GATH FROM AGX
				=IAUD(ALLTRIM(STR(MER.ARTICULO)))
				=MEN_LIN(BOTOM)
				ENDIF
			ENDIF
			=RELEWIN("WIN1")
		else
			exit
		endif
	enddo
	=relewin("win")
ELSE
	=IAUDI()
ENDIF
return

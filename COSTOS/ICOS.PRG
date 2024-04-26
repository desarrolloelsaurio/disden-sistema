*******************************************************************************
*-- Programa: ICOS.PRG
*-- Fecha   : 11-19-92 02:55am
*-- Version : G. REINER
*-- Notas   : INGRESO / CORRECCION COSTOS
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	defi wind win from 0,0 to 10,60 titl 'Correcci¢n Costos ' shad colo sche 3
	=centwin("win")
	do while .t.
		if elimer("a Corregir",-1,1)
			FF=RECNO()
			REGISTRO=STR(RECNO())
			scat to agx
			=mmer(.t.,20,.t.)
			=movewin(14,15,19,64,'win1','Costos',alltrim(janname),.t.)
			@ 1,1 say "COSTO EN "+UPPER(XAUSS)
			@ $,30 GET AGX[15] PICT '99,999.99'
			@ $+1,1 SAY "COSTO EN "+UPPER(XADOLS)
			@ $,30 GET AGX[17] PICT '99,999.99'
			READ
			IF UPDATE() .AND. LAST()#27 .AND. CONFIRM1("los Datos Ingresados",.T.,10,30)
				=MEN_LIN(GRABANDO)
				SELE MER
				GO FF
				=RLOCK() .OR. LOK()
				GATH FROM AGX
				=IAUD(ALLTRIM(STR(MER.ARTICULO)))
				=MEN_LIN(BOTOM)
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

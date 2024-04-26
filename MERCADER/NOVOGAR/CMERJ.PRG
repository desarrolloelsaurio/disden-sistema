********************************************************************************
*-- Programa: CMERJ.PRG
*-- Fecha   : 06/28/91
*-- Version : g. reiner
*-- Notas   : MUESTRA LEGAJO DE CLIENTES
*-- Modificaci¢n GOYO 06-10-92 05:53pm (movewin/auditor)
********************************************************************************
STORE hora_ulp(PROGRAM()) to ULPR
IF CHEQSEG()
	STORE 20 TO COL
	SELE mer
	ACTI SCRE
	=MEN_LIN(PADC('[TAB] Para Grabar - [ESC] para Anular',80))
	=movewin(3,1,8,1+mclian,'win',' Datos de la Mercader¡a ')
	@ 1,2 SAY "Art¡culo" COLOR SCHE 3
	@ 1,COL GET mer.articulo PICTURE '@!'
	@ 2,2 SAY "Denominaci¢n " COLOR SCHE 3
	@ 2,COL GET mer.merca PICTURE '@!'
	CLEAR GETS
	on key label tab keyboard chr(23)
	=movewin(8,5,20,75,'win1',' Legajo de '+ALLTRIM(mer.merca)+" ")
	MODI MEMO merca1 WINDOW win1
	CLOSE MEMO merca1
	on key label tab
	=iaud(alltrim(mer.articulo)+'-'+mer.merca)
	=RELEWIN('win')
	=RELEWIN('win1')
ELSE
	=iaudI()
ENDIF
RETURN

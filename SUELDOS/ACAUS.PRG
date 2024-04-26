********************************************************************************
*-- Programa: ACAUS.PRG
*-- Fecha   : 12/13/90 01:28am
*-- Version : G. REINER
*-- Notas   : ACTUALIZA DENOMINACION DE MONEDA NACIONAL
********************************************************************************
ulpr=program()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') color i
DEFINE WINDOW win FROM 6,12 TO 12,64 TITL ' Denominaci¢n Moneda ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'DENOMIN. MONEDA (Sing.)' COLOR SCHE 3
@ 3,1 SAY 'DENOMIN. MONEDA (Pl.)' COLOR SCHE 3
vez=1
DO WHILE vez=1
   vez=2
   @ 1,28 GET aus PICTURE 'XXXXXXXXXXXXXXXXXXXX';
      MESS 'Denominaci¢n Moneda de Curso Legal en Singular'
   @ 3,28 GET auss PICTURE 'XXXXXXXXXXXXXXXXXXXX';
      MESS 'Denominaci¢n Moneda de Curso Legal en Plural'
   READ
	aus=proper(aus)
	auss=proper(auss)
ENDDO
RELE WIND win
RELE vez
@ 24,0 say space(80)
RETURN

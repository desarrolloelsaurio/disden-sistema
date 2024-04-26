************************************
*-- Programa: Cqsal1.PRG
*-- Fecha   : 12/15/90 05:57pm
*-- Version : G. REINER
*-- Notas   : BORRA salario familiar
*************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') color i
store .f. to sigue
do while .t.
	STORE 0 TO RESPUESTA
	IF ELISAL('a Borrar')<>0
		th=RESPUESTA
		@ 24,0 say padc(' Borrando los Datos Requeridos ',80,'*') colo sche 19
      SELE LIQ
      DELE FOR REGISTRO=TH
		store .t. to sigue
	else
		exit
	endif
enddo
sele liq
indice="LI"+LEFT(ptn[jannro],1)+'Q'+SUBSTR(ptn[jannro],2,1)+'u'+RIGHT(ptn[jannro],1)+LEFT(janname,1)
set index to (PATH+'\'+indice)
if sigue
   @ 24,0 SAY PADC(" Compactando el Archivo de Salario Familiar ",80,'*') COLO SCHE 19
	PACK
endif
RELE TH,FISC
RETURN

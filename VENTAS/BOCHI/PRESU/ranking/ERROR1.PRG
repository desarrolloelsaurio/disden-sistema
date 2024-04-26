********************************
*-- Programa: ERROR1.PRG
*-- Fecha   : 12/13/90 08:09pm
*-- Version : G. REINER
*-- Notas   : PROGRAMA DE ERROR
********************************
PARAMETER DEABPR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
UNLO ALL
ERR_PROG=ULPR
SET DEVICE TO SCRE
IF PRINTSTATUS()
	ON PAGE
	SET PRINTER TO
	SET PRINTER OFF
ENDIF
SET CONS ON
ACTI SCRE
@ nul,34 SAY TIME() COLO I
@ nul,46 SAY PADC(PROGRAM(),10) COLO I
IF !EMPTY(ALIAS())
	GOTO BOTTOM
ENDIF
DEAC WIND ALL
_ALIGNMENT='LEFT'
_RMARGIN=80
_LMARGIN=0
_WRAP=.F.
if error()=43 .or. error()=6
	close data
	DO OPENCLOS
endif
CLEA
if !_windows
   =BOX()
endif
IF !DEABPR
	SET SHAD ON
	SET DELE ON
	=MOVEWIN(4,5,20,69,'ERR',' *** ERROR *** ','***')
	@ 4,5  SAY 'Programa:'
	@ 4,15 SAY ulpr
	@ 6,5 SAY 'Error:'
	@ 6,15 SAY ERROR()
	@ 8,5 SAY 'Tipo :'
	@ 8,15 SAY alltrim(MESSAGE())
	@ 10,5 SAY 'L¡nea:'
	@ 10,15 SAY alltrim(MESSAGE(1))
	=SWAP(@ERR_PROG,@ULPR)
ENDIF
=IAUD(MESSAGE())
=SWAP(@ERR_PROG,@ULPR)
=OFF_TMP()
=OFF_RELA()
=OFF_IDX()
=INKEY(0,"HM")
=RELEWIN("ERR")
RELE G_GRABA
on key label tab
on key label dnarrow
on key label Ctrl+D
on key label Ctrl+F3
ON KEY LABEL F3
ON KEY LABEL F2
ON KEY LABEL F4
ON KEY LABEL ENTER
ON KEY LABEL ESCAPE
ON KEY LABEL LEFTMOUSE
ON KEY LABEL RIGHTMOUSE
ON KEY LABEL MOUSE
=cabpan1()
if error()=12
	* error tiene que ser 12 - variable no definida
	raiz=daraiz()
	if raiz='CIU'
		raiz="var_"+raiz
		do &raiz
	endif
else
	if error()=107
		raiz=daraiz()
		=popcarte("!!@$%^&*("+chr(13)+chr(10)+;
			"TRATANDO DE SOLUCIONAR"+chr(13)+chr(10)+;
			"EL PROBLEMA DE VARIABLES"+chr(13)+chr(10)+;
			"ENCONTRADO"+chr(13)+chr(10)+;
			"RAIZ "+RAIZ+chr(13)+chr(10)+;
			"!!@$%^&*(")
		DO CASE
		CASE RAIZ='CIU'
			do copyvar with "PRV",raiz,2
		CASE RAIZ='PER' .OR. RAIZ='PRO' .OR. RAIZ='SER' .or. RAIZ='GNT' .or. RAIZ='GAR'
			do copyvar with "PRV",raiz,3
		OTHERWISE
			do copyvar with "PRV",raiz
		ENDCASE
		=RELEWIN("POPCARTE")
	endif
endif
PUSH KEY CLEA
RETURN

FUNCTION DARAIZ
	D_B=ALLTRIM(ULPR)
	D_RAIZ=SUBSTR(D_B,2,3)
RETURN D_RAIZ

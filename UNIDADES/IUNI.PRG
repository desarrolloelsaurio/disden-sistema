********************************************************************************
*-- Programa: IUNI.PRG
*-- Fecha   : 06/13/91 05:03pm
*-- Version : G. REINER
*-- Notas   : INGRESA UNIDADES
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=MOVEWIN(3,10,23,57,'WIN'," Ingreso/Correcciขn Unidades ")
	clea
	@ NUL,NUL say 'ษอออออออออออออออออออออปษอออออออออออออออออออออป'
	@ 1,NUL say 'บ Unidad de Fraccion. บบ Unidad de Fraccion. บ'
	@ 2,NUL say 'ฬอออออออออออออออออออออนฬอออออออออออออออออออออน'
	=for_say('บ'+SPACE(20)+'บบ'+SPACE(20)+'บ',3,17,NUL)
	=ar_get(@unid,1,15,1,1,3,1,REPL('!',20))
	=ar_get(@unid,16,30,1,1,3,24,REPL('!',20))
	@ 18,NUL say 'ศอออออออออออออออออออออผศอออออออออออออออออออออผ'
	read
	=RELEWIN("WIN")
ELSE
	=IAUDI()
ENDIF
return MEN_LIN(BOTOM)
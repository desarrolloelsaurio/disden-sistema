*****************************************************************************
*-- Programa: IAC.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE INDICES
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
do opact
do opiac
DO CASE
CASE BAR()=1
	DO iiac
CASE BAR()=2
	stor nul TO respuesta
	IF ELIIAC(" a Corregir",-1,1)
		DO ciac
	ENDIF
CASE BAR()=4
	stor nul TO respuesta
	IF ELIIAC(" a Borrar",-1,1)
		DO biac
	ENDIF
CASE BAR()=5
	SET DELE OFF
	SET FILTER TO DELETED()
	GOTO TOP
	IF !EOF()
		stor nul TO respuesta
		IF ELIiac(" a Recuperar",-1,1)
			DO lliac
		ENDIF
	ENDIF
	SET DELE ON
	SELE iac
	SET FILTER TO
	GOTO TOP
CASE BAR()=8
	DO liaci
CASE BAR()=9
	stor nul TO respuesta
	IF ELIIAC(" a Listar",-1,1)
       DO liacp
    endif   
CASE BAR()=11
	=vGRL("iac"," INDICES"," DE INDICES")
CASE BAR()=13
	DO rndx WITH 16,20
	ON SELE POPU rndx DO xMIX
	ACTI POPU rndx
	RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN

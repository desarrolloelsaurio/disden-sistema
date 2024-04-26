********************************************************
*-- Programa: tix.prg
*-- Fecha   : 01-18-92 09:26am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE DATOS DE UNIDADES
********************************************************
ulpr=PROGRAM()
=cabpan1()
do optix
do opcns
DO CASE
CASE BAR()=1
	STORE nul TO respuesta
	DO WHILE !EMPTY(elicns(" ",-1,1))
		DO ITIX
		STORE nul TO respuesta
	ENDDO
CASE BAR()=2
	STORE nul TO respuesta
	DO WHILE !EMPTY(elicns(" a Corregir",-1,1))
		DO Ctix
		STORE nul TO respuesta
	ENDDO
CASE BAR()=4
	respuesta='nada#16#20#Tipo de Borrado#3#Por Tipo de \<Unidad#Por Tipo de \<Gasto#\<Todo un Consorcio'
	=defpop()
	ON SELE POPU NADA DO BTIX
	DO WHILE .T.
		=moveWIN(mtixr,mtixc,mtixr+mtixla,mtixc+mtixan,'win'," Selecciona Unidad ")
		STORE nul TO respuesta
		IF empty(elicns(" a Borrar",-1,1))
			EXIT
		ENDIF
		SCAT MEMVAR
		STORE 25 TO COL
		DO mcns with .t.
		IF confirma("el CONSORCIO",.T.,mtixr+mtixla,mtixc+10)
			ACTI POPU nada
		ENDIF
		=relewin('win')
	ENDDO
	RELE POPU nada
CASE BAR()=5
	* * * * * * * * * * restaura
CASE BAR()=8 .or. BAR()=9
	respuesta='nada#10#20#Tipo de Listado#3#Por Tipo de \<Unidad#Por Tipo de \<Gasto#\<Todo un Consorcio'
	=defpop()
	PORP=(BAR()=9)
	ON SELE POPU NADA DO LTIX WITH PORP
	DO WHILE .T.
		STORE NUL TO RESPUESTA
		IF EMPTY(ELICNS("a Listar",-1,1))
			EXIT
		ENDIF
		ACTI POPU NADA
	ENDDO
	RELE POPU NADA
CASE BAR()=11
	=VGRL("TIX"," TIPO DE UNIDAD"," DE T. UNIDAD")
CASE BAR()=13
	ULPR='XTIX'
	DO RNDX WITH 16,20
	ON SELE POPU RNDX DO XTIX
	ACTI POPU RNDX
	RELE POPU RNDX
ENDCASE
ulpr=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)

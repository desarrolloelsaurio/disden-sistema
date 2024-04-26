********************************************************************************
*-- Programa: VIX.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE DATOS DE VIAJANTES
*-- Modificaci¢n GOYO 04-02-92 12:55pm
********************************************************************************
ulpr=PROGRAM()
=CABPAN1()
SELE vix
DO CASE
CASE BAR()=1
	DO WHILE .T.
		stor NUL TO respuesta
		IF !elivia(" ",-1,1)
			EXIT
		ENDIF
		DO ivix
	ENDDO
CASE BAR()=2
	DO WHILE .T.
		stor NUL TO respuesta
		IF !elivia(" a Corregir",-1,1)
			EXIT
		ENDIF
		DO cvix
	ENDDO
CASE BAR()=4
	respuesta='nada#16#20#Tipo de Borrado#3#\<Zonas de un '+biaja+'#Zona para \<Todos los '+biajas+'#\<Marca para todos los '+biajas+'#Zona y Marca de un \<'+biaja
	=DEFPOP()
	ON SELE POPU nada DO bvix
	ACTI POPU nada
	RELE POPU nada
CASE BAR()=6
	respuesta='nada#10#20#Tipo de Listado#3#\<Todos los '+biajas+'#\<Un '+biaja+'#Una \<Zona#Una \<Marca'
	=DEFPOP()
	ON SELE POPU nada DO lvix WITH .F.
	ACTI POPU nada
	RELE POPU nada
CASE BAR()=7
	respuesta='nada#10#20#Tipo de Listado#3#\<Todos los '+biajas+'#\<Un '+biaja+'#Una \<Zona#Una \<Marca'
	=DEFPOP()
	ON SELE POPU nada DO lvix WITH .T.
	ACTI POPU nada
	RELE POPU nada
CASE BAR()=9
	=VGRL("VIX"," Z. DE "+UPPER(BIAJAS)," DE Z. DE "+UPPER(BIAJAS))
CASE BAR()=11
	ulpr='XVIX'
	DO rndx WITH 16,20
	ON SELE POPU rndx DO xviX
	ACTI POPU rndx
	RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN

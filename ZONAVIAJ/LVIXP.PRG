********************************************************************************
*-- Programa: lvixp.prg
*-- Fecha   : 09/03/91 03:30pm
*-- Version : g. reiner
*-- Notas   : deriva a LISTADO DE ZONAS DE UN VIAJANTE POR pantalla
*-- Modificaci¢n 04-02-92 12:37pm GOYO
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
STOR NUL TO respuesta
DO CASE
CASE BAR()=1
	stor '.t.' TO fsc
	ttu='Listado de Zonas de '+biajas
	DO lvixp2
CASE BAR()=2
	IF !EMPTY(elivia(" a Listar",-1,1))
		fsc='vix.codvia="'+via.codvia+'"'
		ttu='Listado de Zonas de '+biajas+' - '+biaja+':'+ALLTRIM(via.viajante)
		DO lvixp1
	ENDIF
CASE BAR()=3
	IF !EMPTY(elizon(" a Listar",-1,1))
		fsc='vix.zona="'+left(MIX.texto2,2)+'"'
		ttu='Listado de Zonas de '+biajas+' - Zona:'+ALLTRIM(mix.texto1)
		DO lvixp2
	ENDIF
CASE BAR()=4
	IF !EMPTY(ELIEMP(" a Listar",-1,1))
		fsc='vix.marca="'+left(MIX.texto2,2)+'"'
		ttu='Listado de Zonas de '+biajas+' - Marca:'+ALLTRIM(MIX.TEXTO1)
		DO lvixp2
	ENDIF
ENDCASE
ulpr=PROGRAM()
RETURN MEN_LIN(BOTOM)

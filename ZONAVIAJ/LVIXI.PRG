********************************************************************************
*-- Programa: lvixi.prg
*-- Fecha   : 09/03/91 02:59pm
*-- Version : g. reiner
*-- Notas   : deriva a LISTADO DE ZONAS DE UN VIAJANTE POR IMPRESORA
*-- Modificaci¢n GOYO 04-02-92 12:50pm
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca . empresa
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
DO CASE
CASE BAR()=1
fsc='.t.'
ttu='Listado de Zonas de '+biajas+' - Todos los '+biajas
DO lvixi2
CASE BAR()=2
STOR NUL TO respuesta
IF !EMPTY(elivia(" a Listar",-1,1))
xcos=via.codvia
fsc='vix.codvia=xcos'
ttu='Listado de Zonas de '+biajas+' - '+biaja+':'+ALLTRIM(via.viajante)
DO lvixi2
ENDIF
CASE BAR()=3
STOR NUL TO respuesta
IF !EMPTY(elizon(" a Listar",-1,1))
xcos=left(texto2,2)
fsc='vix.zona=xcos'
ttu='Listado de Zonas de '+biajas+' - Zona:'+ALLTRIM(mix.texto1)
DO lvixi2
ENDIF
CASE BAR()=4
STOR NUL TO respuesta
IF !EMPTY(ELIEMP(" a Listar",-1,1))
xcos=left(texto2,2)
fsc='vix.marca=xcos'
ttu='Listado de Zonas de '+biajas+' - Marca:'+ALLTRIM(MIX.TEXTO1)
DO lvixi2
ENDIF
ENDCASE
ULPR=PROGRAM()
RETURN MEN_LIN(BOTOM)

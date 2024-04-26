********************************************************************************
*-- Programa: LprpJI1.PRG
*-- Fecha   : 06/28/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE LEGAJOS DE PropietarioS
********************************************************************************
ff=RECNO()
ulpr=HORA_ULP(PROGRAM())
DO impresor
=men_lin(IMPRIMIENDO)
largoim=80
acla=space(80)
=CABPRI()
_PCOPIES=1
PRINTJOB
SCAN FOR &fisc
	if !empty(PER.legajo)
		_PAGENO=1
		prx=64
		=CABPRI1()
		? 'COD.Propietario:'
		?? PER.PROCOD
		??SPACE(22)+"DOMICILIO: "+ALLTRIM(PER.domicilio)
		GOTO prp.localidad IN mix
		nada=ALLTRIM(SAYMIX(PER.LOCALIDAD,"CIUCOD"))
		nada1="("+ALLTRIM(mix.texto2)+")"
		nada3=ALLTRIM(SAYMIX(RIGHT(MIX.TEXTO2,2),"PRVCOD"))
		? 'Propietario    :'
		?? PER.PROVEEDOR
		?? SPACE(2)+"LOCALIDAD: "+nada
		? SPACE(44)+"PROVINCIA: "+nada3+"-C.P.:"+nada2
		? SPACE(44)+"TELEFONOS: "+nada1
		?? PER.telefonos
		? REPL("-",80)
		ON PAGE AT LINE 69 DO pgh1
		? legajo
		? REPL("-",80)
		ON PAGE
		EJECT PAGE
	endif
ENDSCAN
ON PAGE
EJECT PAGE
?
ENDP
=FINIMP()
=MEN_LIN(BOTOM)
RETURN

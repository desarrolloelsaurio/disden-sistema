********************************************************************************
*-- Programa: LMEDJI2.PRG
*-- Fecha   : 06/28/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE LEGAJOS DE MEDICOS
********************************************************************************
ff=RECNO()
ulpr=HORA_ULP(PROGRAM())
DO impresor
=men_lin(IMPRIMIENDO)
largoim=80
DO CABPRI
_PCOPIES=1
PRINTJOB
_PAGENO=1
prx=64
IF !EMPTY(MED.legajo)
	DO CABPRI1
	? 'COD.MEDICO:'
	?? MED.codMED
	??SPACE(22)+"DOMICILIO: "+ALLTRIM(MED.domicilio)
	GOTO MED.localidad IN mix
	nada=ALLTRIM(mix.texto1)
	nada1="("+ALLTRIM(mix.texto2)+")"
	nada2=STR(mix.nu2,4)
	GOTO mix.nu1 IN mix
	nada3=ALLTRIM(mix.texto1)
	? 'MEDICO    :'
	?? MED.MEDICO
	?? SPACE(2)+"LOCALIDAD: "+nada
	? SPACE(44)+"PROVINCIA: "+nada3+"-C.P.:"+nada2
	? SPACE(44)+"TELEFONOS: "+nada1
	?? MED.telefonos
	? REPL("-",80)
	ON PAGE AT LINE 69 DO pgh1
	? legajo
	? REPL("-",80)
	ON PAGE
	EJECT PAGE
	?
ENDIF
ENDP
=FINIMP()
=men_lin(botom)
RELE acla,largo,largoim,prx
ON PAGE
RETURN

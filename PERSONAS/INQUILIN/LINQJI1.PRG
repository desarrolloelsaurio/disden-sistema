********************************************************************************
*-- Programa: LinqJI1.PRG
*-- Fecha   : 06/28/91
*-- Version : G. REINER
*-- Notas   : IMPRESION DE LEGAJOS DE InquilinoS
********************************************************************************
ff=RECNO()
ulpr=HORA_ULP(PROGRAM())
acla=space(80)
=CABPRI()
_PCOPIES=1
PRINTJOB
SCAN FOR &fisc
	if !empty(PER.legajo)
		_PAGENO=1
		prx=64
		=CABPRI1()
		? 'COD.Inquilino:'
		?? PER.CODCLI
		??SPACE(22)+"DOMICILIO: "+ALLTRIM(PER.domicilio)
		GOTO PER.localidad IN mix
		nada=ALLTRIM(mix.texto1)
		nada1="("+ALLTRIM(mix.texto2)+")"
		nada2=STR(mix.nu2,4)
		GOTO mix.nu1 IN mix
		nada3=ALLTRIM(mix.texto1)
		? 'Inquilino    :'
		?? PER.CLIENTE
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
=men_lin(botom)
RETURN

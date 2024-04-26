********************************************************************************
*-- Programa: LPROJI1.PRG
*-- Fecha   : 06/28/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE LEGAJOS DE PROVEEDORES
********************************************************************************
ff=RECNO()
ulpr=HORA_ulp(PROGRAM())
=impresor()
=men_lin(IMPRIMIENDO)
largoim=80
acla=space(80)
=CABPRI()
_PCOPIES=1
PRINTJOB
   SCAN FOR &fisc
    if !empty(PRO.legajo)
      _PAGENO=1
      prx=64
=CABPRI1()
      ? 'COD.PROVEEDOR:'
      ?? PRO.codPRO
      ??SPACE(22)+"DOMICILIO: "+ALLTRIM(PRO.domicilio)
      if xseek(PRO.localidad,'mix','ciucod')
        nada=ALLTRIM(mix.texto1)
        nada1="("+ALLTRIM(mix.texto2)+")"
        nada2=STR(mix.nu2,4)
				nada3=iif(xseek(right(mix.texto2,2),'mix','prvcod'),ALLTRIM(mix.texto1),space(10))
			 else
        nada=space(15)
        nada1=space(4)
        nada2=Space(4)
				nada3=space(10)
			 endif
      ? 'PROVEEDOR  :'
      ?? PRO.Proveedor
      ?? SPACE(2)+"LOCALIDAD: "+nada
      ? SPACE(44)+"PROVINCIA: "+nada3+"-C.P.:"+nada2
      ? SPACE(44)+"TELEFONOS: "+nada1
      ?? PRO.telefonos
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
ON PAGE
RETURN men_lin(botom)

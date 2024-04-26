********************************************************************************
*-- Programa: LVIAJI1.PRG
*-- Fecha   : 05-21-92 11:58am
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE LEGAJOS DE VIAJANTES
********************************************************************************
ff=RECNO()
ulpr=HORA_ulp(PROGRAM())
=men_lin(IMPRIMIENDO)
largoim=80
acla=space(80)
=CABPRI()
_PCOPIES=1
PRINTJOB
   SCAN FOR &FISC
    if !empty(VIA.legajo)
      _PAGENO=1
      prx=64
=CABPRI1()
      ? 'COD.VIAJANTE:'
      ?? VIA.codVIA
      ??SPACE(22)+"DOMICILIO: "+ALLTRIM(VIA.domicilio)
      if xseek(VIA.localidad,'mix','ciucod')
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
      ? 'VIAJANTE  :'
      ?? VIA.VIAJANTE
      ?? SPACE(2)+"LOCALIDAD: "+nada
      ? SPACE(44)+"PROVINCIA: "+nada3+"-C.P.:"+nada2
      ? SPACE(44)+"TELEFONOS: "+nada1
      ?? VIA.telefonos
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
ON PAGE
RETURN

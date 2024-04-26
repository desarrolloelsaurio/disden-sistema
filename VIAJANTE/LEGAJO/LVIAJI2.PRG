********************************************************************************
*-- Programa: LVIAJI2.PRG
*-- Fecha   : 06/28/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE LEGAJOS DE VIAJANTES
********************************************************************************
ff=RECNO()
ulpr=HORA_ULP(PROGRAM())
=men_lin(IMPRIMIENDO)
largoim=80
=CABPRI()
_PCOPIES=1
PRINTJOB
   _PAGENO=1
   prx=64
   IF !EMPTY(VIA.legajo)
      =CABPRI1()
      ? 'COD.VIAJANTE:'
      ?? VIA.codPRO
      ??SPACE(22)+"DOMICILIO: "+ALLTRIM(VIA.domicilio)
      if xseek(PRO.localidad,'mix','ciucod')
        nada=ALLTRIM(mix.texto1)
        nada1="("+ALLTRIM(mix.texto2)+")"
        nada2=STR(mix.nu2,4)
        nada3=xseek(right(mix.texto2,2),'mix','prvcod'),ALLTRIM(mix.texto1),space(10))
			else
        nada=space(15)
        nada1=space(5)
        nada2=space(4)
        nada3=space(10)
			endif
      ? 'VIAJANTE    :'
      ?? VIA.Viajante
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
      ?
   ENDIF
ENDP
=FINIMP()
=men_lin(botom)
RELE acla,largo,largoim,prx
ON PAGE
RETURN

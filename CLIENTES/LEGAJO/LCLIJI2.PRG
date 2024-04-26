********************************************************************************
*-- Programa: LCLIJI2.PRG
*-- Fecha   : 06/28/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE LEGAJOS DE CLIENTES
********************************************************************************
ff=RECNO()
ulpr=HORA_ULP(PROGRAM())
DO impresor
@ 24,nul SAY IMPRIMIENDO COLO SCHE 19
largoim=80
DO CABPRI
_PCOPIES=1
PRINTJOB
   _PAGENO=1
   prx=64
   IF !EMPTY(PER.legajo)
      DO CABPRI1
      ? 'COD.CLIENTE:'
      ?? PER.codcli
      ??SPACE(22)+"DOMICILIO: "+ALLTRIM(PER.domicilio)
      GOTO PER.localidad IN mix
      nada=ALLTRIM(mix.texto1)
      nada1="("+ALLTRIM(mix.texto2)+")"
      nada2=STR(mix.nu2,4)
      GOTO mix.nu1 IN mix
      nada3=ALLTRIM(mix.texto1)
      ? 'CLIENTE    :'
      ?? PER.cliente
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
      ?
   ENDIF
ENDP
=FINIMP()
=men_lin(botom)
RELE acla,largo,largoim,prx
ON PAGE
RETURN
*: EOF: LCLIJI2.PRG
* EOF - INDENT

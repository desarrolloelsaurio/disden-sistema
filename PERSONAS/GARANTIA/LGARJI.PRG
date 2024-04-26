********************************************************************************
*-- Programa: LGARJI.PRG
*-- Fecha   : 04-24-92 04:29pm
*-- Version : BANALOTTI
*-- Notas   : IMPRESION DE LEGAJOS DE GARANTIAS
********************************************************************************
#DEFINE BOTOM "  "+repl("°",78)                && BOTOM
#DEFINE IMPRIMIENDO  PADC(' IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe ',80,'°')   && IMPRIMIENDO
#DEFINE ACLA         SPACE(80)
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
   if !empty(PER.legajo)
      =cabpri()
      _PCOPIES=1
      PRINTJOB
         =cabpri1()
         SELE PER
         _PAGENO=1
         prx=64
         =CABPRI1()
         ? 'Cod.Garant¡a:'
         ?? PER.CODCLI
         ??SPACE(22)+"DOMICILIO: "+ALLTRIM(PER.domicilio)
         ? 'Garant¡a    :'
         ?? PER.CLIENTE
         ?? SPACE(2)+"LOCALIDAD: "
         ?? SAYMIX(PER.LOCALIDAD,'CIUCOD')
         ? REPL("-",80)
         ON PAGE AT LINE 69 DO pgh1
         ? legajo
         ? REPL("-",80)
         ON PAGE
         EJECT PAGE
         ?
      ENDP
      =FINIMP()
      =IAUD(PER.CODCLI+"-"+PER.CLIENTE)
   ENDIF
ELSE
   =IAUDI()
ENDIF
RETURN men_lin(BOTOM)

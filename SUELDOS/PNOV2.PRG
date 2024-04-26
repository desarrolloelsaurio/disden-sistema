********************************************************************************
*-- Programa: PNOV2.PRG
*-- Fecha   : 01/30/91 12:08pm
*-- Version : G. REINER
*-- Notas   : IMPRIME LA PLANILLA DE NOVEDADES DE UN CENTRO DE COSTOS
********************************************************************************
ulpr=PROGRAM()
SELE emp
SET ORDER TO ordlis
M.LINEA=REPL("=",LEN(ACLA))
SCAN FOR ccos=cecos
   IF _PLINENO>mxlin
      ? linea
      EJECT PAGE
      ? CHR(18)
      ? 'PROGRAMA :PNOV1'
      ?? SPACE(47)
      ? 'FECHA    :'
      ?? DATE()
      ?? SPACE(13)
      ?? 'HORA     :'
      ?? TIME()
      ?? SPACE(13)
      ?? 'P g N§   :'
      ?? STR(_PAGENO,5)
      ?
      ??? CHR(18)
      ? tt+' - Cont.' STYLE 'u'
      ?
      IF largo>largoim
         ??? CHR(15)
      ENDIF
      IF largo<255
         ?linea
         ? acla
         ? linea
      ELSE
         ? REPL("-",43)
         FOR A=1 TO ct
            ?? REPL("-",acdigi+1)
         NEXT
         ? "|  Legajo  |"+PADC("Empleado",30,' ')+B
         SELE (number)
         SCAN
            ?? PADC(ALLTRIM(&cosa),acdigi,' ')
            ?? B
         ENDSCAN
         SELE emp
         ? REPL("-",43)
         FOR A=1 TO ct
            ?? REPL("-",acdigi+1)
         NEXT
      ENDIF
   ENDIF
   ? B
   ?? emp.legajo
   ?? B
   ?? emp.apynom
   IF largo<255
      ?? acla1
      ? B
      ?? REPL('-',largo-2)
      ?? B
   ELSE
      ?? B
      FOR A=1 TO ct
         ?? SPACE(acdigi)
         ?? B
      NEXT
      ? B
      ?? REPL("-",42)
      FOR A=1 TO ct-1
         ?? REPL("-",acdigi+1)
      NEXT
      ?? REPL("-",acdigi)
      ?? B
   ENDIF
ENDSCAN
IF largo<255
   ?linea
ELSE
   ? REPL("-",43)
   FOR A=1 TO ct
      ?? REPL("-",acdigi+1)
   NEXT
ENDIF
?
EJECT PAGE
RETURN

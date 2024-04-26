********************************************************************************
*-- Programa: lhori2.prg
*-- Fecha   : 03/08/91 06:22pm
*-- Version : g. reiner
*-- Notas   : decide los l¡mites del listado
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
dijo=BAR()
DO CASE
CASE BAR()=1
   STORE '.t.' TO fisc
   ttl1='Todos los Empleados'
   DO lhori1
CASE BAR()=2
   STORE 0 TO respuesta
   IF elicat(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      ttl1='Por Categor¡a:'+ALLTRIM(cat->categoria)
      DO lhori1
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicon(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      ttl1='Por Convenio:'+ALLTRIM(con->convenio)
      DO lhori1
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF eliccos(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      ttl1='Por Centro de Costos:'+ALLTRIM(ccos->cencos)
      DO lhori1
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliesp(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      ttl1='Por Especialidad:'+ALLTRIM(esp->especiali)
      DO lhori1
   ENDIF
ENDCASE
RETURN

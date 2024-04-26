*:*********************************************************************
*:
*:        Program: LQRETI1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LHORI6.PRG                    
*:
*:          Calls: LQRETI2.PRG
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:55               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: lqreti1.prg
*-- Fecha   : 03/22/91 02:11am
*-- Version : g. reiner
*-- Notas   : decide los l¡mites del listado de retenciones liquidadas
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
dijo=BAR()-10
DO CASE
CASE BAR()=1
   STORE '.t.' TO fisc
   ttl1='Todos los Empleados'
   DO lqreti2
CASE BAR()=2
   STORE 0 TO respuesta
   IF elicat(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      ttl1='Por Categor¡a:'+ALLTRIM(cat->categoria)
      DO lqreti2
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicon(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      ttl1='Por Convenio:'+ALLTRIM(con->convenio)
      DO lqreti2
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF eliccos(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      ttl1='Por Centro de Costos:'+ALLTRIM(ccos->cencos)
      DO lqreti2
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliesp(" a Listar")<>0
      GOTO respuesta
      xcos=respuesta
      ttl1='Por Especialidad:'+ALLTRIM(esp->especiali)
      DO lqreti2
   ENDIF
ENDCASE
RETURN
*: EOF: LQRETI1.PRG

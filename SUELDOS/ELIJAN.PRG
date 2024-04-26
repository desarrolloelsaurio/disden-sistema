********************************************************************************
*-- Programa: ELIJAN.PRG
*-- Fecha   : 10/25/90 00:51am
*-- Version : G. REINER
*-- Notas   : ELIGE LA EMPRESA CON LA QUE VA A TRABAJAR
********************************************************************************
DO opjan
STORE 0 TO respuesta
IF janpop
   ACTI POPUP janpop
   IF respuesta<>0
      GOTO TOP
      SKIP respuesta-1
      janname=jan->empresa
      jannro=RECNO()
   ELSE
      janname='TODAS LAS EMPRESAS'
      jannro=0
   ENDIF
ELSE
   DO infic WITH RECCOUNT(ALIAS()),'INGRESE N§ DE EMPRESA A SELECCIONAR'
   IF respuesta<>0
      GOTO respuesta
      janname=jan->empresa
      jannro=RECNO()
   ELSE
      janname='TODAS LAS EMPRESAS'
      jannro=0
   ENDIF
ENDIF
@ 0,60 SAY PADL(janname,19,' ') COLOR I
@ 24,0 SAY SPACE(80)
RETURN

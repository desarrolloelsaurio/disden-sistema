*:*********************************************************************
*:
*:        Program: INFIC.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: ELIADI.PRG()   (function  in PROCESOS.PRG)
*:               : ELICAT.PRG()   (function  in PROCESOS.PRG)
*:               : ELICCOS.PRG()  (function  in PROCESOS.PRG)
*:               : ELICON.PRG()   (function  in PROCESOS.PRG)
*:               : ELIESP.PRG()   (function  in PROCESOS.PRG)
*:               : ELIGAS.PRG()   (function  in PROCESOS.PRG)
*:               : ELIJAN.PRG     (procedure in PROCESOS.PRG)
*:               : ELIJN.PRG()    (function  in PROCESOS.PRG)
*:               : ELIPAR.PRG()   (function  in PROCESOS.PRG)
*:               : ELIRET.PRG()   (function  in PROCESOS.PRG)
*:               : ELISAL.PRG()   (function  in PROCESOS.PRG)
*:               : ELITHOR.PRG()  (function  in PROCESOS.PRG)
*:               : ELIVAR.PRG()   (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:59               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: INFIC.PRG
*-- Fecha   : 26/09/89
*-- Version : G. REINER
*-- Notas   : INGRESA CANTIDAD DE REGISTROS EN FICHERO ACTIVO
*	      INGRESA TEXTO DEL PEDIDO DE INGRESO
*	      LA RESPUESTA SALE EN RESPUESTA (PUBLICA)
********************************************************************************
PARAMETER final,texto
ACTI SCREEN
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
tpe=TYPE('FINAL')
IF tpe='C'
   swp=final
   final=texto
   texto=swp
ENDIF
STORE 0 TO respuesta
@ 24,0 SAY PADC(ALLTRIM(texto),80,' ')
DEFINE WINDOW fic FROM 10,0 TO 14,77 DOUBLE TITL texto SHADOW COLOR SCHE 8
ACTI WINDOW fic
DO WHILE .T.
   @ 1,10 SAY "INGRESE FICHA ('0' PARA MENU) " GET respuesta
   READ
   IF respuesta>=0 .AND. respuesta<=final
      EXIT
   ELSE
      @ 1,1 SAY SPACE(70)
      STORE 0 TO respuesta
   ENDIF
ENDDO
RELE WINDOW fic
ACTI SCRE
@ 24,0 SAY SPACE(80)
RELE tpe,swp
RETURN
*: EOF: INFIC.PRG

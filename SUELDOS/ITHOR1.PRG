*:*********************************************************************
*:
*:        Program: ITHOR1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: ITHOR.PRG                     
*:               : CTHOR.PRG                     
*:               : IADI.PRG                      
*:               : CADI.PRG                      
*:               : IRET.PRG                      
*:               : CRET.PRG                      
*:
*:          Calls: INFIC.PRG
*:
*:      Documented 04/23/91 at 20:57               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: ITHOR1.PRG
*-- Fecha   : 15/9/90
*-- Version : G. REINER
*-- Notas   : INGRESA LA FORMULA PARA EL CALCULO
*             UNO1=DENOMINACION DEL POPUP
*             DOS1=VARIABLE DE CONTROL DEL POPUP
*             TRES1=CONTENIDO ANTERIOR DE LA VARIABLE DE LA FORMULA
*             CUATRO1=RENGLON EN EL QUE SE IMPRIMIRA
*             CINCO1=COLUMNA EN LA QUE SE IMPRIMIRA
*             SEIS1=VENTANA DE TRABAJO EN PROGRAMA ORIGEN
********************************************************************************
PARAMETER uno1,dos1,tres1,cuatro1,cinco1,seis1
ulpr=PROGRAM()
respu=ALLTRIM(tres1)
DO WHILE .T.
   IF dos1
      ACTI SCRE
      respuesta=0
      ACTI POPU &uno1
   ELSE
      DO infic WITH 'N§ del Factor a Ingresar',RECCOUNT()
   ENDIF
   IF respuesta=0
      EXIT
   ELSE
      IF dos1
         GOTO TOP
         SKIP respuesta-1
      ELSE
         GOTO respuesta
      ENDIF
      ACTI WIND &seis1
      respu=respu+LTRIM(RTRIM(contenido))
      @ cuatro1,cinco1 SAY respu COLO I
   ENDIF
ENDDO
RETURN
*: EOF: ITHOR1.PRG

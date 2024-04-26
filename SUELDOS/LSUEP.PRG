*:*********************************************************************
*:
*:        Program: LSUEP.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: PLANIL.PRG                    
*:
*:          Calls: ELIEMP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:47               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: lsuep.prg
*-- Fecha   : 01/14/91 04:07am
*-- Version : G. REINER
*-- Notas   : lista sueldos pagados en el periodo por pantalla
********************************************************************************
ulpr=PROGRAM()
DEFINE WINDOW win FROM 5,10 TO 20,69 DOUBLE TITL " Sueldo Pagado en el Per¡odo " SHAD COLOR SCHE 8
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO WHILE .T.
   IF eliemp(" a Listar")<>0
      GOTO respuesta
      ACTI WIND win
      @ 1,1 GET emp->apynom MESS 'Muestra Sueldos Pagados '+ALLTRIM(peraliq)
      @ 3,1 SAY 'Haberes con Descuento' COLOR SCHE 3
      @ 3,40 GET emp->haberret PICTURE '99999999999.99'
      @ 4,1 SAY 'Haberes sin Descuento' COLOR SCHE 3
      @ 4,40 GET emp->habersin PICTURE '99999999999.99'
      @ 5,1 SAY 'Adicionales con Descuento' COLOR SCHE 3
      @ 5,40 GET emp->adicret PICTURE '99999999999.99'
      @ 6,1 SAY 'Adicionales con Descuento' COLOR SCHE 3
      @ 6,40 GET emp->adicsin PICTURE '99999999999.99'
      @ 7,1 SAY 'Retenciones' COLOR SCHE 3
      @ 7,40 GET emp->reten PICTURE '99999999999.99'
      @ 8,1 SAY 'Salario Familiar' COLOR SCHE 3
      @ 8,40 GET emp->salar PICTURE '99999999999.99'
      @ 9,1 SAY 'Redondeo' COLOR SCHE 3
      @ 9,40 GET emp->redondeo PICTURE '99999999999.99'
      @ 10,1 SAY 'Neto a Percibir' COLOR SCHE 3
      @ 10,40 GET emp->total PICTURE '99999999999.99'
      @ 11,1 SAY 'Adelantos' COLOR SCHE 3
      @ 11,40 GET emp->adelan PICTURE '99999999999.99'
      @ 12,1 SAY 'Pagado' COLOR SCHE 3
      @ 12,40 SAY emp->total PICTURE '99999999999.99' COLOR I/W
      CLEAR GETS
      DO WHILE INKEY()=0
      ENDDO
   ELSE
      EXIT
   ENDIF
ENDDO
RELE WIND win
RETURN
*: EOF: LSUEP.PRG

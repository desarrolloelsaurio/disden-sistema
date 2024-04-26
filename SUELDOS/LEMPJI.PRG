*:*********************************************************************
*:
*:        Program: LEMPJI.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPJ.PRG                      
*:
*:          Calls: LEMPJI1.PRG
*:               : ELIEMP()       (function  in PROCESOS.PRG)
*:               : LEMPJI2.PRG
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:54               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LEMPJI.PRG
*-- Fecha   : 01/22/91 12:54pm
*-- Version : G. REINER
*-- Notas   : Derica a Impresi¢n de los legajos por impresora
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
fisc="memlines(texto)<>0"
DO CASE
CASE BAR()=1
   DO lempji1
CASE BAR()=2
   STORE 0 TO respuesta
   IF eliemp(" a Listar")<>0
      GOTO respuesta
      DO lempji2
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicat(" a Listar")<>0
      GOTO respuesta
      fisc=fisc+' .and. cat=recno("CAT")'
      DO lempji1
   ENDIF
CASE BAR()=4
   IF elicon(" a Listar")<>0
      GOTO respuesta
      fisc=fisc+' .and. con=recno("CON")'
      DO lempji1
   ENDIF
CASE BAR()=5
   IF eliccos(" a Listar")<>0
      GOTO respuesta
      fisc=fisc+' .and. ccos=recno("CCOS")'
      DO lempji1
   ENDIF
CASE BAR()=6
   IF eliesp(" a Listar")<>0
      GOTO respuesta
      fisc=fisc+' .and. esp=recno("ESP")'
      DO lempji1
   ENDIF
ENDCASE
RELE fisc
RETURN
*: EOF: LEMPJI.PRG

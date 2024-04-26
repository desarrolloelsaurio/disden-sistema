*:*********************************************************************
*:
*:        Program: IMPREC.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: VARI.PRG                      
*:               : IADE1.PRG                     
*:               : IADE1S.PRG                    
*:               : GADE1.PRG                     
*:               : GLADE1.PRG                    
*:
*:          Calls: SINO()         (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 19:53               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: IMPREC.PRG
*-- Fecha   : 12/12/90 07:50pm
*-- Version : G. REINER
*-- Notas   : IMPRIME RECIBOS DE ADELANTO
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 9,20 TO 13,60 TITL ' Imprime Comprob. de Adelantos ? ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,1 SAY 'IMPRIME COMPR. DE ADELANTO ? ' COLOR SCHE 3
vez=1
dr=IIF(imprec,'SI','NO')
DO WHILE vez=1
   vez=2
   ptr=sino(imprec)
   @ 1,33 GET dr PICTURE ptr;
      MESS 'Cambie Opciones con la Barra'
   READ
ENDDO
imprec=IIF(dr="SI",.T.,.F.)
RELE WIND win
RELE vez,dr,ptr
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: IMPREC.PRG

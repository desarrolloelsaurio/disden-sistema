********************************************************************************
*-- Programa: adios.prg
*-- Fecha   : 01/18/91 10:50am
*-- Version : G. REINER
*-- Notas   : cierra archivos, graba variables y sale del sistema
********************************************************************************
ulpr=PROGRAM()
@ 24,0 SAY PADC("Cerrando Archivos y Saliendo del Sistema",80,"*") COLOR SCHE 19
DO CASE
CASE BAR()=2
A=PATH+"\TOTAL"
RELE PATH,meses,pq,num,indice,ptn,tfr,canrec,dps
RELE cheba,cheno,chenu,TABULA,CHEFE
SAVE TO &a
   QUIT
ENDCASE
RETURN
*: EOF: ADIOS.PRG

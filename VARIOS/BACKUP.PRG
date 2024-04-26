********************************************************************************
*-- Programa: backup.prg
*-- Fecha   : 01/22/91 05:30pm
*-- Version : g. reiner
*-- Notas   : genera backups de archivos
********************************************************************************
ulpr=hora_ulp(PROGRAM())
SAVE SCRE TO NADA
DEFINE WINDOW win FROM 10,0 TO 14,77 DOUBLE TITL ' Back-Up ' SHAD COLOR SCHE 8
ACTI WINDOW win
respuesta='NO'
@ 1,1 SAY "Realiza Copias de Seguridad ? " GET respuesta MESS 'Copias de Seguridad'
READ
ACTI SCRE
IF respuesta='SI'
   CLOSE DATA
   @ 24,0 SAY PADC(" Efectuando Copias - Espere por Favor ",80,"*") COLOR SCHE 19
   ACTI WIND win
   respuesta=PATH+"\PRODUCZ.EXE"
   @ 1,0 SAY PADC(" El archivo de Destino ser :"+respuesta+" ",78,'-') COLOR SCHE 19
   ACTI WINDOW win
   @ 23,0 SAY PADC(" El archivo de Destino ser :"+respuesta+" ",78,'-') COLOR SCHE 19
RUN FOXSWAP /0 pkzip PRODUCZ *.dbf *.idx *.mem *.fpt *.ftp
RUN FOXSWAP /0 zip2exe PRODUCZ
RUN FOXSWAP /0 del *.zip
REST SCRE FROM NADA
run FOXSWAP /0 c:\dos\backup &respuesta A:
CLEA
   ACTI SCRE
   @ 24,0 SAY PADC(" Terminado de Copiar ",80,"*") COLOR SCHE 19
ENDIF
CLEA
REST SCRE FROM NADA
RETURN


*
*                           SELECCIONA EL REPORTE
*
* SELREPOR.PRG
*
store "SELECCION DE REPORTE" to TITULO
if haycue()
   =RECUADRO(6,25,10,55)
   @ 1,2 say "Reporte"
   store "     " to KREPORTE
   @ 1,18 get KREPORTE PICT "!!!!!"
   read
   if !EMPTY(KREPORTE)
       IF !CONFIRMA()
          store "     " to KREPORTE         
       ENDIF
   ENDIF
ENDIF
=MEN_LIN(SYSNOMBRE)
RETURN
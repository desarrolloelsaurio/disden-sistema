*
*                   FIJA EL PERIODO INICIAL DEL EJERCICIO
*
* FIJPERIN.PRG
*
store "PERIODO INICIAL DEL EJERCICIO" to TITULO
do RECUADRO
@10,10 say "Mes de inicio del ejercicio"
do while .t.
   @10,38 get KPERINIC PICT "##" range 1,12
   read
   store "S" to RES
   @21,30 SAY "Confirma (S/N)"
   @21,45 get RES PICT PAIP valid RES="S" .or. RES="N"
   read
   @21,1 SAY SPACE(75)
   if RES="S"
      exit
   endif
enddo
return

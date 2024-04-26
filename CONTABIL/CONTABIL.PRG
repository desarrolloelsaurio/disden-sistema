*
*                          SISTEMA DE CONTABILIDAD  (version CLIPPER '87)
*
* NOMBRE: CONTABIL.PRG                                <C>  MARCELO FONT 1990
*                                                    Tco. Nac. en Computacion
*
set date american
set decimal to 2
set escape off
set safety off
set scoreboard off
set status off
set echo off
set talk off
set bell off
set delete on
set confirm on
set debug off
declare KASIENTO[12], KMOVIMIENTO[12], KMESES[12]
public TITULO,EMPRESA,KPERINIC,KPERIODO,KREPORTE,PRINCIPIO,CLIPPER,XCOMP,XVTA,XCRFV,XDBFV,XCRFC,XDBFC,TIVA1,TIVA2,PROPIOIVA,OP,HAYCUE,HAYMOV,RES
store "SISTEMA DE CONTABILIDAD" to TITULO
store "                   " to EMPRESA    && nombre de la empresa 19 caract.
do APERTURA
do RECUADRO
? chr(7)
@8,32 say "Buenos Dias !!!"
@10,10 say "Ingrese clave de acceso: "
store " " to CLAVE
store 1 to C
store 0 to XX
do while XX#13
   store inkey() to XX
   if XX=0
      loop
   endif
   store CLAVE+chr(XX) to CLAVE
   @10,C+36 say "X"
   store C+1 to C
enddo
@21,1 SAY SPACE(75)
if upper(CLAVE)#" MRCL"
   ? chr(7)
   @21,30 SAY "ACCESO DENEGADO..."
   store 1 to C
   do while C<150
      store C+1 to C
   enddo
   clear
   quit
endif
do PRINCIP
do GRABA
close all
clear all
clear
quit

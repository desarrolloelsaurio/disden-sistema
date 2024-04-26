********************************************************************************
*-- Programa: LFAK.PRG
*-- Fecha   : 05-20-92 02:32am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE FACTURAS POR COSTO
********************************************************************************
parameter porpan
ULPR=HORA_ULP(PROGRAM())
CANT_MAX=8
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
=VAR_FAC()
store "" to ttque,fisc
store .t. to habilitado
store 1 to filemp,filfac,filcli,filfec,filvia,filpag,filmon,filmer
do while queryfac(PORPAN)
   if filmer=1
      =acopy(habilitado,habilant)
      do while CFGFAC()
         =IIF(PORPAN,LFACPC(),LFACIC())
         store .f. to variable
      ENDdo
      store .f. to variable
      =acopy(habilant,habiitado)
   else
      =Iif(porpan,lfacpcd(),lfacicd())
   endif
ENDdo
RETURN

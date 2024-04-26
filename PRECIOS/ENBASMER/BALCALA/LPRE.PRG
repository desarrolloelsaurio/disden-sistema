********************************************************************************
*-- Programa: LPREP.PRG
*-- Fecha   : 08/26/91 11:18am
*-- Version : G. REINER
*-- Notas   : DERIVA A lista de precios
*-- Modificaci¢n 05-16-92 01:19am GOYO
********************************************************************************
parameter porpan
EXTERNAL ARRAY TEXTO,VARIABLE,Habilitado
CANT_MAX=11
DIME TEXTO[CANT_MAX,2],VARIABLE[CANT_MAX],Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,1]='ARTICULO'
TEXTO[2,1]='DENOMINACION'
TEXTO[3,1]='COSTO'
TEXTO[4,1]='% '+UPPER(XALIS1)
TEXTO[5,1]='% '+UPPER(XALIS2)
TEXTO[6,1]='% '+UPPER(XALIS3)
TEXTO[7,1]='% '+UPPER(XALIS4)
TEXTO[8,1]='Pcio. '+UPPER(XALIS1)
TEXTO[9,1]='Pcio. '+UPPER(XALIS2)
TEXTO[10,1]='Pcio. '+UPPER(XALIS3)
TEXTO[11,1]='Pcio. '+UPPER(XALIS4)
TEXTO[1,2]=10
TEXTO[2,2]=30
TEXTO[3,2]=XACDIGI
TEXTO[4,2]=XACDIGI
TEXTO[5,2]=XACDIGI
TEXTO[6,2]=XACDIGI
TEXTO[7,2]=XACDIGI
TEXTO[8,2]=XACDIGI
TEXTO[9,2]=XACDIGI
TEXTO[10,2]=XACDIGI
TEXTO[11,2]=XACDIGI
STORE '' TO FISC
store "" to ttque
store .t. to habilitado
store 1 to FILMER,FILPRE,FILART
=acopy(habilitado,habilant)
do while querypre(PORPAN)
   =acopy(habilitado,habilant)
   do while CFGFAC()
      tt=alltrim('Lista de Precios '+ttque)
      IF M.PORPAN
         DO lprep
      ELSE
         DO lprei
      ENDIF
      store .f. to variable
   ENDdo
   store .f. to variable
   =acopy(habilant,habilitado)
ENDdo
return

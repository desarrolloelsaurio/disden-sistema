********************************************************************************
*-- Programa: LSTO.PRG
*-- Fecha   : 06-04-92 03:33am
*-- Version : G. REINER
*-- Notas   : DERIVA A lista de STOCK
*-- VERSION NAZA (MODIFICACION 06-04-92 03:48am)
********************************************************************************
parameter porpan
CANT_MAX=8
DIME TEXTO[CANT_MAX,2],VARIABLE[CANT_MAX],Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,1]='ARTICULO'
TEXTO[2,1]='DENOMINACION'
TEXTO[3,1]='STOCK'
TEXTO[4,1]='STOCK MAXIMO'
TEXTO[5,1]='STOCK MINIMO'
TEXTO[6,1]='STOCK RESERVADO'
TEXTO[7,1]='DIFERENCIA'
TEXTO[8,1]='VALORIZACION'
TEXTO[1,2]=10
TEXTO[2,2]=30
TEXTO[3,2]=XACDIGI
TEXTO[4,2]=XACDIGI
TEXTO[5,2]=XACDIGI
TEXTO[6,2]=XACDIGI
TEXTO[7,2]=XACDIGI
TEXTO[8,2]=XACDIGI
STORE '' TO FISC,resta
store "" to ttque
store .t. to habilitado
store 1 to FILMER,FILSTO,FILsto,FILART,filxxx
=acopy(habilitado,habilant)
do while querySTO(PORPAN)
   =acopy(habilitado,habilant)
   do while CFGFAC()
      tt='Listado de Stock'+IIF(!EMPTY(ttque),TTQUE,"")
      IF M.PORPAN
         DO lSTOp
      ELSE
         DO lSTOi
      ENDIF
      store .f. to variable
   ENDdo
   store .f. to variable
   =acopy(habilant,habilitado)
ENDdo
return

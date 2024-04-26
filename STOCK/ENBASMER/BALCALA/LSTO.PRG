********************************************************************************
*-- Programa: LSTO.PRG
*-- Fecha   : 05/22/92 12:13pm
*-- Version : G. REINER
*-- Notas   : DERIVA A lista de STOCK
********************************************************************************
parameter porpan
EXTERNAL ARRAY TEXTO,VARIABLE,Habilitado
CANT_MAX=9
DIME TEXTO[CANT_MAX,2],VARIABLE[CANT_MAX],Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,1]='ARTICULO'
TEXTO[2,1]='DENOMINACION'
TEXTO[3,1]='STOCK'
TEXTO[4,1]='STOCK MAXIMO'
TEXTO[5,1]='STOCK MINIMO'
TEXTO[6,1]='STOCK RESERVADO'
TEXTO[7,1]='STOCK EN PESO'
TEXTO[8,1]='DIFERENCIA'
TEXTO[9,1]='VALORIZACION'
TEXTO[1,2]=LEN(MER.ARTICULO)
TEXTO[2,2]=30
TEXTO[3,2]=XACDIGI
TEXTO[4,2]=XACDIGI
TEXTO[5,2]=XACDIGI
TEXTO[6,2]=XACDIGI
TEXTO[7,2]=XACDIGI
TEXTO[8,2]=XACDIGI
TEXTO[9,2]=XACDIGI
STORE '' TO FISC,resta
store "" to ttque
store .t. to habilitado
store 1 to FILMER,FILSTO,FILsto
STORE haycampo("DISCRIM","MER") TO M.HAYDISC
store  M.HAYDISC TO HABILITADO[7]
=acopy(habilitado,habilant)
do while querySTO(PORPAN)
   =acopy(habilitado,habilant)
   do while CFGFAC()
      tt=alltrim('Listado de Stock '+ttque)
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

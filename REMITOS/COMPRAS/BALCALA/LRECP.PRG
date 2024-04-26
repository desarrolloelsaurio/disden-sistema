********************************************************************************
*-- Programa: LRECP.PRG
*-- Fecha   : 05-20-92 02:32am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE REMITOS
********************************************************************************
parameter porpan
EXTERNAL ARRAY TEXTO,VARIABLE,Habilitado
CANT_MAX=7
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,2] =14
TEXTO[2,2] =8
TEXTO[3,2] =20
TEXTO[4,2] =14
TEXTO[5,2] =8
TEXTO[6,2] =14
TEXTO[7,2] =8

TEXTO[1,1] ='REMITO'
TEXTO[2,1] ='FECHA EMISION'
TEXTO[3,1] ='PROVEEDOR'
TEXTO[4,1] ='N§ PEDIDO;'
TEXTO[5,1] ='F. PEDIDO'
TEXTO[6,1] ='N§ FACTURA'
TEXTO[7,1] ='F. FACTURA'

store "" to ttque
store .t. to habilitado
store 1 to filemp,filfac,filpro,filfec,filGAS,filpag,filmon,filmer,filven
FISC=''
do while queryREC(PORPAN)
IF FILMER#4
   IF FILFAC=3 .or. filfec=3 .OR. FILpro=3
      IF PORPAN
         DO LRECPR
      ELSE
         DO LRECIR
      ENDIF
   ELSE
      if filmer=2 .OR. FILMER=3
         TT=TTQUE
         IF PORPAN
            DO LRECPy
         ELSE
            DO LRECIy
         ENDIF
      else
         =acopy(habilitado,habilant)
         do while CFGFAC() .AND. FILFAC#2
            IF PORPAN
               DO LRECPZ
            ELSE
               DO LRECIZ
            ENDIF
            store .f. to variable
         ENDdo
         store .f. to variable
         =acopy(habilant,habilitado)
      endif
   ENDIF
   ENDIF
ENDdo
RETURN

******************************************************************************
*-- Programa: LSBO.PRG
*-- Fecha   : 07-27-92 09:13am
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A LISTADO DE BANCOS
********************************************************************************
parameter porpan
private porpan
CANT_MAX=13
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,1]='CUENTA'
TEXTO[2,1]='CLIENTE/PROVEEDOR'
TEXTO[3,1]='GASTO'
TEXTO[4,1]='FECHA OPERACION'
TEXTO[5,1]='COMPROBANTE'
TEXTO[6,1]='NUMERO'
TEXTO[7,1]='ORIGEN'
TEXTO[8,1]='MONTO'
TEXTO[9,1]='MONEDA'
TEXTO[10,1]='EQUIV DOLAR'
TEXTO[11,1]='NUMERO CHEQUE'
TEXTO[12,1]='FECHA DEPOSITO'
TEXTO[13,1]='USUARIO'
TEXTO[1,2]=35
TEXTO[2,2]=20
TEXTO[3,2]=15
TEXTO[4,2]=8
TEXTO[5,2]=12
TEXTO[6,2]=13
TEXTO[7,2]=10
TEXTO[8,2]=XACDIGI
TEXTO[9,2]=2
TEXTO[10,2]=XACDIGI
TEXTO[11,2]=10
TEXTO[12,2]=8
TEXTO[13,2]=10
STORE '' TO FISC
store "" to ttque
store .t. to habilitado
store 1 to FILBAN,FILFEC,FILOPE
do while querySbo(PORPAN)
   IF FILBAN=2 .or. filfec=3
      IF M.PORPAN
         IF filfec=3
            DO LSBOPX
         ELSE
            DO LSBOPR
         endif
      ELSE
         IF filfec=3
            DO LSBOIX
         ELSE
            DO LSBOIR
         endif
      ENDIF
   ELSE
      =acopy(habilitado,habilant)
      do while CFGFAC()
         IF PORPAN
            DO LSBOPz
         ELSE
            DO LSBOIz
         ENDIF
         store .f. to variable
      ENDdo
      store .f. to variable
      =acopy(habilant,habiitado)
   endif
ENDdo
RETURN

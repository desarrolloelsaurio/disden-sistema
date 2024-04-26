********************************************************************************
*-- Programa: LFAC.PRG
*-- Fecha   : 05-20-92 02:32am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE FACTURAS, NOTAS DE DEBITO Y CREDITO
********************************************************************************
parameter porpan
CANT_MAX=14
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,2] =13
TEXTO[2,2] =8
TEXTO[3,2] =8
TEXTO[4,2] =2
TEXTO[5,2] =20
TEXTO[6,2] =20
TEXTO[7,2] =20
TEXTO[8,2] =XACDIGI
TEXTO[9,2] =XACDIGI
TEXTO[10,2]=XACDIGI
TEXTO[11,2]=XACDIGI
TEXTO[12,2]=XACDIGI
TEXTO[13,2]=XACDIGI
TEXTO[14,2]=XACDIGI
TEXTO[1,1] =TIT_INVO
TEXTO[2,1] ='FECHA EMISION'
TEXTO[3,1] ='FECHA VENCIMIENTO'
TEXTO[4,1] ='TIPO COMPROBANTE'
TEXTO[5,1] ='CLIENTE'
TEXTO[6,1] =UPPER(BIAJA)
TEXTO[7,1] ='CONDICION DE VENTA'
TEXTO[8,1] ='MONTO BRUTO'
TEXTO[9,1]='DESCUENTO'
TEXTO[10,1] ='NETO GRAVADO'
TEXTO[11,1]='MONTO '+XACI(1)
TEXTO[12,1]='MONTO '+XACI(2)
TEXTO[13,1]='MONTO '+XACI(3)
TEXTO[14,1]='MONTO TOTAL'
store "" to ttque
store .t. to habilitado
store 1 to filemp,filfac,filcli,filfec,filvia,filpag,filmon,filmer,FILART,FILASG
FISC=''
do while queryfac(PORPAN)
IF FILMER#4
   IF FILFAC=3 .or. filfec=3 .or. filvia=3 .OR. FILCLI=3
      IF PORPAN
         DO LFACPR
      ELSE
         DO LFACIR
      ENDIF
   ELSE
      if filmer=2 .OR. FILMER=3
         TT=TTQUE
         IF PORPAN
            DO LFACPy
         ELSE
            DO LFACIy
         ENDIF
      else
         =acopy(habilitado,habilant)
         do while CFGFAC() .AND. FILFAC#2
            IF PORPAN
               DO LFACPz
            ELSE
               DO LFACIz
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

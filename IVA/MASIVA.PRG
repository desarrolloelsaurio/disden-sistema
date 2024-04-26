*********************************************************************
*-- Programa: MASIVA.PRG
*-- Fecha   : 06-08-92 11:10pm
*-- Versi¢n : G. REINER
*-- Notas   : DEVUELVE EL MONTO INGRESADO, AFECTADO POR EL IVA
*--           CORRESPONDIENTE, BASADO EN LA MATRIZ XACIVA
**********************************************************************
function MASIVA
PARAMETER MSMONTO,MSCOND
PRIVATE MSMONTO,MSCOND,SALIDA,MS
STORE NUL TO SALIDA
FOR MS=1 TO 3
   IF !EMPTY(XACI[MS])
      IF XACIVA[MSCOND,MS*2+1]='SI'
         SALIDA=SALIDA+XACIVA[MSCOND,MS*2]
      ENDIF
   ENDIF
ENDF
RETURN IIF(EMPTY(SALIDA),MSMONTO,PORCEN(MSMONTO,SALIDA))

FUNCTION AR_STORE
PARAMETER ARREGLO,INICIO,FIN,AR_INI,AR_FIN,PIC1,CONT2,CONT3
PRIV ARREGLO,INICIO,FIN,AR_INI,AR_FIN,CONT1,CONT1,CONT2,CONT3,CT
IF PARAMETER()<4
   AR_INI=1
   AR_FIN=1
   COL1=1
   PIT1=''
ENDIF
DIME CT[3],CO[3]
CT[1]=CONT1
CT[2]=CONT2
CT[3]=CONT3
FOR PUNTER=INICIO TO FIN
   FOR PUNTER1=AR_INI TO AR_FIN
      IF AR_INI=AR_FIN .AND. AR_INI=1
         STORE CT[PUNTER1] TO ARREGLO[PUNTER1]
      ELSE
         STORE CT[PUNTER1] TO ARREGLO[PUNTER,PUNTER1]
      ENDIF
   NEXT
NEXT
RETURN .T.

close data
SELE 0
USE PROCFAB ALIAS PRC ORDER PRCCOD
SELE 0
USE MIXTA ALIAS MIX ORDER TAG ETACOD
SELE 0
USE TALLERES ALIAS TAL ORDER TAG TALCOD
SELE 0
use uno ALIAS FAX
STORE 0 TO elnum,PUNTERO
scan
   if FAX.NUMERO#elnum
      IF !EMPTY(ELNUM)
         CANTIDAD=CA[1]
         STORE .T. TO OK
         FOR A=1 TO PUNTERO
            IF CA[A]#CANTIDAD
               STORE .F. TO OK
               EXIT
            ENDIF
         NEXT
         IF !OK
            ?"|"
            ?? STR(ELNUM,5)
            ?? "|"
            FOR A=1 TO PUNTERO
                ?? STR(CA[A],4)
                ?? "/"
                ?? STR(CA1[A],4)             
                ?? "|"
            NEXT
        ENDIF
      ENDIF
      elnum=FAX.NUMERO
      STORE 0 TO PUNTERO
      RELE RE,CA,TA
      DIME RE[1],CA[1],TA[1],CA1[1],PO[1]
      STORE 0 TO CA[1],CA1[1]
   ENDIF
   ESERRE=(LEFT(REMITO,1)="R")
   POSI=ASCAN(RE,LEFT(REMITO,14))
   IF EMPTY(POSI) 
      IF ESERRE
         POSI=ASCAN(TA,FAX.TALLER)
      ENDIF
      IF EMPTY(POSI)
         PUNTERO=PUNTERO+1
         DIME RE[PUNTERO],CA[PUNTERO],TA[PUNTERO],CA1[PUNTERO],PO[PUNTERO]
         RE[PUNTERO]=FAX.REMITO
         CA[PUNTERO]=FAX.SSC
         TA[PUNTERO]=FAX.TALLER
         CA1[PUNTERO]=0
         PO[PUNTERO]=POSIC
      ELSE
         IF ESERRE
            CA1[POSI]=CA1[POSI]+SSC               
         ELSE
            CA[POSI]=CA[POSI]+SSC
         ENDIF
      ENDIF
   ELSE
      IF ESERRE
         CA1[POSI]=CA1[POSI]+SSC      
      ELSE
         CA[POSI]=CA[POSI]+SSC
      ENDIF
   ENDIF
   SELE FAX
endscan

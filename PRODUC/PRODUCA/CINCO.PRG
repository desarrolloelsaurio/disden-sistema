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
         CANTIDAD=UNO[1]
         STORE .T. TO OK
         FOR A=1 TO PUNTERO
            IF UNO[A]#CANTIDAD .OR. ;
               DOS[A]#CANTIDAD .OR. ;
               TRES[A]#CANTIDAD .OR. ;
               CUATRO[A]#CANTIDAD 
               STORE .F. TO OK
               EXIT
            ENDIF
         NEXT
         IF !OK
            ?"|"
            ?? STR(ELNUM,5)
            ?? "|"
            FOR A=1 TO PUNTERO
                ?? STR(UNO[A],4)
                ?? "/"
                IF EMPTY(CA1[A])
                ?? SPACE(4)
                ELSE
                ?? STR(CA1[A],4)             
                ENDIF
                ?? "-"
                ?? STR(CUATRO[A],4)
                ?? "->"
            NEXT
        ENDIF
      ENDIF
      elnum=FAX.NUMERO
      STORE 0 TO PUNTERO
      RELE RE,CA,TA
      DIME RE[1],UNO[1],TA[1],CA1[1],PO[1],;
      DOS[1],TRES[1],CUATRO[1]
      STORE 0 TO UNO[1],CA1[1],DOS[1],TRES[1],CUATRO[1]
   ENDIF
   ESERRE=(LEFT(REMITO,1)="R")
   POSI=ASCAN(RE,LEFT(REMITO,14))
   IF EMPTY(POSI) 
      IF ESERRE
         POSI=ASCAN(TA,FAX.TALLER)
      ENDIF
      IF EMPTY(POSI)
         PUNTERO=PUNTERO+1
         DIME RE[PUNTERO],UNO[PUNTERO],TA[PUNTERO],CA1[PUNTERO],PO[PUNTERO],;
      DOS[PUNTERO],TRES[PUNTERO],CUATRO[PUNTERO]
         RE[PUNTERO]=FAX.REMITO
         UNO[PUNTERO]=FAX.EEC
         DOS[PUNTERO]=FAX.ESC
         TRES[PUNTERO]=FAX.SEC
         CUATRO[PUNTERO]=FAX.SSC
         TA[PUNTERO]=FAX.TALLER
         CA1[PUNTERO]=0
         PO[PUNTERO]=POSIC
      ELSE
         IF ESERRE
            CA1[POSI]=CA1[POSI]+SSC               
         ELSE
            UNO[POSI]=UNO[POSI]+EEC
            DOO[POSI]=DOS[POSI]+ESC
            TRES[POSI]=TRES[POSI]+SEC
            CUATRO[POSI]=CUATRO[POSI]+SSC                                    
         ENDIF
      ENDIF
   ELSE
      IF ESERRE
         CA1[POSI]=CA1[POSI]+SSC      
      ELSE
            UNO[POSI]=UNO[POSI]+EEC
            DOS[POSI]=DOS[POSI]+ESC
            TRES[POSI]=TRES[POSI]+SEC
            CUATRO[POSI]=CUATRO[POSI]+SSC                                    
      ENDIF
   ENDIF
   SELE FAX
endscan

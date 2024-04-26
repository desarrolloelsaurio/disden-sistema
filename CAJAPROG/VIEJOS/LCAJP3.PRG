********************************************************************************
*-- Programa: LCAP3.PRG
*-- Fecha   : 11/06/91
*-- Version : V.LEEGSTRA
*-- Notas   : LISTADO DE CAJA, INGRESOS Y EGRESOS
********************************************************************************
SELE Seg
STORE PROGRAM() TO ulpr
SEEK ulpr
IF coefseg=1 .OR. (coefseg<=cseg .AND. sistseg=sistema)
   SELE caj
   GO TOP
   DO win0
   acti wind win
   STORE 1 TO pag
   DO cabpan
   STORE "|FECHA OP|"+padc('EFECTIVO',15)+PAIP+padc('DOCUMENTOS',15)+PAIP+padc('CHEQUES PROPIOS',15)+PAIP+padc('CHEQUES 3ros.',15)+PAIP TO acla
   STORE REPL("=",LEN(acla)) TO lns
   tt='Listado de Caja, ingresos y egresos'
   _wrap=.T.
   _alignment='CENTER'
   ? tt
   ? lns
   ? acla
   ? lns
   DIME TOTAL[4]
   STORE 0 TO TOTAL
   STORE .F. TO imprime
   STORE 0 TO naopefe,naopdo,naopche,naopcht,nareefe,naredo,nareche,narecht
   IF caj.compre="OP"
      STORE "OP" TO nacompre
      STORE caj.numere TO nanumere
   ELSE
      IF LEFT(caj.compr,2)="RE"
         STORE "RE" TO nacompre
         STORE AT("§",caj.compr) TO nada
         STORE SUBSTR(caj.compr,nada+1,LEN(caj.compr)-1) TO nada1
         STORE VAL(nada1) TO nanumere
      ENDIF
   ENDIF
   STORE caj.fechaop TO nafechop
   SCAN for &fisc
      IF ROW()>20
         ? LEFT(lns,LEN(lns)-4)
         ?? '\\\\'
         =INKEY(0)
         IF LASTKEY()=27
            EXIT
         ENDIF
         CLEA
         STOR pag+1 TO pag
         DO cabpan
         ? tt
         _wrap=.F.
         ? lns
         ? acla
         ? lns
      ENDIF
      IF caj.compre="OP"
         IF caj.numere=nanumere
            IF EMPTY(caj.caja)
               STORE naopefe+caj.monto TO naopefe
            ELSE
               IF caj.caja=-1
                  STORE naopdo+caj.monto TO naopdo
               ELSE
                  IF caj.caja>0
                     STORE naopche+caj.monto TO naopche
                  ENDIF
               ENDIF
            ENDIF
         ELSE
            STORE .T. TO imprime
         ENDIF
      ELSE
         IF LEFT(caj.compr,2)="RE"
            STORE "RE" TO nacompre
            STORE AT("§",caj.compr) TO nada
            STORE SUBSTR(caj.compr,nada+1,LEN(caj.compr)-1) TO nada1
            IF VAL(nada1)=nanumere
               IF EMPTY(caj.caja)
                  STORE nareefe+caj.monto TO nareefe
               ELSE
                  IF caj.caja=-1
                     STORE naredo+caj.monto TO naredo
                  ELSE
                     IF caj.caja>0
                        STORE nareche+caj.monto TO nareche
                     ENDIF
                  ENDIF
               ENDIF
            ELSE
               STORE .T. TO imprime
            ENDIF
         ENDIF
      ENDIF
      IF imprime
         SELE cch
         GO TOP
         IF nacompre="OP"
            SUM cch.monto FOR (cch.compre="OP" .AND. cch.numere=nanumere) TO naopcht
         ELSE
            SUM cch.monto FOR (cch.compre="RE" .AND. cch.numere=nanumere) TO narecht
         ENDIF
         SELE caj
         ?PAIP
         ?? nafechop
         ?? '|'
         nada1=nareefe-naopefe
         ?? STR(nada1,15,2)
         ?? PAIP
         nada2=naredo-naopdo
         ?? STR(nada2,15,2)
         ?? PAIP
         nada3=nareche-naopche
         ?? STR(nada3,15,2)
         ?? PAIP
         nada4=narecht-naopcht
         ?? STR(nada4,15,2)
         ?? PAIP
         STORE nada1+TOTAL[1]  TO TOTAL[1]
         STORE nada2+TOTAL[2]  TO TOTAL[2]
         STORE nada3+TOTAL[3]  TO TOTAL[3]
         STORE nada4+TOTAL[4]  TO TOTAL[4]
         STORE 0 TO naopefe,naopdo,naopche,naopcht,nareefe,naredo,nareche,narecht
         IF caj.compre="OP"
            STORE "OP" TO nacompre
            STORE caj.numere TO nanumere
         ELSE
            IF LEFT(caj.compr,2)="RE"
               STORE "RE" TO nacompre
               STORE AT("§",caj.compr) TO nada
               STORE SUBSTR(caj.compr,nada+1,LEN(caj.compr)-1) TO nada1
               STORE VAL(nada1) TO nanumere
            ENDIF
         ENDIF
         STORE caj.fechaop TO nafechop
         STORE .F. TO imprime
      IF caj.compre="OP"
         IF caj.numere=nanumere
            IF EMPTY(caj.caja)
               STORE naopefe+caj.monto TO naopefe
            ELSE
               IF caj.caja=-1
                  STORE naopdo+caj.monto TO naopdo
               ELSE
                  IF caj.caja>0
                     STORE naopche+caj.monto TO naopche
                  ENDIF
               ENDIF
            ENDIF
         ELSE
            STORE .T. TO imprime
         ENDIF
      ELSE
         IF LEFT(caj.compr,2)="RE"
            STORE "RE" TO nacompre
            STORE AT("§",caj.compr) TO nada
            STORE SUBSTR(caj.compr,nada+1,LEN(caj.compr)-1) TO nada1
            IF VAL(nada1)=nanumere
               IF EMPTY(caj.caja)
                  STORE nareefe+caj.monto TO nareefe
               ELSE
                  IF caj.caja=-1
                     STORE naredo+caj.monto TO naredo
                  ELSE
                     IF caj.caja>0
                        STORE nareche+caj.monto TO nareche
                     ENDIF
                  ENDIF
               ENDIF
            ELSE
               STORE .T. TO imprime
            ENDIF
         ENDIF
      ENDIF
      ENDIF
   ENDSCAN
         SELE cch
         GO TOP
         IF nacompre="OP"
            SUM cch.monto FOR (cch.compre="OP" .AND. cch.numere=nanumere) TO naopcht
         ELSE
            SUM cch.monto FOR (cch.compre="RE" .AND. cch.numere=nanumere) TO narecht
         ENDIF
         SELE caj
         ?PAIP
         ?? nafechop
         ?? '|'
         nada1=nareefe-naopefe
         ?? STR(nada1,15,2)
         ?? PAIP
         nada2=naredo-naopdo
         ?? STR(nada2,15,2)
         ?? PAIP
         nada3=nareche-naopche
         ?? STR(nada3,15,2)
         ?? PAIP
         nada4=narecht-naopcht
         ?? STR(nada4,15,2)
         ?? PAIP
         STORE nada1+TOTAL[1]  TO TOTAL[1]
         STORE nada2+TOTAL[2]  TO TOTAL[2]
         STORE nada3+TOTAL[3]  TO TOTAL[3]
         STORE nada4+TOTAL[4]  TO TOTAL[4]
   ? lns
   ? "|TOTALES:|"+STR(TOTAL[1],15,2)+PAIP+STR(TOTAL[2],15,2)+PAIP+STR(TOTAL[3],15,2)+PAIP+STR(TOTAL[4],15,2)+PAIP
   ? lns
   =INKEY(0)
   RELE wind win
   DO iaud WITH 'INGRESO A '+ulpr
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LCAJP3.PRG

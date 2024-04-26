********************************************************************************
*-- Programa: LCAJI3.PRG
*-- Fecha   : 11/06/91
*-- Version : V.LEEGSTRA
*-- Notas   : IMPRESION DE CAJA ,INGRESOS Y EGRESOSO, POR IMPRESORA
********************************************************************************
PARAMETER nadregi
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   SELE caj
   GO TOP
	 mxrn=66
   STORE "|FECHA OP|"+padc('EFECTIVO',15)+PAIP+padc('DOCUMENTOS',15)+PAIP+padc('CHEQUES PROPIOS',15)+PAIP+padc('CHEQUES 3ros.',15)+PAIP TO acla
   STORE REPL("=",LEN(acla)) TO lns
   tt='Listado de Caja, ingresos y egresos'
   STORE LEN(acla) TO largo
   STORE MIN(xacancho,xachoja) TO largoim
   acti SCRE
   @ 24,0 SAY padc('IMPRIMIENDO LOS DATOS REQUERIDOS - [TECLA] Interrumpe',80,'*') COLO sche 19
   IF (largoim=80 .AND. largo>132) .OR. (largoim=132 .AND. largo>233)
      A=PATH+"\"+LEFT(sincosas(janname),8)+'.TXT'
      acti SCRE
      @ 24,0 SAY padc("Imprimiendo Listado en Archivo "+Alltrim(A),80) COLO sche 19
      SET PRINTER TO FILE &a
      mxrn=IIF(largoim>80,53,63)
   ENDIF
   ********
   *set prin to nada.txt
   *******
   DO cabpri
   _pcopies=1
   printjob
   DO cabpri1
   ? tt style 'u'
   ? Alltrim(janname) style 'u'
   ?
   ?lns
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
   SCAN FOR &fisc
      IF _plineno>mxrn
         ? LEFT(lns,largo-3)
         ?? '///'
         EJECT page
         _rmargin=80
         _wrap=.F.
         ?
         DO cabpri1 WITH ulpr
         IF largo>largoim
            _rmargin=IIF(largoim>80,233,132)
            ??? CHR(15)
         ENDIF
         ? tt+' - Continuaci¢n' style 'u'
         ? Alltrim(janname) style 'u'
         ?
         ? lns
         ? acla
         ? lns
      ENDI
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
         ?? PAIP
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
   ?? PAIP
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
   _wrap=.F.
   ?
   EJECT page
   ?
   endp
   ON KEY LABEL shift-f1 DO hlp
	 do finimp
   _rmargin=80
   _wrap=.F.
   DO iaud WITH 'INGRESO A '+ulpr
ELSE
   DO iaud WITH 'ING ILEGAL '+ulpr
ENDIF
acti SCRE
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LCAJI3.PRG

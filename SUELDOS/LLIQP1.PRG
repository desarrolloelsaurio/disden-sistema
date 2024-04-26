*:*********************************************************************
*:
*:        Program: LLIQP1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LLIQP.PRG                     
*:
*:      Documented 04/23/91 at 20:54               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LLIQP1.PRG
*-- Fecha   : 12/31/90 04:02pm
*-- Version : G. REINER
*-- Notas   : MUESTRA POR PANTALLA una liquidacion
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('ORDENANDO EL ARCHIVO DE LIQUIDACION',80,'*') COLOR SCHE 19
@ 24,0 SAY PADC('[ESC] para Terminar',80,' ') COLOR I
ACTI WIND win
SELE liq
GOTO liq->empleado IN emp
GOTO emp->cat IN cat
GOTO emp->con IN con
SET COLOR TO I
@ 0,0 SAY SPACE(234)
@ 0,0 SAY janname
?? fechaliq
? "Per¡odo:"
?? STR(quialiq,1)
IF mesaliq<>13
   ?? '¦ Quincena de '
   ?? ALLTRIM(meses[mesaliq])
ELSE
   ?? '¦ Cuota S.A.C.'
ENDIF
?? ' de '
?? STR(anoaliq,4)
? legajo
?? ' - '
?? emp->apynom
SET COLOR TO W
?? ' - '
?? cat->categoria
?? ' - '
?? cat->periodo
?
STORE 0 TO tt,hh,aa,rr,ss,gg
STORE 0 TO thh,taa,trr,tss,tgg
STORE 1 TO vhor,vadi,vret,vsal
DO WHILE empleado=persona .AND. .NOT. EOF()
   IF imprime
      IF archivo<>"XXX"
         xa="'"+ALLTRIM(archivo)+"'"
         SELE &xa
         GOTO liq->registro
      ENDIF
      IF liq->filtcon=10
         IF liq->unidad>1
            ? STR(liq->unidad,14,2)
         ELSE
            ? SPACE(14)
         ENDIF
         ?? SPACE(5)
         ?? hortexto
         ?? STR(liq->valor,12,2)
         ?? STR(liq->monto,14,2)
         tt=tt+liq->monto
         hh=hh+liq->monto
      ELSE
         IF liq->filtcon=20
            IF thh=0
               thh=1
               SET COLOR TO I
               ? 'TOTAL HABERES:                                                 '
               ?? STR(hh,14,2)
               SET COLOR TO W
            ENDIF
            ? SPACE(19)
            ?? aditexto
            IF liq->valor<>0
               ?? ' %'
               ?? STR(adimonto,10,2)
            ELSE
               ?? SPACE(12)
            ENDIF
            ?? STR(liq->monto,14,2)
            aa=aa+liq->monto
            tt=tt+liq->monto
         ELSE
            IF liq->filtcon=30
               IF thh=0
                  thh=1
                  SET COLOR TO I
                  ? 'TOTAL HABERES:                                                 '
                  ?? STR(hh,14,2)
                  SET COLOR TO W
               ELSE
                  IF taa=0 .AND. aa<>0
                     taa=1
                     SET COLOR TO I
                     ? 'TOTAL ADICIONALES:                                             '
                     ?? STR(aa,14,2)
                     SET COLOR TO W
                  ENDIF
               ENDIF
               ? SPACE(19)
               ?? retencion
               IF liq->valor<>0
                  ?? ' %'
                  ?? STR(liq->valor,10,2)
               ELSE
                  ?? SPACE(12)
               ENDIF
               rr=rr+ABS(liq->monto)
               ?? STR(ABS(liq->monto),14,2)
               tt=tt+liq->monto
            ELSE
               IF liq->filtcon=40
                  IF thh=0
                     thh=1
                     SET COLOR TO I
                     ? 'TOTAL HABERES:                                                 '
                     ?? STR(hh,14,2)
                     SET COLOR TO W
                  ELSE
                     IF aa<>0 .AND. taa=0
                        SET COLOR TO I
                        ? 'TOTAL ADICIONALES:                                             '
                        ?? STR(aa,14,2)
                        SET COLOR TO W
                        taa=1
                     ELSE
                        IF rr<>0 .AND. trr=0
                           trr=1
                           SET COLOR TO I
                           ? 'TOTAL RETENCIONES:                                             '
                           ?? STR(rr,14,2)
                           SET COLOR TO W
                        ENDIF
                     ENDIF
                  ENDIF
                  IF liq->unidad=1
                     ? SPACE(14)
                  ELSE
                     ? STR(liq->unidad,14,2)
                  ENDIF
                  ?? SPACE(5)
                  ?? salario
                  ?? STR(liq->valor,12,2)
                  ?? STR(liq->monto,14,2)
                  ss=ss+liq->monto
               ELSE
                  IF thh=0
                     thh=1
                     SET COLOR TO I
                     ? 'TOTAL HABERES:                                                 '
                     ?? STR(hh,14,2)
                     SET COLOR TO W
                  ELSE
                     IF aa<>0 .AND. taa=0
                        SET COLOR TO I
                        ? 'TOTAL ADICIONALES:                                             '
                        ?? STR(aa,14,2)
                        SET COLOR TO W
                        taa=1
                     ELSE
                        IF rr<>0 .AND. trr=0
                           trr=1
                           SET COLOR TO I
                           ? 'TOTAL RETENCIONES:                                             '
                           ?? STR(rr,14,2)
                           SET COLOR TO W
                        ELSE
                           IF ss<>0 .AND. tss=0
                              tss=1
                              SET COLOR TO I
                              ? 'TOTAL SALARIO FAMILIAR:                                        '
                              ?? STR(ss,14,2)
                              SET COLOR TO W
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
            IF liq->filtcon=50
               IF liq->monto<>0
                  SET COLOR TO I
                  ? 'REDONDEO         :                                             '
                  ?? STR(liq->monto,14,2)
                  SET COLOR TO W
                  hh=hh+liq->monto
               ENDIF
            ENDIF
            IF liq->filtcon>70
               IF adenrec
                  ? SPACE(19)
                  ?? gasto
                  ?? SPACE(12)
                  ?? STR(ABS(liq->monto),14,2)
                  gg=gg+ABS(liq->monto)
               ENDIF
            ENDIF
         ENDIF
      ENDIF
   ENDIF
   SELE liq
   SKIP
ENDDO
IF thh=0
   thh=1
   SET COLOR TO I
   ? 'TOTAL HABERES:                                                 '
   ?? STR(hh,14,2)
   SET COLOR TO W
ELSE
   IF aa<>0 .AND. taa=0
      SET COLOR TO I
      ? 'TOTAL ADICIONALES:                                             '
      ?? STR(aa,14,2)
      SET COLOR TO W
      taa=1
   ELSE
      IF rr<>0 .AND. trr=0
         trr=1
         SET COLOR TO I
         ? 'TOTAL RETENCIONES:                                             '
         ?? STR(rr,14,2)
         SET COLOR TO W
      ELSE
         IF ss<>0 .AND. tss=0
            tss=1
            SET COLOR TO I
            ? 'TOTAL SALARIO FAMILIAR:                                        '
            ?? STR(ss,14,2)
            SET COLOR TO W
         ELSE
            IF gg<>0
               SET COLOR TO I
               ? 'TOTAL ADELANTOS:                                               '
               ?? STR(gg,14,2)
               SET COLOR TO W
            ENDIF
         ENDIF
      ENDIF
   ENDIF
ENDIF
SET COLOR TO I
? 'NETO A PERCIBIR:                                               '
?? STR(aa+hh-rr+ss-gg,14,2)
SET COLOR TO W/B,B,B
RETURN
*: EOF: LLIQP1.PRG

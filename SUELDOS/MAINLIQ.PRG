               ************************ inicio de la liquidaci¢n **********************
STORE 0 TO cho
DO elijan
IF jannro<>0 .AND. LASTKEY()<>27
   DO actliq
   IF LASTKEY()<>27
      ON KEY DO ERROR
      DO opliq
      DO opemp
      SELE liq
      canrec=RECC()
      ulpr=PROGRAM()
      @ 0,34 SAY TIME() COLOR I
      @ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
      @ 24,0 SAY PADC('ORDENANDO EL ARCHIVO DE LIQUIDACION',80,'*') COLOR SCHE 19
      SELE liq
      DO chliq
      @ 0,34 SAY TIME() COLOR I
      @ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
      SET ORDER TO 1
      ulpr=PROGRAM()
      SELE thor
      SCAN
         ha=horvarmon
         hb=horvarhs
         STORE 0 TO &ha
         STORE 0 TO &hb
      ENDSCAN
      RELE ha,hb
      SAVE ALL LIKE tt* TO parcial
      SELE liq
      @ 24,0 SAY PADC('CALCULANDO SUELDOS Y JORNALES - [TECLA] Interrumpe',80,'*') COLOR SCHE 19
      IF xix=2
         DEFINE WIND win FROM 1,1 TO 23,79
      ELSE
         DEFINE WIND win FROM 10,0 TO 14,79
      ENDIF
      ACTI WIND win
      GOTO TOP
      ea=0
      vez=1
      ON ERROR DO error1
      DO WHILE .NOT. EOF()
         IF empleado<>ea
            IF vez<>1
               GOTO ea IN emp
               REPL emp->haberret WITH habdesc
               REPL emp->habersin WITH tothab-habdesc
               REPL emp->adicret WITH totadides
               REPL emp->adicsin WITH totadi-totadides
               REPL emp->reten WITH totret
               REPL emp->salar WITH totsal
               REPL emp->adelan WITH totgas
               REPL emp->redondeo WITH totred
               REPL emp->total WITH totadi+tothab-totret+totsal-totgas+totred
               IF xix=2
                  IF tothab<>0 .AND. vhab=0
                     SET COLOR TO I
                     ? 'TOTAL HABERES:                                               '
                     ?? STR(tothab,14,2)
                     SET COLOR TO W
                  ELSE
                     IF totadi<>0 .AND. vadi=0
                        SET COLOR TO I
                        ? 'TOTAL ADICIONALES:                                           '
                        ?? STR(totadi,14,2)
                        SET COLOR TO W
                        vadi=1
                     ELSE
                        IF totret<>0 .AND. vret=0
                           SET COLOR TO I
                           ? 'TOTAL RETENCIONES:                                           '
                           ?? STR(totret,14,2)
                           SET COLOR TO W
                           vret=1
                        ELSE
                           IF totsal<>0 .AND. vgas=0
                              SET COLOR TO I
                              ? 'TOTAL SALARIO FAMILIAR:                                      '
                              ?? STR(totsal,14,2)
                              SET COLOR TO W
                              vgas=1
                           ELSE
                              IF totgas<>0
                                 SET COLOR TO I
                                 ? 'TOTAL ADELANTOS:                                             '
                                 ?? STR(totgas,14,2)
                                 SET COLOR TO W
                              ENDIF
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
                  SET COLOR TO I
                  ? 'NETO A PERCIBIR:                                            '
                  ?? STR(totadi+tothab-totret+totsal-totgas+totred,14,2)
                  SET COLOR TO W
                  CLEA
                  STORE 0 TO cho
               ENDIF
            ENDIF
            REST FROM parcial ADDI
            SELE liq
            ea=empleado
            vez=2
            ************************* INICIO RLIQ1 *********************
            STORE 0 TO habdesc,habbon,tothab,tthtb,totoprem,totprod,totpres,totadi,totadides,tthoprem,tthprod,tthpres,habapo,tthprem,totprem
            STORE 0 TO totret,totadi,totsal,vhor,vadi,vret,vhab,vgas,totgas,totadiapo,totred,confor
            *********************** NO VA EN RLIQ1 *************************
            DO WHILE .T. .AND. .NOT. EOF()
               ****************************************************************
               GOTO liq->empleado IN emp
               GOTO emp->cat IN cat
               IF emp->jan<>jannro .OR. .NOT. emp->noliq .OR. (cat->periodo='M' .AND. quialiq=1)
                  SELE liq
                  REPLACE liq->imprime WITH .F. WHILE ea=liq->empleado
                  ea=empleado
               ELSE
                  GOTO emp->con IN con
                  @ 0,0 SAY legajo COLOR SCHE 3
                  ?? ' - '
                  @ 0,15 SAY emp->apynom COLOR SCHE 3
                  ?? ' - '
                  ?? cat->categoria
                  ?? ' - '
                  ?? cat->periodo
                  ?
                  SELE liq
                  *********************** NO VA EN RLIQ1 ************************
                  STORE 0 TO cho
                  EXIT
               ENDIF
            ENDDO
         ENDIF
         IF .NOT. EOF()
            ******************************************************************
            *** VA --> DO WHILE EMPLEADO=PERSONA ****
            ****************************************************************
            IF archivo<>"XXX"
               xa="'"+ALLTRIM(archivo)+"'"
               SELE &xa
               GOTO liq->registro
            ENDIF
            IF liq->filtcon=10
               STORE cho+1 TO cho
               IF liq->valor1=0
                  IF hortipo='P'
                     IF hormonto=0
                        A=IIF(cat->periodo='Q',horformqui,horformmes)
                        IF .NOT. EMPTY(A)
                           A=&a
                        ELSE
                           A=0
                        ENDIF
                     ELSE
                        A=cat->sueldo+cat->sueldo*hormonto/100
                     ENDIF
                  ELSE
                     A=hormonto
                  ENDIF
               ELSE
                  A=liq->valor1
               ENDIF
               A=ROUND(A,2)
               REPL liq->valor WITH A
               IF A<>0
                  IF xix=2
                     IF liq->unidad>1
                        ? STR(liq->unidad,14,2)
                     ELSE
                        ? SPACE(14)
                     ENDIF
                     ?? SPACE(5)
                     ?? hortipohor
                     ?? STR(A,12,2)
                  ENDIF
                  IF liq->unidad>0
                     tp=ROUND(A*liq->unidad,2)
                  ELSE
                     tp=ROUND(A,2)
                  ENDIF
                  IF xix=2
                     ?? STR(tp,14,2)
                  ENDIF
                  A=horvarmon
                  STORE tp TO &a
                  A=horvarhs
                  REPL liq->monto WITH tp
                  REPL liq->imprime WITH .T.
                  STORE liq->unidad TO &a
                  tothab=tothab+tp
                  tthtb=tthtb+liq->unidad
                  IF horret='SI'
                     habdesc=habdesc+tp
                  ENDIF
                  IF horbon='SI'
                     habbon=habbon+tp
                  ENDIF
                  IF horproduc='SI'
                     tthprod=tthprod+liq->unidad
                     totprod=totprod+tp
                  ENDIF
                  IF horpremio='SI'
                     tthprem=tthprem+liq->unidad
                     totprem=totprem+tp
                  ENDIF
                  IF horpresen='SI'
                     tthpres=tthpres+liq->unidad
                     totpres=totpres+tp
                  ENDIF
               ENDIF
               IF cho=1
                  IF con->basconf .AND. cat->periodo='M'
                     SELE liq
                     pst=RECNO()
                     DO WHILE filtcon<>20 .AND. ea=empleado .AND. .NOT. EOF()
                        SKIP
                     ENDDO
                     IF ea=empleado
                        DO WHILE filtcon=20 .AND. ea=empleado
                           GOTO liq->registro IN adi
                           SELE adi
                           IF adi->adiconf='SI'
                              IF VAL(adiper)=quialiq .OR. AT(adiper,'RCS')<>0
                                 IF AT(adiper,"12SR")<>0 .OR. (adiper='C' .AND. adivez=adicont)
                                    IF aditipo='P'
                                       IF liq->unidad=0
                                          IF adimonto=0
                                             A=IIF(cat->periodo='Q',adiformqui,adiformmes)
                                             IF EMPTY(A)
                                                A=0
                                             ELSE
                                                A=&a
                                             ENDIF
                                          ELSE
                                             A=m->habbon*adimonto/100
                                          ENDIF
                                       ELSE
                                          A=m->habbon*liq->unidad/100
                                       ENDIF
                                    ELSE
                                       A=IIF(liq->unidad=0,adimonto,liq->unidad)
                                    ENDIF
                                    tp=ROUND(A,2)
                                    confor=confor+tp
                                 ENDIF
                              ENDIF
                           ENDIF
                           SELE liq
                           SKIP
                        ENDDO
                     ENDIF
                     SELE liq
                     GOTO pst IN liq
                  ENDIF
               ENDIF
               SELE liq
            ELSE
               IF liq->filtcon=20
                  IF xix=2
                     IF tothab<>0 .AND. vhab=0
                        SET COLOR TO I
                        ? 'TOTAL HABERES:                                               '
                        ?? STR(tothab,14,2)
                        SET COLOR TO W
                     ENDIF
                     ? SPACE(19)
                     ?? adicional
                  ENDIF
                  IF VAL(adiper)=quialiq .OR. AT(adiper,'RCS')<>0
                     IF AT(adiper,"12SR")<>0 .OR. (adiper='C' .AND. adivez=adicont)
                        vhab=1
                        IF aditipo='P'
                           IF liq->unidad=0
                              IF adimonto=0
                                 A=IIF(cat->periodo='Q',adiformqui,adiformmes)
                                 IF EMPTY(A)
                                    A=0
                                 ELSE
                                    A=&a
                                    IF xix=2
                                       ?? SPACE(12)
                                    ENDIF
                                 ENDIF
                              ELSE
                                 A=m->habbon*adimonto/100
                                 REPL liq->valor WITH adimonto
                                 IF xix=2
                                    ?? ' %'
                                    ?? STR(adimonto,10,2)
                                 ENDIF
                              ENDIF
                           ELSE
                              A=m->habbon*liq->unidad/100
                              REPL liq->valor WITH liq->unidad
                              IF xix=2
                                 ?? ' %'
                                 ?? STR(liq->unidad,10,2)
                              ENDIF
                           ENDIF
                        ELSE
                           A=IIF(liq->unidad=0,adimonto,liq->unidad)
                           REPL liq->valor WITH 0
                           IF xix=2
                              ?? SPACE(12)
                           ENDIF
                        ENDIF
                        tp=ROUND(A,2)
                        IF tp<>0
                           IF xix=2
                              ?? STR(tp,14,2)
                           ENDIF
                           IF adiret='SI'
                              totadides=totadides+tp
                           ENDIF
                           IF adiapo='SI'
                              totadiapo=totadiapo+tp
                           ENDIF
                        ENDIF
                        REPL liq->monto WITH tp
                        REPL liq->imprime WITH tp<>0
                        totadi=totadi+tp
                     ELSE
                        REPL liq->imprime WITH .F.
                     ENDIF
                  ELSE
                     REPL liq->imprime WITH .F.
                  ENDIF
               ELSE
                  IF liq->filtcon=30
                     IF xix=2
                        IF tothab<>0 .AND. vhab=0
                           SET COLOR TO I
                           ? 'TOTAL HABERES:                                               '
                           ?? STR(tothab,14,2)
                           SET COLOR TO W
                           vhab=1
                        ELSE
                           IF totadi<>0 .AND. vadi=0
                              SET COLOR TO I
                              ? 'TOTAL ADICIONALES:                                           '
                              ?? STR(totadi,14,2)
                              SET COLOR TO W
                           ENDIF
                        ENDIF
                     ENDIF
                     IF VAL(retper)=quialiq .OR. AT(retper,'RS')<>0 .OR. (retper='C' .AND. retvez=retcont)
                        IF xix=2 .AND. retquien='O'
                           ? SPACE(19)
                           ?? retencion
                        ENDIF
                        vadi=1
                        IF rettipo='P'
                           IF liq->unidad=0
                              IF retmonto=0
                                 A=IIF(cat->periodo='Q',retformqui,retformmes)
                                 IF EMPTY(A)
                                    A=0
                                 ELSE
                                    A=&a
                                    IF xix=2 .AND. retquien='O'
                                       ?? SPACE(12)
                                    ENDIF
                                 ENDIF
                              ELSE
                                 A=(m->habdesc+m->totadides)*retmonto/100
                                 REPL liq->valor WITH retmonto
                                 IF xix=2 .AND. retquien='O'
                                    ?? ' %'
                                    ?? STR(retmonto,10,2)
                                 ENDIF
                              ENDIF
                           ELSE
                              A=(m->habdesc+m->totadides)*liq->unidad/100
                              REPL liq->valor WITH liq->unidad
                              IF xix=2 .AND. retquien='O'
                                 ?? ' %'
                                 ?? STR(liq->unidad,10,2)
                              ENDIF
                           ENDIF
                        ELSE
                           A=retmonto
                           IF xix=2 .AND. retquien='O'
                              ?? SPACE(12)
                           ENDIF
                        ENDIF
                        A=ROUND(A,2)
                        tp=A
                        IF tp<>0
                           IF xix=2 .AND. retquien='O'
                              ?? STR(tp,14,2)
                           ENDIF
                           REPL liq->monto WITH tp*-1
                           REPL liq->imprime WITH ret->retquien<>"P"
                           totret=totret+IIF(retquien='P',0,tp)
                        ELSE
                           REPL liq->monto WITH 0
                           REPL liq->imprime WITH .F.
                        ENDIF
                     ELSE
                        REPL liq->imprime WITH .F.
                     ENDIF
                  ELSE
                     IF liq->filtcon=40
                        IF xix=2
                           IF totadi<>0 .AND. vadi=0
                              SET COLOR TO I
                              ? 'TOTAL ADICIONALES:                                           '
                              ?? STR(totadi,14,2)
                              SET COLOR TO W
                              vadi=1
                           ELSE
                              IF totret<>0 .AND. vret=0
                                 SET COLOR TO I
                                 ? 'TOTAL RETENCIONES:                                           '
                                 ?? STR(totret,14,2)
                                 SET COLOR TO W
                                 vret=1
                              ENDIF
                           ENDIF
                        ENDIF
                        IF emp->pagsal<>'NO'
                           IF VAL(salper)=quialiq .OR. AT(salper,'RCS')<>0
                              A=salmonto
                              IF A=-1
                                 A=m->totsal
                              ENDIF
                              IF liq->unidad=1
                                 IF xix=2
                                    ? SPACE(14)
                                 ENDIF
                              ELSE
                                 IF xix=2
                                    ? STR(liq->unidad,14,2)
                                 ENDIF
                              ENDIF
                              IF xix=2
                                 ?? SPACE(5)
                                 ?? salario
                                 ?? STR(A,12,2)
                              ENDIF
                              tp=ROUND(A*liq->unidad,2)
                              IF tp<>0
                                 IF xix=2
                                    ?? STR(tp,14,2)
                                 ENDIF
                                 totsal=totsal+tp
                              ENDIF
                              REPL liq->monto WITH tp
                              REPL liq->valor WITH A
                              REPL liq->imprime WITH tp<>0
                           ELSE
                              REPL liq->imprime WITH .F.
                           ENDIF
                        ELSE
                           REPL ALL liq->imprime WITH .F. WHILE liq->filtcon=40 .AND. liq->empleado=ea
                        ENDIF
                     ELSE
                        IF totadi<>0 .AND. vadi=0
                           IF xix=2
                              SET COLOR TO I
                              ? 'TOTAL ADICIONALES:                                           '
                              ?? STR(totadi,14,2)
                              SET COLOR TO W
                              vadi=1
                           ELSE
                              IF totret<>0 .AND. vret=0
                                 SET COLOR TO I
                                 ? 'TOTAL RETENCIONES:                                           '
                                 ?? STR(totret,14,2)
                                 SET COLOR TO W
                                 vret=1
                              ELSE
                                 IF totsal<>0 .AND. vgas=0
                                    SET COLOR TO I
                                    ? 'TOTAL SALARIO FAMILIAR:                                      '
                                    ?? STR(totsal,14,2)
                                    SET COLOR TO W
                                    vgas=1
                                 ENDIF
                              ENDIF
                           ENDIF
                        ENDIF
                        IF liq->filtcon=50
                           IF m->redondeo<>0
                              mt=m->totadi+m->tothab-m->totret+m->totsal
                              IF tipored='A'
                                 remedio=m->redondeo
                                 A=MOD(mt,m->redondeo)
                                 IF A<>0
                                    fsaj=ROUN(INT(mt/m->redondeo)*m->redondeo+m->redondeo,2)
                                    A=fsaj-mt
                                 ELSE
                                    fsaj=mt
                                 ENDI
                              ELSE
                                 remedio=INT(m->redondeo/2)
                                 A=MOD(mt,m->redondeo)
                                 IF A<>0
                                    fsaj=ROUN(INT(mt/m->redondeo)*m->redondeo,2)
                                    IF A<remedio
                                       fsaj=fsaj
                                    ELSE
                                       fsaj=fsaj+m->redondeo
                                    ENDI
                                    A=fsaj-mt
                                 ELSE
                                    A=0
                                    fsaj=mt
                                 ENDI
                              ENDI
                              totred=A
                              REPL liq->monto WITH totred
                              REPL liq->imprime WITH totred<>0
                              IF A<>0
                                 IF xix=2
                                    SET COLOR TO I
                                    ? 'REDONDEO         :                                          '
                                    ?? STR(totred,14,2)
                                    SET COLOR TO W
                                 ENDIF
                              ENDIF
                           ENDIF
                        ELSE
                           IF liq->fechaven<=fliz
                              vgas=1
                              IF xix=2
                                 ? SPACE(19)
                                 ?? gasto
                                 ?? SPACE(12)
                              ENDIF
                              A=1
                              tp=liq->unidad
                              IF tp<>0
                                 IF xix=2
                                    ?? STR(tp,14,2)
                                 ENDIF
                                 totgas=totgas+tp
                              ENDIF
                              REPL liq->monto WITH tp*-1
                              REPL liq->imprime WITH m->adenrec
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
         ENDIF
         SELE liq
         IF .NOT. EOF()
            SKIP
         ENDIF
      ENDDO
      IF LASTKEY()<>27
         SELE emp
         GOTO ea
         REPL emp->haberret WITH habdesc
         REPL emp->habersin WITH tothab-habdesc
         REPL emp->adicret WITH totadides
         REPL emp->adicsin WITH totadi-totadides
         REPL emp->reten WITH totret
         REPL emp->salar WITH totsal
         REPL emp->adelan WITH totgas
         REPL emp->redondeo WITH totred
         REPL emp->total WITH totadi+tothab-totret+totsal-totgas+totred
         IF quialiq=1
            REPL emp->acummes WITH tothab+totadi
         ENDIF
         IF xix=2
            IF tothab<>0 .AND. vhab=0
               SET COLOR TO I
               ? 'TOTAL HABERES:                                               '
               ?? STR(tothab,14,2)
               SET COLOR TO W
            ELSE
               IF totadi<>0 .AND. vadi=0
                  SET COLOR TO I
                  ? 'TOTAL ADICIONALES:                                           '
                  ?? STR(totadi,14,2)
                  SET COLOR TO W
                  vadi=1
               ELSE
                  IF totret<>0 .AND. vret=0
                     SET COLOR TO I
                     ? 'TOTAL RETENCIONES:                                           '
                     ?? STR(totret,14,2)
                     SET COLOR TO W
                     vret=1
                  ELSE
                     IF totsal<>0 .AND. vgas=0
                        SET COLOR TO I
                        ? 'TOTAL SALARIO FAMILIAR:                                      '
                        ?? STR(totsal,14,2)
                        SET COLOR TO W
                        vgas=1
                     ELSE
                        IF liq->filtcon>70
                           IF totgas<>0
                              SET COLOR TO I
                              ? 'TOTAL ADELANTOS:                                             '
                              ?? STR(totgas,14,2)
                              SET COLOR TO W
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF
            ENDIF
            SET COLOR TO I
            ? 'NETO A PERCIBIR:                                             '
            ?? STR(totadi+tothab-totret+totsal-totgas+totred,14,2)
         ENDIF
      ENDIF
      RELE WIND win
      SELE thor
      SCAN
         A=horvarmon
         B=horvarhs
         RELE &a,&b
      ENDSCAN
      RELE A,B,habdesc,habbon,tothab,tthtb,totoprem,totprod,totpres,totadi,totadides,tthoprem,tthprod,tthpres,habapo,tthprem,totprem
      RELE totret,totadi,totsal,vhor,vadi,vret,vhab,totadiapo,mt,remedio,fsaj,totred,pst,confor
      SET INDEX TO
      ON ERROR DO ERROR
   ENDIF
ENDIF
               ************************ fin de la liquidaci¢n *************************

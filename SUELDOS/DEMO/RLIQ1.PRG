*:*********************************************************************
*:
*:        Program: RLIQ1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/23/91     20:35
*:
*:      Called by: RLIQ.PRG
*:               : RLIQ2.PRG
*:
*:          Calls: ERROR1         (procedure in PROCESOS.PRG)
*:               : ERROR          (procedure in PROCESOS.PRG)
*:               : SHAME          (procedure in PROCESOS.PRG)
*:               : HLP            (procedure in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:05               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: rliq1.prg
*-- Fecha   : 01/31/91 00:45am
*-- Version : g. reiner
*-- Notas   : reliquidaci¢n de un empleado
********************************************************************************
ulpr=PROGRAM()
SET TALK OFF
xix=1
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
persona=RECNO("EMP")
@ 24,0 SAY PADC(" Buscando "+ALLTRIM(emp->apynom)+" ",80,"*") COLO SCHE 19
SELE liq
IF RECCOUNT()<>canrec
   @ 24,0 SAY PADC("Ordenando el Archivo de Liquidaci¢n",80,"*") COLOR SCHE 19
   SET ORDER TO 1
   canrec=RECCOUNT()
ENDIF
GOTO TOP
DO WHILE persona<>empleado .AND. .NOT. EOF()
   SKIP
ENDDO
IF .NOT. EOF()
   inicio=RECNO()
   STORE .F. TO hizo
   SCATTER TO uno
   recu=RECNO()
   tres=0
   DO WHILE empleado=persona .AND. filtcon<70
      IF tres=1
         SCATTER TO dos
         IF uno[2]=dos[2] .AND. uno[4]=dos[4] .AND. uno[5]=dos[5]
            recd=RECNO()
            DELE RECO MAX(recu,recd)
            STORE .T. TO hizo
         ENDIF
         SCATTER TO uno
         recu=RECNO()
      ELSE
         tres=1
      ENDIF
      SKIP
   ENDDO
   IF hizo
      @ 24,0 SAY PADC(' Compactando el Archivo de Liquidaci¢n ',80,"*") COLO SCHE 19
      PACK
   ENDIF
   RELE uno,dos,hizo,tres,recu,recd
   @ 24,0 SAY PADC(" Recalculando "+ALLTRIM(emp->apynom)+" ",80,"*") COLO SCHE 19
   SELE jan
IF RECC()=4
   GOTO 1
   IF empresa=CHR(67)+CHR(65)+CHR(80)+CHR(83)+CHR(69)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)
      GOTO 2
	  IF EMPRESA=CHR(70)+CHR(73)+CHR(78)+CHR(67)+CHR(65)+CHR(83)+CHR(32)+CHR(82)+CHR(73)+CHR(79)+CHR(74)+CHR(65)+CHR(78)+CHR(65)+CHR(83)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)
	     GOTO 3
         IF EMPRESA=CHR(67)+CHR(65)+CHR(80)+CHR(83)+CHR(69)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)+CHR(32)+CHR(40)+CHR(77)+CHR(65)+CHR(82)+CHR(32)+CHR(68)+CHR(69)+CHR(76)+CHR(32)+CHR(80)+CHR(76)+CHR(65)+CHR(84)+CHR(65)+CHR(41)
            GOTO 4
            IF EMPRESA=CHR(67)+CHR(65)+CHR(80)+CHR(83)+CHR(69)+CHR(32)+CHR(83)+CHR(46)+CHR(65)+CHR(46)+CHR(32)+CHR(40)+CHR(67)+CHR(65)+CHR(80)+CHR(46)+CHR(32)+CHR(66)+CHR(69)+CHR(82)+CHR(77)+CHR(85)+CHR(68)+CHR(69)+CHR(90)+CHR(41)
         SELE thor
         SCAN
            ha=horvarmon
            hb=horvarhs
            STORE 0 TO &ha
            STORE 0 TO &hb
         ENDSCAN
         RELE ha,hb
         DEFINE WIND win FROM 10,0 TO 14,79
         ACTI WIND win
         SELE liq
         GOTO inicio
         ************************* INICIO RLIQ1 *********************
         STORE 0 TO habdesc,habbon,tothab,tthtb,totoprem,totprod,totpres,totadi,totadides,tthoprem,tthprod,tthpres,habapo,tthprem,totprem
         STORE 0 TO totret,totadi,totsal,vhor,vadi,vret,vhab,vgas,totgas,totadiapo,totred,confor,cho
         ON ERROR DO error1
         GOTO liq->empleado IN emp
         GOTO emp->cat IN cat
         IF emp->jan<>jannro .OR. .NOT. emp->noliq .OR. (cat->periodo='M' .AND. quialiq=1)
            SELE liq
            REPLACE liq->imprime WITH .F. WHILE persona=liq->empleado
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
            DO WHILE empleado=persona
               IF archivo<>"XXX"
                  xa="'"+ALLTRIM(archivo)+"'"
                  SELE &xa
                  GOTO liq->registro
               ENDIF
               IF liq->filtcon=10
                  IF liq->valor1=0
                     STORE cho+1 TO cho
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
                     IF liq->unidad>0
                        tp=ROUND(A*liq->unidad,2)
                     ELSE
                        tp=ROUND(A,2)
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
                        DO WHILE filtcon<>20 .AND. persona=empleado .AND. .NOT. EOF()
                           SKIP
                        ENDDO
                        IF persona=empleado
                           DO WHILE filtcon=20 .AND. persona=empleado
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
                                    ENDIF
                                 ELSE
                                    A=m->habbon*adimonto/100
                                    REPL liq->valor WITH adimonto
                                 ENDIF
                              ELSE
                                 A=m->habbon*liq->unidad/100
                                 REPL liq->valor WITH liq->unidad
                              ENDIF
                           ELSE
                              A=IIF(liq->unidad=0,adimonto,liq->unidad)
                              REPL liq->valor WITH 0
                           ENDIF
                           tp=ROUND(A,2)
                           IF tp<>0
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
                        IF VAL(retper)=quialiq .OR. AT(retper,'RS')<>0 .OR. (retper='C' .AND. retvez=retcont)
                           vadi=1
                           IF rettipo='P'
                              IF liq->unidad=0
                                 IF retmonto=0
                                    A=IIF(cat->periodo='Q',retformqui,retformmes)
                                    IF EMPTY(A)
                                       A=0
                                    ELSE
                                       A=&a
                                    ENDIF
                                 ELSE
                                    A=(m->habdesc+m->totadides)*retmonto/100
                                    REPL liq->valor WITH retmonto
                                 ENDIF
                              ELSE
                                 A=(m->habdesc+m->totadides)*liq->unidad/100
                                 REPL liq->valor WITH liq->unidad
                              ENDIF
                           ELSE
                              A=retmonto
                           ENDIF
                           A=ROUND(A,2)
                           tp=A
                           IF tp<>0
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
                           IF emp->pagsal<>'NO'
                              IF VAL(salper)=quialiq .OR. AT(salper,'RCS')<>0
                                 IF liq->valor1=0
                                    A=salmonto
                                    IF A=-1
                                       A=m->totsal
                                    ENDIF
                                 ELSE
                                    A=liq->valor1
                                 ENDIF
                                 tp=ROUND(A*liq->unidad,2)
                                 IF tp<>0
                                    totsal=totsal+tp
                                 ENDIF
                                 REPL liq->monto WITH tp
                                 REPL liq->valor WITH A
                                 REPL liq->imprime WITH tp<>0
                              ELSE
                                 REPL liq->imprime WITH .F.
                              ENDIF
                           ELSE
                              REPL ALL liq->imprime WITH .F. WHILE liq->filtcon=40 .AND. liq->empleado=persona
                           ENDIF
                        ELSE
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
                                 REPL liq->imprime WITH .t.
                              ENDIF
                           ELSE
                              IF liq->fechaven<=fliz
                                 vgas=1
                                 A=1
                                 tp=liq->unidad
                                 IF tp<>0
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
               SELE liq
               IF .NOT. EOF()
                  SKIP
               ENDIF
            ENDDO
            IF LASTKEY()<>27
               SELE emp
               GOTO persona
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
            ENDIF
            RELE WIND win
            SELE thor
            SCAN
               A=horvarmon
               B=horvarhs
               RELE &a,&b
            ENDSCAN
            RELE A,B,habdesc,habbon,tothab,tthtb,totoprem,totprod,totpres,totadi,totadides,tthoprem,tthprod,tthpres,habapo,tthprem,totprem
            RELE totret,totadi,totsal,vhor,vadi,vret,vhab,totadiapo,mt,remedio,fsaj,totred,pst,confor,cho
            ON ERROR DO ERROR
         ENDIF
         ****************** FIN LIQUIDACION ****************
      ELSE
         DO shame
      ENDIF
      ELSE
         DO shame
      ENDIF
      ELSE
         DO shame
      ENDIF
   ELSE
      DO shame
   ENDIF
   ELSE
      DO shame
   ENDIF
  ON KEY LABEL shift-f1 DO hlp
ENDIF
ON ERROR DO ERROR
@ 24,0 SAY SPACE(80)
RELE inicio,persona
RETURN
*: EOF: RLIQ1.PRG

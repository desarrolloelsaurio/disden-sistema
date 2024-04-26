*:*********************************************************************
*:
*:        Program: LLIQI.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/23/91     20:35
*:
*:      Called by: LIQUID.PRG
*:
*:          Calls: IMPRESOR.PRG
*:               : ABPR           (procedure in PROCESOS.PRG)
*:               : LLIQI1.PRG
*:               : LLIQI2.PRG
*:               : LLIQI3.PRG
*:               : LLIQI4.PRG
*:               : PAGEHEAD.PRG
*:               : LLIQI5.PRG
*:               : ELIEMP()       (function  in PROCESOS.PRG)
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:               : HLP            (procedure in PROCESOS.PRG)
*:               : SHAME          (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:46               FoxDoc  version 2.01
*:*********************************************************************
procedure lliqi
********************************************************************************
*-- Programa: lliqi.prg
*-- Fecha   : 12/31/90 03:38pm
*-- Version : G. REINER
*-- Notas   : deriva al listado de recibos de sueldo por impresora
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
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
					goto jannro
      vz=0
      @ 24,0 SAY PADC(" Imprimiendo Recibos de Sueldo de "+ALLTRIM(janname)+' ',80,'*') COLOR SCHE 19
      DO WHILE .NOT. PRINTSTATUS()
         DO impresor
         IF LASTKEY()=27
            RETURN TO MASTER
         ENDIF
      ENDDO
      ON KEY DO abpr
      _PEJECT="NONE"
      _PLENGTH=tfr[acform,1]
      _RMARGIN=tfr[acform,3]
      _PAGENO=1
      _PLINENO=0
      IF acform=1
         _PSCODE='{27}{64}{27}{67}{72}'
      ELSE
         IF acform<>2
            A='{27}{64}{27}{67}{'+STR(tfr[acform,1],2)+'{27}{48}'
            _PSCODE=A
         ELSE
            _PSCODE='{27}{64}{27}{67}{54}'
         ENDIF
      ENDIF
      _PECODE='{27}{64}'
      _PLINENO=1
      _PLOFFSET=0
      _ALIGNMENT='LEFT'
      _PADVANCE="LINEFEEDS"
      _PCOPIES=tfr[acform,2]
      DO CASE
      CASE BAR()=1
         SELE liq
         GOTO TOP
         LOCATE FOR imprime
         IF .NOT. EOF()
            GOTO liq->empresa IN jan
            vl=recaliq
            ea=0
            SET DEVICE TO PRINT
            SET CONSOLE OFF
            SET PRINTER ON
            PRINT
               recaliq=vl
               SCAN FOR imprime
                  ea=empleado
                  DO CASE
                  CASE acform=1
                     DO lliqi1
                  CASE acform=2
                     DO lliqi2
                  CASE acform=3
                     DO lliqi3
                  CASE acform=4
                     DO lliqi4
                  CASE acform=5
                     IF vz=0
                        vz=1
                        DO pagehead
                        ?
                        _WRAP=.T.
                        _ALIGNMENT='RIGHT'
                        ? fechaliq
                        ? 'LIQUIDACION DE SUELDOS Y JORNALES'
                        ? 'Periodo '
                        IF mesaliq=13
                           ?? STR(quialiq,1)+'¦ Cuota S.A.C. '
                        ELSE
                           IF cat->periodo='M'
                              ?? 'Mes de '
                           ELSE
                              ?? STR(quialiq,1)+'¦ Quincena de '
                           ENDI
                           ?? LEFT(meses[MESALIQ],3)
                           ?? ' de '
                        ENDIF
                        ?? STR(anoaliq,4)
                        _WRAP=.F.
                        ? REPL("-",80)
                        ? REPL("-",80)
                     ENDIF
                     DO lliqi5
                  ENDCASE
               ENDSCAN
               EJECT PAGE
            ENDPRINTJOB
         ENDIF
      CASE BAR()=2
         respuesta=0
         IF eliemp("a Listar")<>0
            GOTO respuesta
            persona=RECNO("EMP")
            SELE liq
            GOTO TOP
            @ 24,0 SAY PADC(" Buscando "+ALLTRIM(emp->apynom)+" ",80,'*') COLOR SCHE 19
            DO WHILE empleado<>persona .AND. .NOT. EOF()
               SKIP
            ENDDO
            @ 24,0 SAY PADC(" Imprimiendo Recibos de Sueldo de "+ALLTRIM(janname)+' ',80,'*') COLOR I/W*
            SET DEVICE TO PRINT
            SET CONSOLE OFF
            SET PRINTER ON
            IF .NOT. EOF()
               vl=recaliq
               rcd=RECNO()
               PRINT
                  GOTO rcd
                  recaliq=vl
                  DO WHILE .NOT. imprime
                     SKIP
                  ENDDO
                  ea=empleado
                  DO CASE
                  CASE acform=1
                     DO lliqi1
                  CASE acform=2
                     DO lliqi2
                  CASE acform=3
                     DO lliqi3
                  CASE acform=4
                     DO lliqi4
                  CASE acform=5
                     DO pagehead
                     ?
                     _WRAP=.T.
                     _ALIGNMENT='RIGHT'
                     ? fechaliq
                     ? 'LIQUIDACION DE SUELDOS Y JORNALES'
                     ? 'Periodo '
                     IF mesaliq=13
                        ?? STR(quialiq,1)+'¦ Cuota S.A.C. '
                     ELSE
                        IF cat->periodo='M'
                           ?? 'Mes de '
                        ELSE
                           ?? STR(quialiq,1)+'¦ Quincena de '
                        ENDI
                        ?? LEFT(meses[MESALIQ],3)
                        ?? ' de '
                     ENDIF
                     ?? STR(anoaliq,4)
                     _WRAP=.F.
                     ? REPL("-",80)
                     ? REPL("-",80)
                     DO lliqi5
                  ENDCASE
                  EJECT PAGE
               ENDPRINTJOB
            ENDIF
         ENDIF
      CASE BAR()=3
         STORE 0 TO respuesta
         IF elicat("a Imprimir")<>0
            GOTO respuesta
            SELE liq
            GOTO TOP
            @ 24,0 SAY PADC(" Imprimiendo los recibos requeridos ",80,"*") COLOR SCHE 19
            SET DEVICE TO PRINT
            SET CONSOLE OFF
            SET PRINT ON
            vl=recaliq
            PRINT
               recaliq=vl
               rcd=1
               SELE emp
               SET ORDER TO ordlis
               SCAN FOR cat=RECNO("CAT")
                  persona=RECNO("EMP")
                  SELE liq
                  GOTO rcd
                  DO WHILE empleado<>persona .AND. .NOT. EOF()
                     SKIP
                  ENDDO
                  IF .NOT. EOF()
                     vl=recaliq
                     ea=empleado
                     DO CASE
                     CASE acform=1
                        DO lliqi1
                     CASE acform=2
                        DO lliqi2
                     CASE acform=3
                        DO lliqi3
                     CASE acform=4
                        DO lliqi4
                     CASE acform=5
                        IF vz=0
                           vz=1
                           DO pagehead
                           ?
                           _WRAP=.T.
                           _ALIGNMENT='RIGHT'
                           ? fechaliq
                           ? 'LIQUIDACION DE SUELDOS Y JORNALES'
                           ? 'Periodo '
                           IF mesaliq=13
                              ?? STR(quialiq,1)+'¦ Cuota S.A.C. '
                           ELSE
                              IF cat->periodo='M'
                                 ?? 'Mes de '
                              ELSE
                                 ?? STR(quialiq,1)+'¦ Quincena de '
                              ENDI
                              ?? LEFT(meses[MESALIQ],3)
                              ?? ' de '
                           ENDIF
                           ?? STR(anoaliq,4)
                           _WRAP=.F.
                           ? REPL("-",80)
                           ? REPL("-",80)
                        ENDIF
                        DO lliqi5
                     ENDCASE
                     rcd=RECNO("LIQ")
                  ENDIF
                  SELE emp
               ENDSCAN
            ENDPRINTJOB
         ENDIF
         SET INDEX TO
      CASE BAR()=4
         STORE 0 TO respuesta
         IF elicon("a Imprimir")<>0
            GOTO respuesta
            SELE liq
            GOTO TOP
            @ 24,0 SAY PADC(" Imprimiendo los recibos requeridos ",80,"*") COLOR SCHE 19
            SET DEVICE TO PRINT
            SET CONSOLE OFF
            SET PRINT ON
            vl=recaliq
            PRINT
               recaliq=vl
               rcd=1
               SELE emp
               SET ORDER TO 2
               SCAN FOR con=RECNO("CAT")
                  persona=RECNO("emp")
                  SELE liq
                  GOTO rcd
                  DO WHILE empleado<>persona .AND. .NOT. EOF()
                     SKIP
                  ENDDO
                  IF .NOT. EOF()
                     vl=recaliq
                     ea=empleado
                     DO CASE
                     CASE acform=1
                        DO lliqi1
                     CASE acform=2
                        DO lliqi2
                     CASE acform=3
                        DO lliqi3
                     CASE acform=4
                        DO lliqi4
                     CASE acform=5
                        IF vz=0
                           vz=1
                           DO pagehead
                           ?
                           _WRAP=.T.
                           _ALIGNMENT='RIGHT'
                           ? fechaliq
                           ? 'LIQUIDACION DE SUELDOS Y JORNALES'
                           ? 'Periodo '
                           IF mesaliq=13
                              ?? STR(quialiq,1)+'¦ Cuota S.A.C. '
                           ELSE
                              IF cat->periodo='M'
                                 ?? 'Mes de '
                              ELSE
                                 ?? STR(quialiq,1)+'¦ Quincena de '
                              ENDI
                              ?? LEFT(meses[MESALIQ],3)
                              ?? ' de '
                           ENDIF
                           ?? STR(anoaliq,4)
                           _WRAP=.F.
                           ? REPL("-",80)
                           ? REPL("-",80)
                        ENDIF
                        DO lliqi5
                     ENDCASE
                     rcd=RECNO("LIQ")
                  ENDIF
                  SELE emp
               ENDSCAN
            ENDPRINTJOB
         ENDIF
         SET INDEX TO
      CASE BAR()=5
         STORE 0 TO respuesta
         IF eliccos("a Imprimir")<>0
            GOTO respuesta
            persona=RECNO("CCOS")
            @ 24,0 SAY PADC(" Imprimiendo Recibos de Sueldo de "+ALLTRIM(janname)+' ',80,'*') COLOR I/W*
            SELE liq
            GOTO TOP
            LOCATE FOR imprime .AND. cencos=persona
            IF .NOT. EOF()
               GOTO liq->empresa IN jan
               vl=recaliq
               ea=0
               SET DEVICE TO PRINT
               SET CONSOLE OFF
               SET PRINTER ON
               PRINT
                  recaliq=vl
                  SCAN FOR cencos=persona .AND. imprime
                     ea=empleado
                     DO CASE
                     CASE acform=1
                        DO lliqi1
                     CASE acform=2
                        DO lliqi2
                     CASE acform=3
                        DO lliqi3
                     CASE acform=4
                        DO lliqi4
                     CASE acform=5
                        IF vz=0
                           vz=1
                           DO pagehead
                           ?
                           _WRAP=.T.
                           _ALIGNMENT='RIGHT'
                           ? fechaliq
                           ? 'LIQUIDACION DE SUELDOS Y JORNALES'
                           ? 'Periodo '
                           IF mesaliq=13
                              ?? STR(quialiq,1)+'¦ Cuota S.A.C. '
                           ELSE
                              IF cat->periodo='M'
                                 ?? 'Mes de '
                              ELSE
                                 ?? STR(quialiq,1)+'¦ Quincena de '
                              ENDI
                              ?? LEFT(meses[MESALIQ],3)
                              ?? ' de '
                           ENDIF
                           ?? STR(anoaliq,4)
                           _WRAP=.F.
                           ? REPL("-",80)
                           ? REPL("-",80)
                        ENDIF
                        DO lliqi5
                     ENDCASE
                  ENDSCAN
                  EJECT PAGE
               ENDPRINTJOB
            ENDIF
         ENDIF
      CASE BAR()=6
         STORE 0 TO respuesta
         IF eliesp("a Imprimir")<>0
            GOTO respuesta
            SELE liq
            GOTO TOP
            @ 24,0 SAY PADC(" Imprimiendo los recibos requeridos ",80,"*") COLOR SCHE 19
            SET DEVICE TO PRINT
            SET CONSOLE OFF
            SET PRINT ON
            vl=recaliq
            PRINT
               recaliq=vl
               rcd=1
               SELE emp
               SET ORDER TO 2
               SCAN FOR esp=RECNO("ESP")
                  persona=RECNO("emp")
                  SELE liq
                  GOTO rcd
                  DO WHILE empleado<>persona .AND. .NOT. EOF()
                     SKIP
                  ENDDO
                  IF .NOT. EOF()
                     vl=recaliq
                     ea=empleado
                     DO CASE
                     CASE acform=1
                        DO lliqi1
                     CASE acform=2
                        DO lliqi2
                     CASE acform=3
                        DO lliqi3
                     CASE acform=4
                        DO lliqi4
                     CASE acform=5
                        IF vz=0
                           vz=1
                           DO pagehead
                           ?
                           _WRAP=.T.
                           _ALIGNMENT='RIGHT'
                           ? fechaliq
                           ? 'LIQUIDACION DE SUELDOS Y JORNALES'
                           ? 'Periodo '
                           IF mesaliq=13
                              ?? STR(quialiq,1)+'¦ Cuota S.A.C. '
                           ELSE
                              IF cat->periodo='M'
                                 ?? 'Mes de '
                              ELSE
                                 ?? STR(quialiq,1)+'¦ Quincena de '
                              ENDI
                              ?? LEFT(meses[MESALIQ],3)
                              ?? ' de '
                           ENDIF
                           ?? STR(anoaliq,4)
                           _WRAP=.F.
                           ? REPL("-",80)
                           ? REPL("-",80)
                        ENDIF
                        DO lliqi5
                     ENDCASE
                     rcd=RECNO("LIQ")
                  ENDIF
                  SELE emp
               ENDSCAN
            ENDPRINTJOB
         ENDIF
         SET INDEX TO
      CASE BAR()=7
         STORE 0 TO respuesta
         IF eliemp(" de Partida")<>0
            SET ORDER TO 2
            GOTO respuesta
            SELE liq
            GOTO TOP
            @ 24,0 SAY PADC(" Imprimiendo los recibos requeridos ",80,"*") COLOR SCHE 19
            LOCATE FOR legajo=emp->legajo
            SET DEVICE TO PRINT
            SET CONSOLE OFF
            SET PRINT ON
            vl=recaliq
            PRINT
               recaliq=vl
               rcd=1
               SELE emp
               DO WHILE .NOT. EOF()
                  persona=RECNO("emp")
                  SELE liq
                  GOTO rcd
                  DO WHILE empleado<>persona .AND. .NOT. EOF()
                     SKIP
                  ENDDO
                  IF .NOT. EOF()
                     vl=recaliq
                     ea=empleado
                     DO CASE
                     CASE acform=1
                        DO lliqi1
                     CASE acform=2
                        DO lliqi2
                     CASE acform=3
                        DO lliqi3
                     CASE acform=4
                        DO lliqi4
                     CASE acform=5
                        IF vz=0
                           vz=1
                           DO pagehead
                           ?
                           _WRAP=.T.
                           _ALIGNMENT='RIGHT'
                           ? fechaliq
                           ? 'LIQUIDACION DE SUELDOS Y JORNALES'
                           ? 'Periodo '
                           IF mesaliq=13
                              ?? STR(quialiq,1)+'& Cuota S.A.C. '
                           ELSE
                              IF cat->periodo=M'
                                 ?? 'Mes de '
                              ELSE
                                 ?? STR(quialiq,1)+'¦ Quincena de '
                              ENDI
                              ?? LEFT(mEses[MESALIQ],3)
                              ?? ' de '
                           ENDIF
                           ?? STR(anoaliq,4)
                           _WRAP=.F.
                           ? REPL("-",80)
                           ? REPL("-,80)
                        ENDIF
                        DO lliqi5
                     ENDCASE
                     rcd=RECNO("LIQ")
                  ENDIF
                  SELE emp
                  SKIP
               ENDDO
            ENDPRINTJOB
         ENDIF
         SET INDEX TO
      ENDCASE
      ON KEY LABEL shift-f1 DO hlp
      SET DEVI TO SCRE
      SET CONS ON
      SET PRINT OFF
      SET MESS TO
      _RMARGIN=0
      _WRAP=T.
      _alignement=left'
      _WRAP=.F.
      @ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
      @ 24,0 SAY SPACE(80)
      RELE vz,rcd,persona
   ELSEÚ      DO shame
   ENDIF
ELSEÚ   DO shamE
ENDIF
ELSE
   DO shame
ENDIF
ELSE
   DO shame]
ENDIF
ELSE
   DO shamE
ENDIF
RETURN
*: EOF: LLIQI.@RG

********************************************************************************
*-- Programa: Idia1.PRG
*-- Fecha   : 02/24/91 05:45pm
*-- Version : G. REINER
*-- Notas   : INGRESA HORAS TRABAJADAS DE LOS EMPLEADOS en un dกa
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 0,0 TO 22,79 TITL " Ingreso Horas Trabajadas " SHAD COLOR SCHE 8
@ 24,0 SAY PADC('[ESC] para Menฃ - [0] para Anular - [] Prขximo Empleado',80,'*')
SELE emp
=INSMODE(.F.)
maxiom=maxiom(DATE())
SET ORDER TO ordlis
ACTI WIND win
@ 0,0 SAY 'ษออออออออออหออออออออออออออออออออออออออหอออหอออออออออออออออหออออออหอออออออออออป'
@ 1,0 SAY 'บ  Legajo  บApellido y Nombre EmpleadoบDกaบ  Tipo de Hora บ Cant บ C. Costos บ'
@ 2,0 SAY 'ฬออออออออออฮออออออออออออออออออออออออออฮอออฮอออออออออออออออฮออออออฮอออออออออออน'
FOR ren=3 TO 19
   @ ren,0 SAY 'บ          บ                          บ   บ               บ      บ           บ'
NEXT
@ ren,0 SAY 'ศออออออออออสออออออออออออออออออออออออออออออสอออออออออออออออสออออออสอออออออออออผ'
ren=3
STORE DAY(DATE()) TO iom
SCAN FOR &fisc
   sigue=.T.
   sigue1=.T.
   DO WHILE .T.
      ACTI WIND win
      @ ren,0 SAY 'บ          บ                          บ   บ               บ      บ           บ'
      SELE emp
      mpl=legajo
      mplnm=left(emp->apynom,25)
      @ ren,1 GET mpl;
         MESS 'Legajo del Empleado - [ESC] Menฃ - [0] Anula - [] Prขximo Empleado'
      @ ren,12 SAY LEFT(mplnm,26)
      READ
      IF LASTKEY()<>24
         IF LASTKEY()<>27
            IF mpl<>legajo
               SELE emp
               SET ORDER TO 2
               SEEK mpl
               ACTI WIND win
               SET ORDER TO ordlis
               IF FOUND()
                  respuesta=RECNO("EMP")
                  mpl=legajo
                  mplnm=left(emp->apynom,25)
                  @ ren,1 SAY mpl
                  @ ren,12 SAY LEFT(mplnm,26)
               ELSE
                  sigue=.F.
               ENDIF
            ENDIF
            IF sigue
               @ ren,40 GET iom PICT '99'
               READ
               IF iom>0 .AND. iom<=maxiom
                  respuesta=0
                  store elithor(" de "+ALLTRIM(emp->apynom)) to m->horas
                  IF m->horas<>0
                     ACTI WIND win
                     GOTO m->horas
                     @ ren,43 SAY LEFT(hortipohor,15)
                     cantidad=0
                     @ ren,59 GET cantidad PICTURE '999.99';
                        MESS 'Cantidad de Horas Trabajadas'
                     READ
                     IF cantidad<>0
                        GOTO emp->ccos IN ccos
                        cx=LEFT(ccos->cencos,11)
                        cxn=RECNO('CCOS')
                        @ ren,66 GET cx;
                           MESS 'Centro de Costos al que se Cargan las Horas'
                        READ
                        IF LASTKEY()<>27
                           IF ccos->cencos<>cx
                              respuesta=0
                              DO WHILE eliccos(' de la Hora')=0
                              ENDDO
                              cxn=respuesta
                              GOTO cxn IN ccos
                              cx=LEFT(ccos->cencos,11)
                              ACTI WIND win
                              @ ren,66 SAY cx
                           ENDIF
                        ELSE
                           sigue1=.F.
                        ENDIF
                        IF sigue1
                           ren=ren+1
                           SELE dia
                           APPE BLAN
                           REPL legajo WITH emp->legajo
                           REPL fecha WITH iom
                           REPL thor WITH m->horas
                           REPL horas WITH cantidad
                           REPL ccos WITH cxn
                           REPL empleado WITH RECNO("EMP")
                           SELE emp
                           IF ren=20
                              ACTI WIND win
                              @ 0,0 SAY 'ษออออออออออหออออออออออออออออออออออออออหอออหอออออออออออออออหออออออหอออออออออออป'
                              @ 1,0 SAY 'บ  Legajo  บApellido y Nombre EmpleadoบDกaบ  Tipo de Hora บ Cant บ C. Costos บ'
                              @ 2,0 SAY 'ฬออออออออออฮออออออออออออออออออออออออออฮอออฮอออออออออออออออฮออออออฮอออออออออออน'
                              FOR ren=3 TO 19
                                 @ ren,0 SAY 'บ          บ                          บ   บ               บ      บ           บ'
                              NEXT
                              @ ren,0 SAY 'ศออออออออออสออออออออออออออออออออออออออออออสอออออออออออออออสออออออสอออออออออออผ'
                              ren=3
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF
            ELSE
               EXIT
            ENDIF
         ELSE
            EXIT
         ENDIF
      ELSE
         EXIT
      ENDIF
   ENDDO
   IF LASTKEY()=27
      EXIT
   ENDIF
   SELE emp
ENDSCAN
RELE WIND win
RELE mpl,mnlnm,sigue,sigue1,cx,cxn,horas,cantidad,iom,maxiom,mes
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: IDIA1.PRG

*:*********************************************************************
*:
*:        Program: IHOR1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: IHOR.PRG                      
*:
*:          Calls: ELITHOR()      (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:03               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: IHOR1.PRG
*-- Fecha   : 11/10/90 06:12pm
*-- Version : G. REINER
*-- Notas   : INGRESA HORAS TRABAJADAS DE LOS EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 0,0 TO 22,79 TITL " Ingreso Horas Trabajadas " SHAD COLOR SCHE 8
@ 24,0 SAY PADC('[ESC] para Menฃ - [0] para Anular - [] Prขximo Empleado',80,'*')
SELE emp
=INSMODE(.F.)
SET ORDER TO ordlis
ACTI WIND win
STORE 0 TO sumcont
STORE 0 TO sumtot
STORE 0 TO concepto
@ 10,10 SAY 'Ingrese Total de Horas a Ingresar ' GET sumcont PICTURE '999999999.99'
READ
CLEA
@ 0,0 SAY 'ษออออออออออหออออออออออออออออออออออออออออออหอออออออออออออออหออออออหอออออออออออป'
@ 1,0 SAY 'บ  Legajo  บApellido y Nombre del Empleadoบ  Tipo de Hora บ Cant บ C. Costos บ'
@ 2,0 SAY 'ฬออออออออออฮออออออออออออออออออออออออออออออฮอออออออออออออออฮออออออฮอออออออออออน'
FOR ren=3 TO 19
   @ ren,0 SAY 'บ          บ                              บ               บ      บ           บ'
NEXT
@ ren,0 SAY 'ศออออออออออสออออออออออออออออออออออออออออออสอออออออออออออออสออออออสอออออออออออผ'
ren=3
SCAN FOR &fisc
   sigue=.T.
   sigue1=.T.
   DO WHILE .T.
      ACTI WIND win
      @ ren,0 SAY 'บ          บ                              บ               บ      บ           บ'
      SELE emp
      mpl=legajo
      mplnm=ALLTRIM(emp->apynom)
      @ ren,1 GET mpl;
         MESS 'Legajo del Empleado - [ESC] Menฃ - [0] Anula - [] Prขximo Empleado'
      @ ren,12 SAY mplnm
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
                  mplnm=ALLTRIM(emp->apynom)
                  @ ren,1 SAY mpl
                  @ ren,12 SAY mplnm
               ELSE
                  sigue=.F.
               ENDIF
            ENDIF
            IF sigue
               respuesta=0
               horas=elithor(" de "+ALLTRIM(emp->apynom))
               IF horas<>0
                  ACTI WIND win
                  GOTO horas
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
                        SELE liq
                        APPE BLAN
                        nada=CTOD('31/12/99')
                        REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 10,archivo WITH 'THOR',registro WITH RECNO("THOR"),unidad WITH cantidad,fechaven WITH IIF(thor->horreset='SI',DATE(),nada),INFORMA WITH thor->horinfo='SI'
                        REPL cencos WITH cxn,empleado WITH RECNO("EMP")
                        SELE emp
                        STORE cantidad+sumtot TO sumtot
                        STORE concepto+1 TO concepto
                        IF ren=20
                           ACTI WIND win
                           @ 0,0 SAY 'ษออออออออออหออออออออออออออออออออออออออออออหอออออออออออออออหออออออหอออออออออออป'
                           @ 1,0 SAY 'บ  Legajo  บApellido y Nombre del Empleadoบ  Tipo de Hora บ Cant บ C. Costos บ'
                           @ 2,0 SAY 'ฬออออออออออฮออออออออออออออออออออออออออออออฮอออออออออออออออฮออออออฮอออออออออออน'
                           FOR ren=3 TO 19
                              @ ren,0 SAY 'บ          บ                              บ               บ      บ           บ'
                           NEXT
                           @ ren,0 SAY 'ศออออออออออสออออออออออออออออออออออออออออออสอออออออออออออออสออออออสอออออออออออผ'
                           ren=3
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
IF sumtot<>sumcont .AND. sumcont<>0
   STORE sumtot-sumcont TO resta
   CLEA
   @ 5,0 SAY PADC(" SE ENCONTRARON DIFERENCIAS ",78,"*") COLO SCHE 19
   @ 10,10 SAY 'Se ingresaron  '
   ?? ALLTRIM(STR(concepto))
   ?? ' Conceptos'
   @ 12,10 SAY 'Total de Horas Informadas: ' GET sumtot PICTURE '9999999999.99' COLO SCHE 3
   @ 14,10 SAY 'Total de Horas Previstas : ' GET sumcont PICTURE '9999999999.99' COLO SCHE 3
   @ 16,10 SAY 'Diferencia Encontrada    : ' GET resta PICTURE '9999999999.99' MESS 'Tecla para Continuar' COLO SCHE 3
   CLEAR GETS
   DO WHILE INKEY()=0
   ENDDO
ENDIF
RELE WIND win
RELE mpl,mnlnm,sigue,sigue1,cx,cxn,horas,cantidad,nada,sumtot,sumcont,resta
@ 24,0 SAY SPACE(80)
RETURN

*: EOF: IHOR1.PRG

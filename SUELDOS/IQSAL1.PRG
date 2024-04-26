*:*********************************************************************
*:
*:        Program: IQSAL1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: IQSAL.PRG                     
*:
*:          Calls: ELISAL()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:05               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: IQSAL1.PRG
*-- Fecha   : 11/10/90 06:12pm
*-- Version : G. REINER
*-- Notas   : INGRESA SALARIO FAMILIAR DE LOS EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
=INSMODE(.F.)
DEFINE WINDOW win FROM 0,3 TO 22,76 TITL " Ingreso Salario Familiar " SHAD COLOR SCHE 8
@ 24,0 SAY PADC('[ESC] para Menฃ - [0] para Anular - [] Prขximo Empleado',80,' ')
SELE emp
SET ORDER TO ordlis
ACTI WIND win
@ 0,0 SAY 'ษออออออออออหออออออออออออออออออออออออออออออหออออออออออออออออออออหออออออป'
@ 1,0 SAY 'บ  Legajo  บApellido y Nombre del Empleadoบ Rubro Salario Fam. บ Cant บ'
@ 2,0 SAY 'ฬออออออออออฮออออออออออออออออออออออออออออออฮออออออออออออออออออออฮออออออน'
FOR ren=3 TO 19
   @ ren,0 SAY 'บ          บ                              บ                    บ      บ'
NEXT
@ ren,0 SAY 'ศออออออออออสออออออออออออออออออออออออออออออสออออออออออออออออออออสออออออผ'
ren=3
SCAN FOR &fisc
   sigue=.T.
   sigue1=.T.
   DO WHILE .T.
      ACTI WIND win
      @ ren,0 SAY 'บ          บ                              บ                    บ      บ'
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
            SET ORDER TO 1
            IF sigue
               respuesta=0
               horas=elisal(" de "+ALLTRIM(emp->apynom))
               IF horas<>0
                  ACTI WIND win
                  GOTO horas
                  @ ren,43 SAY salario
                  cantidad=0
                  @ ren,64 GET cantidad PICTURE '999999';
                     MESS 'Cantidad de Casos'
                  READ
                  IF cantidad<>0
                     SELE liq
                     APPE BLAN
                     nada=CTOD('31/12/99')
                     REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 40,archivo WITH 'SAL',registro WITH RECNO("SAL"),unidad WITH cantidad,fechaven WITH sal->salvenc,INFORMA WITH .F.
                     REPL cencos WITH emp->ccos,empleado WITH RECNO("EMP")
                     ren=ren+1
                     SELE emp
                     SET ORDER TO ordlis
                     IF ren=20
                        ACTI WIND win
                        @ 0,0 SAY 'ษออออออออออหออออออออออออออออออออออออออออออหออออออออออออออออออออหออออออป'
                        @ 1,0 SAY 'บ  Legajo  บApellido y Nombre del Empleadoบ Rubro Salario Fam. บ Cant บ'
                        @ 2,0 SAY 'ฬออออออออออฮออออออออออออออออออออออออออออออฮออออออออออออออออออออฮออออออน'
                        FOR ren=3 TO 19
                           @ ren,0 SAY 'บ          บ                              บ                    บ      บ'
                        NEXT
                        @ ren,0 SAY 'ศออออออออออสออออออออออออออออออออออออออออออสออออออออออออออออออออสออออออผ'
                        ren=3
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
RELE mpl,mnlnm,sigue,sigue1,cx,cxn,horas,cantidad,nada
@ 24,0 SAY SPACE(80)
RETURN

*: EOF: IQSAL1.PRG

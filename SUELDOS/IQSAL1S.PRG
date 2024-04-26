*:*********************************************************************
*:
*:        Program: IQSAL1S.PRG
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
*:      Documented 04/23/91 at 20:09               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: IQSAL1s.PRG
*-- Fecha   : 11/10/90 06:12pm
*-- Version : G. REINER
*-- Notas   : INGRESA SALARIO FAMILIAR DE un EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 0,3 TO 22,76 TITL " Ingreso Salario Familiar de "+ALLTRIM(emp->apynom) SHAD COLOR SCHE 8
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
SELE emp
mpl=legajo
mplnm=ALLTRIM(emp->apynom)
DO WHILE .T.
   ACTI WIND win
   @ ren,0 SAY 'บ          บ                              บ                    บ      บ'
   @ ren,1 GET mpl
   @ ren,12 SAY mplnm
   CLEAR GETS
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
         REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 40,archivo WITH 'SAL',registro WITH HORAS,unidad WITH cantidad,fechaven WITH sal->salvenc,INFORMA WITH .F.
         REPL cencos WITH emp->ccos,empleado WITH RECNO("EMP")
         ren=ren+1
         SELE emp
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
   ELSE
      EXIT
   ENDIF
ENDDO
RELE WIND win
RELE mpl,mnlnm,sigue,sigue1,cx,cxn,horas,cantidad,nada
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: IQSAL1S.PRG

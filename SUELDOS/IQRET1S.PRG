*:*********************************************************************
*:
*:        Program: IQRET1S.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: IQRET.PRG
*:
*:          Calls: ELIRET()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: IQret1s.PRG
*-- Fecha   : 11/10/90 06:12pm
*-- Version : G. REINER
*-- Notas   : INGRESA Retenciones de un solo empleado EN ARCHIVO DE LIQUIDACION
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 0,0 TO 22,79 TITL " Ingreso Retenciones "+ALLTRIM(emp->apynom) SHAD COLOR SCHE 8
@ 24,0 SAY PADC('[ESC] para Menฃ - [0] para Anular',80,' ')
SELE emp
SET ORDER TO ordlis
ACTI WIND win
@ 0,0 SAY 'ษออออออออออหออออออออออออออออออออออออออออออหออออออออออออออออออออหอออออออออออออป'
@ 1,0 SAY 'บ  Legajo  บApellido y Nombre del Empleadoบ     Retenciขn      บ    Monto    บ'
@ 2,0 SAY 'ฬออออออออออฮออออออออออออออออออออออออออออออฮออออออออออออออออออออฮอออออออออออออน'
FOR ren=3 TO 19
   @ ren,0 SAY  'บ          บ                              บ                    บ             บ'
NEXT
@ ren,0 SAY 'ศออออออออออสออออออออออออออออออออออออออออออสออออออออออออออออออออสอออออออออออออผ'
ren=3
mpl=legajo
mplnm=ALLTRIM(emp->apynom)
DO WHILE .T.
   ACTI WIND win
   @ ren,0 SAY  'บ          บ                              บ                    บ             บ'
   SELE emp
   @ ren,1 GET mpl
   @ ren,12 SAY mplnm
   CLEAR GETS
   respuesta=0
   horas=eliret(" de "+ALLTRIM(emp->apynom))
   IF horas<>0
      ACTI WIND win
      GOTO horas
      @ ren,43 SAY retencion
      STORE 0 TO camut
      @ ren,64 GET camut PICTURE '9999999999.99' MESS 'Enter para valores por Defecto - [ESC] para Anular'
      READ
      IF LASTKEY()<>27
         ren=ren+1
         SELE liq
         APPE BLAN
         nada=CTOD('31/12/99')
         REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 30,archivo WITH 'RET',registro WITH horas,unidad WITH camut,fechaven WITH IIF(ret->retreset='SI',DATE(),nada),INFORMA WITH .F.
         REPL cencos WITH emp->ccos,empleado WITH RECNO("EMP")
         SELE emp
         IF ren=20
            ACTI WIND win
            @ 0,0 SAY 'ษออออออออออหออออออออออออออออออออออออออออออหออออออออออออออออออออหอออออออออออออป'
            @ 1,0 SAY 'บ  Legajo  บApellido y Nombre del Empleadoบ     Retenciขn      บ    Monto    บ'
            @ 2,0 SAY 'ฬออออออออออฮออออออออออออออออออออออออออออออฮออออออออออออออออออออฮอออออออออออออน'
            FOR ren=3 TO 19
               @ ren,0 SAY  'บ          บ                              บ                    บ             บ'
            NEXT
            @ ren,0 SAY 'ศออออออออออสออออออออออออออออออออออออออออออสออออออออออออออออออออสอออออออออออออผ'
            ren=3
         ENDIF
      ENDIF
   ELSE
      EXIT
   ENDIF
ENDDO
RELE WIND win
RELE mpl,mnlnm,sigue,sigue1,cx,cxn,horas,nada,camut
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: IQRET1S.PRG

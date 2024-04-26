*:*********************************************************************
*:
*:        Program: IQADI1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: IQADI.PRG                     
*:
*:          Calls: ELIADI()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: IQADI1.PRG
*-- Fecha   : 11/10/90 06:12pm
*-- Version : G. REINER
*-- Notas   : INGRESA ADICIONALES EN ARCHIVO DE LIQUIDACION
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
=INSMODE(.F.)
DEFINE WINDOW win FROM 0,0 TO 22,79 TITL " Ingreso Adicionales " SHAD COLOR SCHE 8
@ 24,0 SAY PADC('[ESC] para Menฃ - [0] para Anular - [] Prขximo Empleado',80,' ')
SELE emp
SET ORDER TO ordlis
ACTI WIND win
@ 0,0 SAY 'ษออออออออออหออออออออออออออออออออออออออออออหออออออออออออออออออออหอออออออออออออป'
@ 1,0 SAY 'บ  Legajo  บApellido y Nombre del Empleadoบ     Adicional      บ    Monto    บ'
@ 2,0 SAY 'ฬออออออออออฮออออออออออออออออออออออออออออออฮออออออออออออออออออออฮอออออออออออออน'
FOR ren=3 TO 19
   @ ren,0 SAY  'บ          บ                              บ                    บ             บ'
NEXT
@ ren,0 SAY 'ศออออออออออสออออออออออออออออออออออออออออออสออออออออออออออออออออสอออออออออออออผ'
ren=3
SCAN FOR &fisc
   sigue=.T.
   sigue1=.T.
   DO WHILE .T.
      ACTI WIND win
      @ ren,0 SAY  'บ          บ                              บ                    บ             บ'
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
            SELE emp
            SET ORDER TO 1
            IF sigue
               respuesta=0
               horas=eliadi(" de "+ALLTRIM(emp->apynom))
               IF horas<>0
                  ACTI WIND win
                  GOTO horas
                  @ ren,43 SAY adicional
                  STORE 0 TO camut
                  @ ren,64 GET camut PICTURE '9999999999.99' MESS 'Enter para valores por Defecto - [ESC] para Anular'
                  READ
                  IF LASTKEY()<>27
                     ren=ren+1
                     SELE liq
                     APPE BLAN
                     nada=CTOD('31/12/99')
                     REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 20,archivo WITH 'ADI',registro WITH RECNO("ADI"),unidad WITH camut,fechaven WITH IIF(adi->adireset='SI',DATE(),nada),INFORMA WITH .F.
                     REPL cencos WITH emp->ccos,empleado WITH RECNO("EMP")
                     SELE emp
                     IF ren=20
                        ACTI WIND win
                        @ 0,0 SAY 'ษออออออออออหออออออออออออออออออออออออออออออหออออออออออออออออออออหอออออออออออออป'
                        @ 1,0 SAY 'บ  Legajo  บApellido y Nombre del Empleadoบ     Adicional      บ    Monto    บ'
                        @ 2,0 SAY 'ฬออออออออออฮออออออออออออออออออออออออออออออฮออออออออออออออออออออฮอออออออออออออน'
                        FOR ren=3 TO 19
                           @ ren,0 SAY  'บ          บ                              บ                    บ             บ'
                        NEXT
                        @ ren,0 SAY 'ศออออออออออสออออออออออออออออออออออออออออออสออออออออออออออออออออสอออออออออออออผ'
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
RELE mpl,mnlnm,sigue,sigue1,cx,cxn,horas,nada,camut
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: IQADI1.PRG

********************************************************************************
*-- Programa: GLSAL1.PRG
*-- Fecha   : 11/10/90 06:12pm
*-- Version : G. REINER
*-- Notas   : INGRESO GLOBAL SALARIO FAMILIAR DE LOS EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 0,3 TO 22,76
respuesta=0
IF elisal(' a Ingresar')<>0
   GOTO respuesta
   horas=RECNO()
   @ 24,0 SAY PADC('[ESC] para Men� - [0] para Anular - [] Pr�ximo Empleado',80,' ')
   SELE emp
   SET ORDER TO ordlis
   DEFINE WINDOW win FROM 0,3 TO 22,76 TITL " Ingreso Salario Familiar " SHAD COLOR SCHE 8
   ACTI WIND win
   @ 0,0 SAY '���������������������������������������������������������������������ͻ'
   @ 1,0 SAY '�  Legajo  �Apellido y Nombre del Empleado� Rubro Salario Fam. � Cant �'
   @ 2,0 SAY '���������������������������������������������������������������������͹'
   FOR ren=3 TO 19
      @ ren,0 SAY '�          �                              �                    �      �'
   NEXT
   @ ren,0 SAY '���������������������������������������������������������������������ͼ'
   ren=3
   SCAN FOR &fisc
      sigue=.T.
      sigue1=.T.
      DO WHILE .T.
         ACTI WIND win
         @ ren,0 SAY '�          �                              �                    �      �'
         SELE emp
         mpl=legajo
         mplnm=ALLTRIM(emp->apynom)
         @ ren,1 GET mpl;
            MESS 'Legajo del Empleado - [ESC] Men� - [0] Anula - [] Pr�ximo Empleado'
         @ ren,12 SAY mplnm
         READ
         IF LASTKEY()<>24
            IF LASTKEY()<>27
               IF mpl<>legajo
                  SELE emp
                  SET ORDER TO 2
                  SEEK mpl
                  ACTI WIND win
               ENDIF
               SET ORDER TO ordlis
               IF .NOT. EOF()
                  mpl=legajo
                  mplnm=ALLTRIM(emp->apynom)
                  @ ren,1 SAY mpl
                  @ ren,12 SAY mplnm
               ELSE
                  sigue=.F.
               ENDIF
               IF sigue
                  respuesta=0
                  @ ren,43 SAY sal->salario
                  cantidad=0
                  @ ren,64 GET cantidad PICTURE '999999';
                     MESS 'Cantidad de Horas Trabajadas'
                  READ
                  IF cantidad<>0
                     SELE liq
                     APPE BLAN
                     nada=CTOD('31/12/99')
                     REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 40,archivo WITH 'SAL',registro WITH horas,unidad WITH cantidad,fechaven WITH sal->salvenc,INFORMA WITH .F.
                     REPL cencos WITH emp->ccos,empleado WITH RECNO("EMP")
                     ren=ren+1
                     SELE emp
                     IF ren=20
                        ACTI WIND win
                        @ 0,0 SAY '���������������������������������������������������������������������ͻ'
                        @ 1,0 SAY '�  Legajo  �Apellido y Nombre del Empleado� Rubro Salario Fam. � Cant �'
                        @ 2,0 SAY '���������������������������������������������������������������������͹'
                        FOR ren=3 TO 19
                           @ ren,0 SAY '�          �                              �                    �      �'
                        NEXT
                        @ ren,0 SAY '���������������������������������������������������������������������ͼ'
                        ren=3
                     ENDIF
                     EXIT
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
      SELE emp
      IF LASTKEY()=27
         EXIT
      ENDIF
   ENDSCAN
ENDIF
RELE WIND win
RELE mpl,mnlnm,sigue,sigue1,cx,cxn,horas,cantidad,nada
@ 24,0 SAY SPACE(80)
RETURN

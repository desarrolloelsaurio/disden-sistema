********************************************************************************
*-- Programa: Idia1s.PRG
*-- Fecha   : 02/24/91 05:45pm
*-- Version : G. REINER
*-- Notas   : INGRESA HORAS TRABAJADAS DE un solo EMPLEADOS en un d�a
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 0,0 TO 22,79 TITL " Ingreso Horas Trabajadas " SHAD COLOR SCHE 8
@ 24,0 SAY PADC('[ESC] para Men� - [0] para Anular - [] Pr�ximo Empleado',80,'*')
SELE emp
=INSMODE(.F.)
maxiom=maxiom(DATE())
ACTI WIND win
@ 0,0 SAY '����������������������������������������������������������������������������ͻ'
@ 1,0 SAY '�  Legajo  �Apellido y Nombre Empleado�D�a�  Tipo de Hora � Cant � C. Costos �'
@ 2,0 SAY '����������������������������������������������������������������������������͹'
FOR ren=3 TO 19
   @ ren,0 SAY '�          �                          �   �               �      �           �'
NEXT
@ ren,0 SAY '����������������������������������������������������������������������������ͼ'
ren=3
STORE DAY(DATE()) TO iom
sigue=.T.
sigue1=.T.
DO WHILE .T.
   ACTI WIND win
   @ ren,0 SAY '�          �                          �   �               �      �           �'
   SELE emp
   mpl=legajo
   mplnm=ALLTRIM(emp->apynom)
   @ ren,1 GET mpl;
      MESS 'Legajo del Empleado - [ESC] Men� - [0] Anula - [] Pr�ximo Empleado'
   @ ren,12 SAY LEFT(mplnm,26)
   CLEAR GETS
   IF LASTKEY()<>24
      IF LASTKEY()<>27
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
                        @ 0,0 SAY '����������������������������������������������������������������������������ͻ'
                        @ 1,0 SAY '�  Legajo  �Apellido y Nombre Empleado�D�a�  Tipo de Hora � Cant � C. Costos �'
                        @ 2,0 SAY '����������������������������������������������������������������������������͹'
                        FOR ren=3 TO 19
                           @ ren,0 SAY '�          �                          �   �               �      �           �'
                        NEXT
                        @ ren,0 SAY '����������������������������������������������������������������������������ͼ'
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
RELE WIND win
RELE mpl,mnlnm,sigue,sigue1,cx,cxn,horas,cantidad,iom,maxiom,mes
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: IDIA1S.PRG

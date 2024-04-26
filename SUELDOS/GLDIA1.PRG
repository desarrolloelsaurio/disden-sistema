********************************************************************************
*-- Programa: GLDIA1.PRG
*-- Fecha   : 02/27/91 03:57pm
*-- Version : G. REINER
*-- Notas   : INGRESO GLOBAL HORAS TRABAJADAS EN UN DIA
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
=INSMODE(.F.)
DEFINE WINDOW win FROM 10,0 TO 14,79
respuesta=0
IF elithor(' a Ingresar')<>0
   GOTO respuesta
   tipo=respuesta
   DEFINE WINDOW win FROM 10,0 TO 14,77 TITL " Fecha de Horas Trabajadas " SHAD COLOR SCHE 8
   ACTI WIND win
   STORE DAY(DATE()) TO iom
   @ 1,10 SAY 'Fecha de las Horas' GET iom PICTURE '99';
      MESS "Fecha de las Horas a Ingresar - [ESC] para Menฃ"
   READ
   RELE WIND win
   maxiom=maxiom(DATE())
   IF iom>0 .AND. iom<=maxiom .AND. LASTKEY()<>27
      DEFINE WINDOW win FROM 0,0 TO 22,79 TITL " Ingreso Global de "+ALLTRIM(hortipohor)+' ' COLOR SCHE 8
      @ 24,0 SAY PADC('[ESC] para Menฃ - [0] para Anular - [] Prขximo Empleado',80,'*')
      ACTI WIND win
      @ 0,0 SAY 'ษออออออออออหออออออออออออออออออออออออออหอออหอออออออออออออออหออออออหอออออออออออป'
      @ 1,0 SAY 'บ  Legajo  บApellido y Nombre EmpleadoบDกaบ  Tipo de Hora บ Cant บ C. Costos บ'
      @ 2,0 SAY 'ฬออออออออออฮออออออออออออออออออออออออออฮอออฮอออออออออออออออฮออออออฮอออออออออออน'
      FOR ren=3 TO 19
         @ ren,0 SAY 'บ          บ                          บ   บ               บ      บ           บ'
      NEXT
      @ ren,0 SAY 'ศออออออออออสออออออออออออออออออออออออออออออสอออออออออออออออสออออออสอออออออออออผ'
      ren=3
      SELE emp
      SET ORDER TO ordlis
      SCAN FOR &fisc
         @ ren,0 SAY 'บ          บ                          บ   บ               บ      บ           บ'
         mpl=emp->legajo
         mplnm=ALLTRIM(emp->apynom)
         @ ren,1 GET mpl;
            MESS 'Legajo del Empleado - [ESC] Menฃ - [0] Anula - [] Prขximo Empleado'
         @ ren,12 SAY PADR(mplnm,26,' ')
         READ
         IF LASTKEY()<>24
            IF LASTKEY()<>27
               IF mpl<>emp->legajo
                  SET ORDER TO 2
                  SEEK mpl
               ENDIF
               SET ORDER TO ordlis
               IF .NOT. EOF()
                  mpl=legajo
                  mplnm=ALLTRIM(emp->apynom)
                  @ ren,1 SAY PADR(mpl,10,' ')
                  @ ren,12 SAY PADR(mplnm,26,' ')
                  @ ren,40 SAY iom PICT '99'
                  @ ren,43 SAY LEFT(thor->hortipohor,15)
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
                        ren=ren+1
                        SELE dia
                        APPE BLAN
                        REPL legajo WITH emp->legajo
                        REPL fecha WITH iom
                        REPL thor WITH tipo
                        REPL horas WITH cantidad
                        REPL ccos WITH emp->ccos
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
         ENDIF
         IF LASTKEY()=27
            EXIT
         ENDIF
         SELE emp
         ACTI WIND win
      ENDSCAN
   ENDIF
ENDIF
RELE WIND win
RELE mpl,mnlnm,sigue,sgu1,cx,cxn,tipo,cantidad,iom,maxiom
@ 24,0 SAY SPACE(80)
RETURN

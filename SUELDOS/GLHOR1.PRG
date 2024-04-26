********************************************************************************
*-- Programa: GLHOR1.PRG
*-- Fecha   : 11/12/90 03:55pm
*-- Version : G. REINER
*-- Notas   : INGRESO GLOBAL HORAS TRABAJADAS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
=INSMODE(.F.)
DEFINE WINDOW win FROM 10,0 TO 14,79
respuesta=0
IF elithor(' a Ingresar')<>0
   GOTO respuesta
   horas=respuesta
   DEFINE WINDOW win FROM 0,0 TO 22,79 TITL " Ingreso Global de "+ALLTRIM(hortipohor)+' ' COLOR SCHE 8
   @ 24,0 SAY PADC('[ESC] para Menฃ - [0] para Anular - [] Prขximo Empleado',80,'*')
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
   SELE emp
   SET ORDER TO ordlis
   SCAN FOR &fisc
      @ ren,0 SAY 'บ          บ                              บ               บ      บ           บ'
      mpl=emp->legajo
      mplnm=ALLTRIM(emp->apynom)
      @ ren,1 GET mpl;
         MESS 'Legajo del Empleado - [ESC] Menฃ - [0] Anula - [] Prขximo Empleado'
      @ ren,12 SAY PADR(mplnm,30,' ')
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
               @ ren,12 SAY PADR(mplnm,30,' ')
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
                     SELE liq
                     APPE BLAN
                     nada=CTOD('31/12/99')
                     REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 10,archivo WITH 'THOR',registro WITH horas,unidad WITH cantidad,fechaven WITH IIF(thor->horreset='SI',DATE(),nada),INFORMA WITH thor->horinfo='SI'
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
         ENDIF
      ENDIF
      IF LASTKEY()=27
         EXIT
      ENDIF
      SELE emp
      ACTI WIND win
   ENDSCAN
ENDIF
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
   =INKEY(0)
ENDIF
RELE WIND win
RELE mpl,mnlnm,sigue,sgu1,cx,cxn,horas,cantidad,nada,sumtot,sumcont,concepto
@ 24,0 SAY SPACE(80)
RETURN

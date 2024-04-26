*:*********************************************************************
*:
*:        Program: ISAL.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: SAL.PRG                       
*:
*:          Calls: EXISTE         (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:52               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: ISAL.PRG
*-- Fecha   : 02/11/90 / 16:37:10
*-- Version : G. REINER - GENERADOR
*-- Notas   : INGRESA DATOS DE SALARIO FAMILIAR
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 8,20 TO 16,73 TITL " Ingreso Salario Familiar " SHAD COLOR SCHE 8
DEFINE WINDOW win1 FROM 12,23 TO 17,64 TITL " Ingreso Datos de la Retroactividad " SHAD COLOR SCHE 8
SELE sal
me1=" Ingreso Salario Familiar "
DO WHILE .T.
   ACTI WIND win
   SCATTER MEMVAR BLANK
   @ 1,1 SAY "Rubro Salario Familiar" COLOR SCHE 3
   @ 2,1 SAY "Monto" COLOR SCHE 3
   @ 3,1 SAY "Per¡odo de Pago" COLOR SCHE 3
   @ 4,1 SAY "Vencimiento del Adicional" COLOR SCHE 3
   @ 5,1 SAY "Se Borra cada Per¡odo" COLOR SCHE 3
   @ 1,30 GET m->salario;
      PICTURE "XXXXXXXXXXXXXXXXXXXX";
      MESS me1+"- [ENTER] para Men£"
   READ
   IF ISALPHA(ALLTRIM(m->salario))
      m->salario=PROPER(m->salario)
      SET DELE OFF
      SEEK ALLTRIM(m->salario)
      SET DELE ON
      IF .NOT. FOUND()
         m->salper='2¦ Quinc   '
         m->salvenc=CTOD('31/12/99')
         @ 2,1 SAY "Monto" COLOR SCHE 3
         @ 2,30 GET m->salmonto;
            PICTURE "99999999999.99";
            MESS me1+"- Monto del Rubro "+ALLTRIM(m->salario)
         @ 3,1 SAY "Per¡odo de Pago" COLOR SCHE 3
         @ 3,30 GET m->salper PICTURE "@M 2¦ Quinc,Siempre,1¦ Quinc,Aguinaldo,Retroact,Cada Tanto";
            MESS me1+' Cu ndo se paga el Rubro '+ALLTRIM(m->salario)+' ?'
         @ 4,1 SAY "Vencimiento del Adicional" COLOR SCHE 3
         @ 4,30 GET m->salvenc;
            MESS me1+"- Vencimiento del Adicional"
         @ 5,1 SAY "Se Borra cada Per¡odo" COLOR SCHE 3
         @ 5,30 GET m->salreset;
            PICTURE "@m SI,NO";
            MESS me1+"- Cambie Opciones con la Barra"
         READ
         IF m->salper='R'
            ACTI WIND win1
            CLEA
            @ 1,1 SAY "Mes de la Retroactividad" COLOR SCHE 3
            @ 2,1 SAY "Quincena de la Retroactividad" COLOR SCHE 3
            @ 1,38 GET m->salmes RANGE 1,13;
               PICTURE "99";
               MESS me1+"- Mes de la Retroactividad"
            @ 2,38 GET m->salqui;
               PICTURE "9" RANGE 1,2;
               MESS me1+"- Quincena de la Retroactividad"
            READ
            CLEA
            DEAC WIND win1
            ACTI WIND win
         ENDIF
         SELECT sal
         APPEND BLANK
         GATHER MEMVAR
      ELSE
         ACTI SCREEN
         @ 24,0 SAY PADC("Rubro Salario Familiar "+ALLTRIM(m->salario)+' existe - Enter para continuar',80,' ')
         ACTI WIND win
         DO existe WITH " Rubro Salario Familiar"
         DO WHILE INKEY()=0
         ENDDO
         CLEAR
      ENDIF
   ELSE
      EXIT
   ENDIF
   CLEAR
ENDDO
RELE WIND win,win1
RELE salario,salmonto,salper,salmes,salqui,salvenc,salreset,me1
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: ISAL.PRG
